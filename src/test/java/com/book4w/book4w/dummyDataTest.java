package com.book4w.book4w;

import com.book4w.book4w.entity.Book;
import com.book4w.book4w.repository.BookRepository;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Random;
import java.util.UUID;

@SpringBootTest
public class dummyDataTest {

    @Autowired
    BookRepository bookRepository;

    @Test
    @DisplayName("더미데이터 생성(무지성 생성이므로 평점 5를 초과할수있음)")
    void createDummy() {
        Random random = new Random();

        for (int i = 1; i <= 50; i++) {
            Book book = Book.builder()
                    .id(UUID.randomUUID().toString()) // UUID 생성
                    .name("Book Name " + i) // 책 이름
                    .writer("Writer " + random.nextInt(100))
                    .pub("Publisher " + random.nextInt(10))
                    .year(2020 + random.nextInt(5))
                    .coverImage("https://via.placeholder.com/150?text=Book+Cover+" + i)
                    .rating(3.0 + (random.nextDouble() * 2))
                    .reviewCount(random.nextInt(100))
                    .likeCount(random.nextInt(100))
                    .build();
            bookRepository.save(book);
        }
    }

    @Test
    @DisplayName("해리포터")
    void dummyCreTest() {
        // given
        Random random = new Random();

            Book book = Book.builder()
                    .id(UUID.randomUUID().toString()) // UUID 생성
                    .name("해리포터") // 책 이름
                    .writer("조앤머시기 " + random.nextInt(100))
                    .pub("Publisher " + random.nextInt(10))
                    .year(2020 + random.nextInt(5))
                    .coverImage("https://via.placeholder.com/150?text=Book+Cover+")
                    .likeCount(random.nextInt(100))
                    .build();
            bookRepository.save(book);
        // when

        // then
    }
}
