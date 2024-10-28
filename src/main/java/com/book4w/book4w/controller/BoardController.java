package com.book4w.book4w.controller;

import com.book4w.book4w.dto.request.ReviewPostRequestDTO;
import com.book4w.book4w.dto.request.ReviewUpdateRequestDTO;
import com.book4w.book4w.dto.response.BookDetailResponseDTO;
import com.book4w.book4w.dto.response.DetailPageResponseDTO;
import com.book4w.book4w.dto.response.LoginUserResponseDTO;
import com.book4w.book4w.dto.response.ReviewResponseDTO;
import com.book4w.book4w.entity.Book;
import com.book4w.book4w.entity.Review;
import com.book4w.book4w.repository.ReviewRepository;
import com.book4w.book4w.service.BoardService;
import com.book4w.book4w.service.BookService;
import com.book4w.book4w.service.DetailService;
import com.book4w.book4w.service.ReviewService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import lombok.val;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.book4w.book4w.utils.LoginUtils.LOGIN_KEY;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
@Slf4j
public class BoardController {

    private final BoardService boardService;
    private final DetailService detailService;
    private final ReviewService reviewService;

    @GetMapping("/list")
    public String list(Model model,
        @PageableDefault(size = 9) Pageable page,
        @RequestParam(required = false) String sort,
        @RequestParam(required = false) String query) {

        // page 설정에 맞춰 북 목록을 Map에 저장하겠다.
        Page<BookDetailResponseDTO> bookPage;

        if (query != null && !query.trim().isEmpty()) {
            bookPage = getSortedBookPageForSearch(sort, page, query);
        } else {
            bookPage = getSortedBookPage(sort, page);
        }

        model.addAttribute("bList", bookPage.getContent());
        model.addAttribute("maker", bookPage);
        model.addAttribute("sort", sort);
        model.addAttribute("query", query);
        return "list";
    }

    private Page<BookDetailResponseDTO> getSortedBookPage(String sort, Pageable pageable) {
        if (sort == null) {
            return boardService.getBookList(pageable);
        }

        return switch (sort) {
            case "likeCount" -> boardService.getOrderLikeDesc(pageable);
            case "reviewCount" -> boardService.getOrderReviewDesc(pageable);
            case "rating" -> boardService.getOrderRatingDesc(pageable);
            default -> boardService.getBookList(pageable);
        };
    }

    private Page<BookDetailResponseDTO> getSortedBookPageForSearch(String sort, Pageable page,
        String query) {
        Page<BookDetailResponseDTO> books;

        if (sort == null) {
            books = boardService.searchByName(page, query);
        } else {
            books = switch (sort) {
                case "likeCount" -> boardService.searchByNameOrderByLikeDesc(page, query);
                case "reviewCount" -> boardService.searchBookByNameOrderByReviewDesc(page, query);
                case "rating" -> boardService.searchBookByNameOrderByRatingDesc(page, query);
                default -> boardService.searchByName(page, query);
            };
        }

        return books;
    }
    @GetMapping("/detail/{id}")
    public String detailPage(@PathVariable String id,
                             Model model,
                             HttpServletRequest request,
                             @PageableDefault(page = 0, size = 10) Pageable page) {
        log.info("Fetching detail for book id: {}", id);

        HttpSession session = request.getSession();
        LoginUserResponseDTO user = (LoginUserResponseDTO) session.getAttribute(LOGIN_KEY);
        String userId = user != null ? user.getUuid() : null;

        DetailPageResponseDTO bookDetail = detailService.getBookDetail(id, userId);
        Page<ReviewResponseDTO> reviewPage = reviewService.getReviewList(id, page);

        // 책 정보가 제대로 전달되는지 로그로 확인
        log.info("Book detail: {}", bookDetail);

        model.addAttribute("book", bookDetail);
        model.addAttribute("reviewList", reviewPage.getContent());
        model.addAttribute("page", reviewPage);
        model.addAttribute("user", user);  // 추가된 부분

        return "detail";
    }

    @PostMapping("/detail/{bookId}")
    public ResponseEntity<Map<String, Object>> createReview(@Validated @RequestBody ReviewPostRequestDTO dto,
                                                            BindingResult result,
                                                            @PathVariable String bookId) {
        Map<String, Object> response = new HashMap<>();

        if (result.hasErrors()) {
            response.put("success", false);
            response.put("message", result.toString());
            return ResponseEntity.badRequest().body(response);
        }

        Review review = reviewService.register(bookId, dto); // 등록된 리뷰 객체 반환

        response.put("success", true);
        response.put("message", "리뷰가 성공적으로 작성되었습니다.");
        response.put("reviewId", review.getId());
        response.put("nickName", review.getMember().getNickname());
        response.put("content", review.getContent());
        response.put("rating", review.getRating());

        return ResponseEntity.ok(response);
    }




    @GetMapping("/detail/{bookId}/reviews")
    @ResponseBody
    public Map<String, Object> getReviews(
            @PathVariable String bookId,
            @PageableDefault(size = 10) Pageable pageable) {

        // 특정 책의 페이징된 리뷰 목록 가져오기
        Page<ReviewResponseDTO> reviewPage = reviewService.getReviewList(bookId, pageable);

        // 응답 데이터 구성
        Map<String, Object> response = new HashMap<>();
        response.put("reviewList", reviewPage.getContent());
        response.put("page", Map.of(
                "number", reviewPage.getNumber(),
                "totalPages", reviewPage.getTotalPages(),
                "hasPrevious", reviewPage.hasPrevious(),
                "hasNext", reviewPage.hasNext()
        ));

        return response;
    }

    @PostMapping("/detail/{bookId}/review/{reviewId}/edit")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> editReview(@PathVariable String reviewId,
                                                          @RequestBody ReviewUpdateRequestDTO dto) {
        Map<String, Object> response = new HashMap<>();
        try {
            reviewService.updateReview(reviewId, dto.getContent());
            response.put("success", true);
            response.put("message", "리뷰가 성공적으로 수정되었습니다.");
            return ResponseEntity.ok(response); // HTTP 상태 200 반환
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "리뷰 수정 중 오류가 발생했습니다.");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response); // HTTP 상태 500 반환
        }
    }


    @PostMapping("/detail/{id}/toggle-like")
    @ResponseBody
    public Map<String, Object> toggleLike(@PathVariable String id, HttpServletRequest request) {
        HttpSession session = request.getSession();
        LoginUserResponseDTO user = (LoginUserResponseDTO) session.getAttribute(LOGIN_KEY);
        Map<String, Object> response = new HashMap<>();
        if (user != null) {
            boolean isLiked = detailService.toggleLike(id, user.getUuid());
            int likeCount = detailService.getBookDetail(id, user.getUuid()).getLikeCount(); // 좋아요 수 업데이트
            response.put("success", true);
            response.put("isLiked", isLiked);
            response.put("likeCount", likeCount); // 좋아요 수를 응답에 포함
        } else {
            response.put("success", false);
        }
        return response;
    }



}
