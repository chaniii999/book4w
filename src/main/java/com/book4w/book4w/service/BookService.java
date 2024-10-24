package com.book4w.book4w.service;

import com.book4w.book4w.entity.Book;
import com.book4w.book4w.repository.BookRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BookService {

    private final BookRepository bookRepository;

//    public List<Book> searchBooks(String query) {
//        // 검색어로 책을 찾는 로직 (예: 책 이름 또는 저자명으로 검색)
//        return bookRepository.findByNameContainingOrWriterContaining(query, query);
//    }
}

