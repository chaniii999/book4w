package com.book4w.book4w.service;


import com.book4w.book4w.dto.response.BookDetailResponseDTO;
import com.book4w.book4w.entity.Book;

import com.book4w.book4w.repository.BookLikeRepository;
import com.book4w.book4w.repository.BookRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class BoardService {
    private final BookRepository bookRepository;
    private final BookLikeRepository bookLikeRepository;
    private final MemberService memberService;

    // 전체 조회
    public Page<BookDetailResponseDTO> getBookList(Pageable page) {
        Page<Book> bookPage = bookRepository.findAll(page);
        return bookPage.map(BookDetailResponseDTO::new);
    }
    // 좋아요순 조회
    public Page<BookDetailResponseDTO> getOrderLikeDesc(Pageable page) {
        Page<Book> bookPage = bookRepository.findAllByOrderByLikeCountDesc(page);
        return bookPage.map(BookDetailResponseDTO::new);
    }
    // 리뷰순 조회
    public Page<BookDetailResponseDTO> getOrderReviewDesc(Pageable page) {
        Page<Book> bookPage = bookRepository.findAllByOrderByReviewCountDesc(page);
        return bookPage.map(BookDetailResponseDTO::new);
    }
    // 평점순 조회
    public Page<BookDetailResponseDTO> getOrderRatingDesc(Pageable page) {
        Page<Book> bookPage = bookRepository.findAllByOrderByRatingDividedByReviewCountDesc(page);
        return bookPage.map(BookDetailResponseDTO::new);
    }

    // 제목으로 검색
    public Page<BookDetailResponseDTO> searchByName(Pageable page, String query) {
        Page<Book> bookPage = bookRepository.findAllByNameContaining(query, page);
        return bookPage.map(BookDetailResponseDTO::new);
    }

    // 제목검색 + 좋아요순 정렬
    public Page<BookDetailResponseDTO> searchByNameOrderByLikeDesc(Pageable page, String query) {
        Page<Book> bookPage = bookRepository.findAllByNameContainingOrderByLikeCountDesc(query, page);
        return bookPage.map(BookDetailResponseDTO::new);
    }
    // 리뷰순 정렬
    public Page<BookDetailResponseDTO> searchBookByNameOrderByReviewDesc(Pageable page, String query) {
        Page<Book> bookPage = bookRepository.findAllByNameContainingOrderByReviewCountDesc(query, page);
        return bookPage.map(BookDetailResponseDTO::new);
    }
    // 평점 순 정렬
    public Page<BookDetailResponseDTO> searchBookByNameOrderByRatingDesc(Pageable page, String query) {
        Page<Book> bookPage = bookRepository.findAllByNameContainingOrderByRatingDividedByReviewCountDesc(query, page);
        return bookPage.map(BookDetailResponseDTO::new);
    }

}