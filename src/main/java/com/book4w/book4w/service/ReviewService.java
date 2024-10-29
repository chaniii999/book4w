package com.book4w.book4w.service;

import com.book4w.book4w.dto.request.ReviewPostRequestDTO;
import com.book4w.book4w.dto.response.ReviewResponseDTO;
import com.book4w.book4w.entity.Book;
import com.book4w.book4w.entity.Member;
import com.book4w.book4w.entity.Review;
import com.book4w.book4w.repository.BookRepository;
import com.book4w.book4w.repository.MemberRepository;
import com.book4w.book4w.repository.ReviewRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReviewService {

    private final ReviewRepository reviewRepository;
    private final MemberRepository memberRepository;
    private final BookRepository bookRepository;

    public Page<ReviewResponseDTO> getReviewList(String bookId, Pageable pageable) {
        return reviewRepository.findByBookIdOrderByCreatedDateDesc(bookId, pageable)
                .map(ReviewResponseDTO::new);
    }

    public Review register(String bookId, ReviewPostRequestDTO dto) {
        Book book = bookRepository.findById(bookId)
                .orElseThrow(() -> new EntityNotFoundException("책을 찾을 수 없습니다."));

        Member member = memberRepository.findById(dto.getMemberUuid())
                .orElseThrow(() -> new EntityNotFoundException("회원 정보를 찾을 수 없습니다."));

        Review review = Review.builder()
                .id(UUID.randomUUID().toString())
                .member(member)
                .book(book)
                .content(dto.getContent())
                .rating(dto.getRating())
                .build();

        reviewRepository.save(review);

        book.setReviewCount(book.getReviewCount() + 1);
        book.setRating(book.getRating() + dto.getRating());
        bookRepository.save(book);

        return review;
    }

    public void updateReview(String reviewId, String newContent, String userId) {
        Review review = reviewRepository.findById(reviewId)
                .orElseThrow(() -> new EntityNotFoundException("리뷰를 찾을 수 없습니다."));

        // 본인의 리뷰인지 확인
        if (!review.getMember().getUuid().equals(userId)) {
            throw new SecurityException("본인의 리뷰만 수정할 수 있습니다.");
        }

        review.setContent(newContent);
        reviewRepository.save(review);
    }

    public void deleteReview(String reviewId, String userId) {
        Review review = reviewRepository.findById(reviewId)
                .orElseThrow(() -> new EntityNotFoundException("리뷰를 찾을 수 없습니다."));

        // 본인의 리뷰인지 확인
        if (!review.getMember().getUuid().equals(userId)) {
            throw new SecurityException("본인의 리뷰만 삭제할 수 있습니다.");
        }

        Book book = review.getBook();
        reviewRepository.deleteById(reviewId);

        book.setReviewCount(book.getReviewCount() - 1);
        book.setRating(book.getRating() - review.getRating());
        bookRepository.save(book);
    }

    public Review findById(String reviewId) {
        return reviewRepository.findById(reviewId)
                .orElseThrow(() -> new EntityNotFoundException("리뷰를 찾을 수 없습니다."));
    }
}
