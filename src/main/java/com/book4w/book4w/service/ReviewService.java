package com.book4w.book4w.service;

import com.book4w.book4w.dto.response.ReviewResponseDTO;
import com.book4w.book4w.entity.Book;
import com.book4w.book4w.entity.Member;
import com.book4w.book4w.entity.Review;
import com.book4w.book4w.repository.BookRepository;
import com.book4w.book4w.repository.ReviewRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ReviewService {

    private final ReviewRepository reviewRepository;

    public Page<ReviewResponseDTO> getReviewList(String bookId, Pageable page) {
        return reviewRepository.findByBookId(bookId, page).map(ReviewResponseDTO::new);
    }

    public Review createReview(Review review) {

        Book pickBook = review.getBook();
        Member pickMember = review.getMember();

        Review newReview = Review.builder()
                .book(pickBook)
                .member(pickMember)
                .content(review.getContent())
                .build();

        return reviewRepository.save(newReview);
    }

}
