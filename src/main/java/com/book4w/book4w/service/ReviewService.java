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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.Session;
import org.springframework.boot.autoconfigure.cache.CacheProperties;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreInvocationAuthorizationAdviceVoter;
import org.springframework.stereotype.Service;

import java.io.Console;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReviewService {

    private final ReviewRepository reviewRepository;
    private final MemberRepository memberRepository;
    private final BookRepository bookRepository;


    public Page<ReviewResponseDTO> getReviewList(String bookId, Pageable page) {
        return reviewRepository.findByBookId(bookId, page).map(ReviewResponseDTO::new);
    }


    /* 리뷰 DB저장 후 화면에 출력 */
    public ReviewResponseDTO registerReview(String bookId, ReviewPostRequestDTO dto) {

        Book book = bookRepository.findById(bookId).orElseThrow(() -> new EntityNotFoundException("X"));
        String memberUuid = dto.getMemberUuid();
        Member member = memberRepository.findById(memberUuid).orElseThrow(() -> new EntityNotFoundException("X"));


        // 리뷰 작성하면 DB 저장
        Review review = Review.builder()
                .id(UUID.randomUUID().toString())
                .member(member)
                .book(book)
                .content(dto.getContent())
                .rating(dto.getRating())
                .build();
        reviewRepository.save(review);


        // 리뷰 출력
        return ReviewResponseDTO.builder()
                .memberName(review.getMember().getNickname())
                .content(review.getContent())
                .rating(review.getRating())
                .build();
    }
}

