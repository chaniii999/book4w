package com.book4w.book4w.repository;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class LikedBookTest {

    @Autowired
    private final BookLikeRepository bookLikeRepository;

    public LikedBookTest(BookLikeRepository bookLikeRepository) {
        this.bookLikeRepository = bookLikeRepository;
    }


    @Test
    @DisplayName("likedBook 생성")
    void createLikedBook() {
        // given

        // when

        // then
    }
}
