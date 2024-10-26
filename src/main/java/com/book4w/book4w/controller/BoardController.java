package com.book4w.book4w.controller;

import com.book4w.book4w.dto.request.ReviewPostRequestDTO;
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
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

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
                       @PageableDefault(size = 9)Pageable page,
                       @RequestParam(required = false) String sort,
                       @RequestParam(required = false) String query) {

        // page 설정에 맞춰 북 목록을 Map에 저장하겠다.
        Page<BookDetailResponseDTO> bookPage;

        if (query != null && !query.trim().isEmpty()) {
            bookPage = getSortedBookPageForSearch(sort,page,query);
        } else {
            bookPage = getSortedBookPage(sort,page);
        }


        model.addAttribute("bList",bookPage.getContent());
        model.addAttribute("maker", bookPage);
        model.addAttribute("sort",sort);
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

    private Page<BookDetailResponseDTO> getSortedBookPageForSearch(String sort, Pageable page, String query) {
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
    public String detailPage(@PathVariable String id, Model model, Pageable page) {
        log.info("Fetching detail for book id: {}", id);

        DetailPageResponseDTO bookDetail = detailService.getBookDetail(id);

        model.addAttribute("book", bookDetail);
        model.addAttribute("reviewList", reviewService.getReviewList(id, page));

        return "detail";
    }

    @PostMapping ("/detail/{bookId}")
    @ResponseBody
    public ReviewResponseDTO addReview(@Validated @RequestBody ReviewPostRequestDTO dto,
                                       BindingResult result, @PathVariable String bookId, HttpSession session) {

        if(result.hasErrors()) {
           return null;
        }

        LoginUserResponseDTO loginUser = (LoginUserResponseDTO) session.getAttribute(LOGIN_KEY);
        if (loginUser != null) {
           dto.setMemberUuid(loginUser.getUuid());
            return reviewService.registerReview(bookId, dto);
        } else {
            return null;
        }


    }


}
