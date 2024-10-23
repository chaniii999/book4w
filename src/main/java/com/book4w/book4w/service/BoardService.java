package com.book4w.book4w.service;


import com.book4w.book4w.dto.request.BookDetailRequestDTO;
import com.book4w.book4w.dto.response.BookDetailResponseDTO;
import com.book4w.book4w.entity.Book;
import com.book4w.book4w.repository.BookRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class BoardService {
    private final BookRepository bookRepository;

    public Page<BookDetailResponseDTO> getBookList(Pageable page) {
        Page<Book> bookPage = bookRepository.findAll(page);
        return bookPage.map(BookDetailResponseDTO::new);
    }

    public Page<BookDetailResponseDTO> getOrderLikeDesc(Pageable page) {
        Page<Book> bookPage = bookRepository.findAllByOrderByLikeCountDesc(page);
        return bookPage.map(BookDetailResponseDTO::new);
    }
    
    public Page<BookDetailResponseDTO> getOrderReviewDesc(Pageable page) {
        Page<Book> bookPage = bookRepository.findAllByOrderByReviewCountDesc(page);
        return bookPage.map(BookDetailResponseDTO::new);
    }

    public Page<BookDetailResponseDTO> getOrderRatingDesc(Pageable page) {
        Page<Book> bookPage = bookRepository.findAllByOrderByRatingDesc(page);
        return bookPage.map(BookDetailResponseDTO::new);
    }

}