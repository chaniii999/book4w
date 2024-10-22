package com.book4w.book4w.main.service;

import com.book4w.book4w.main.repository.BookRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class BoardService {
    BookRepository bookRepository;
}
