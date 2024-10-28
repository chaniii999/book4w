package com.book4w.book4w.controller;

import com.book4w.book4w.dto.request.ReviewPostRequestDTO;
import com.book4w.book4w.dto.request.ReviewUpdateRequestDTO;
import com.book4w.book4w.dto.response.ReviewResponseDTO;
import com.book4w.book4w.entity.Review;
import com.book4w.book4w.service.ReviewService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/reviews")
@RequiredArgsConstructor
@Slf4j
public class ReviewController {

    private final ReviewService reviewService;

    // 리뷰 작성
    @PostMapping("/{bookId}")
    public ResponseEntity<Map<String, Object>> createReview(
            @PathVariable String bookId,
            @Valid @RequestBody ReviewPostRequestDTO dto) {
        Map<String, Object> response = new HashMap<>();

        try {
            Review savedReview = reviewService.register(bookId, dto);
            response.put("success", true);
            response.put("message", "리뷰가 성공적으로 작성되었습니다.");
            response.put("reviewId", savedReview.getId());
            response.put("nickname", savedReview.getMember().getNickname());
            response.put("content", savedReview.getContent());
            response.put("rating", savedReview.getRating());
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "리뷰 작성 중 오류가 발생했습니다.");
            log.error("Error creating review", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }

    // 리뷰 수정
    @PutMapping("/{reviewId}")
    public ResponseEntity<Map<String, Object>> updateReview(
            @PathVariable String reviewId,
            @Valid @RequestBody ReviewUpdateRequestDTO dto) {
        Map<String, Object> response = new HashMap<>();

        try {
            reviewService.updateReview(reviewId, dto.getContent());

            Review updatedReview = reviewService.findById(reviewId);

            response.put("success", true);
            response.put("message", "리뷰가 성공적으로 수정되었습니다.");
            response.put("reviewId", updatedReview.getId());
            response.put("nickname", updatedReview.getMember().getNickname());
            response.put("content", updatedReview.getContent());
            response.put("rating", updatedReview.getRating());

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "리뷰 수정 중 오류가 발생했습니다.");
            log.error("Error updating review", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }

    // 리뷰 삭제
    @DeleteMapping("/{reviewId}")
    public ResponseEntity<Map<String, Object>> deleteReview(@PathVariable String reviewId) {
        Map<String, Object> response = new HashMap<>();

        try {
            reviewService.deleteReview(reviewId);
            response.put("success", true);
            response.put("message", "리뷰가 성공적으로 삭제되었습니다.");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "리뷰 삭제 중 오류가 발생했습니다.");
            log.error("Error deleting review", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }

    // 특정 책의 리뷰 목록 조회 (페이징 포함)
    @GetMapping("/book/{bookId}")
    public ResponseEntity<Page<ReviewResponseDTO>> getReviewsByBook(
            @PathVariable String bookId,
            @PageableDefault(size = 10) Pageable pageable) {
        Page<ReviewResponseDTO> reviewPage = reviewService.getReviewList(bookId, pageable);
        return ResponseEntity.ok(reviewPage);
    }
}
