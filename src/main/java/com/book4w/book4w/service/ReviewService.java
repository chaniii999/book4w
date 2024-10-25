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
import org.hibernate.Session;
import org.springframework.boot.autoconfigure.cache.CacheProperties;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ReviewService {

    private final ReviewRepository reviewRepository;
    private final MemberRepository memberRepository;
    private final BookRepository bookRepository;
    private HttpServletRequest request;

    public String getSessionId() {
        HttpSession session = request.getSession();
        return session.getId();

    }

    public Page<ReviewResponseDTO> getReviewList(String bookId, Pageable page) {
        return reviewRepository.findByBookId(bookId, page).map(ReviewResponseDTO::new);
    }


    public ReviewResponseDTO registerReview(String BookId, ReviewPostRequestDTO dto) {

        Book book = bookRepository.findById(BookId).orElseThrow(() -> new EntityNotFoundException("X"));
        String sessionId =
        member member = memberRepository.findBySessionId(sesionId)

        Review review = Review.builder()
                .id(UUID.randomUUID().toString())
                .member()
                .book(book)
                .content(dto.getContent())
                .rating(dto.getRating())
                .build();

    }
}
