package com.book4w.book4w.service;


import com.book4w.book4w.entity.Book;
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

    public Page<Book> getBookList(Pageable page) {
        return bookRepository.findAll(page);
    }

    public Page<Book> getOrderLikeDesc(Pageable page) {
        return bookRepository.findAllByOrderByLikeCountDesc(page);
    }

    public Page<Book> getOrderReviewDesc(Pageable page) {
        return bookRepository.findAllByOrderByReviewCountDesc(page);
    }

    public Page<Book> getOrderRatingDesc(Pageable page) {
        return bookRepository.findAllByOrderByRatingDesc(page);
    }

}