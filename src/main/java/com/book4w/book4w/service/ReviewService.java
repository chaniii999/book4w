package com.book4w.book4w.service;

import com.book4w.book4w.entity.Book;
import com.book4w.book4w.entity.Member;
import com.book4w.book4w.entity.Review;
import com.book4w.book4w.repository.BookRepository;
import com.book4w.book4w.repository.ReviewRepository;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class ReviewService {

    private final ReviewRepository reviewRepository;

    public Review createReview(Review review) {

        Book pickBook = review.getBook();
        Member pickMember = review.getMember();

        review.setBook(pickBook);
        review.setMember(pickMember);
        review.setContent("화이팅 할 수 있다 4W");
        return reviewRepository.save(review);

    }

}
