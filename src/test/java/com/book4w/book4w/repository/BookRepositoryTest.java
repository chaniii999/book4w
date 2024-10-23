package com.book4w.book4w.repository;

import com.book4w.book4w.entity.Book;
import jakarta.transaction.Transactional;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class BookRepositoryTest {
    @Autowired
    BookRepository bookRepository;

    @Test
    @DisplayName("더미데이터 생성")
    void createDummy() {
        for (int i = 1; i <= 20; i++) {
            Book book = Book.builder()
                    .id(UUID.randomUUID().toString()) // UUID 생성
                    .name("Book Name " + i)
                    .writer("Writer " + i)
                    .pub("Publisher " + i)
                    .year(2020 + (i % 5)) // 2020 ~ 2024 사이의 연도
                    .rating(4.0 + (i % 5) * 0.1) // 4.0 ~ 4.4 사이의 평점
                    .reviewCount(i * 5) // 리뷰 수
                    .likeCount(i * 10) // 좋아요 수
                    .build();
            bookRepository.save(book);
        }
    }



}