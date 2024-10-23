package com.book4w.book4w;

import com.book4w.book4w.entity.Book;
import com.book4w.book4w.repository.BookRepository;
import jakarta.transaction.Transactional;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Random;
import java.util.UUID;

@SpringBootTest
//@Transactional // 테스트 전으로 데이터를 복구함.
public class dummyDataTest {
    @Autowired
    BookRepository bookRepository;

    @Test
    @DisplayName("더미데이터 생성")
    void createDummy() {
        Random random = new Random();

        for (int i = 1; i <= 20; i++) {
            Book book = Book.builder()
                    .id(UUID.randomUUID().toString()) // UUID 생성
                    .name("Book Name " + i)
                    .writer("Writer " + random.nextInt(100)) // 0부터 99 사이의 랜덤 작가 이름
                    .pub("Publisher " + random.nextInt(10)) // 0부터 9 사이의 랜덤 출판사
                    .year(2020 + random.nextInt(5)) // 2020 ~ 2024 사이의 랜덤 연도
                    .rating(3.0 + (random.nextDouble() * 2)) // 3.0 ~ 5.0 사이의 랜덤 평점
                    .reviewCount(random.nextInt(100)) // 0부터 99 사이의 랜덤 리뷰 수
                    .likeCount(random.nextInt(100)) // 0부터 99 사이의 랜덤 좋아요 수
                    .build();
            bookRepository.save(book);
        }
    }


}
