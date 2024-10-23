package com.book4w.book4w.repository;

import com.book4w.book4w.entity.Book;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import static org.assertj.core.api.Assertions.assertThat; // AssertJ import


@SpringBootTest
class BookRepositoryTest {
    @Autowired
    private BookRepository bookRepository;

    @Test
    @DisplayName("좋아요 순으로 도서 목록을 조회한다")
    void findAllByOrderByLikeCountDesc() {
        Pageable pageable = PageRequest.of(0, 9);
        Page<Book> books = bookRepository.findAllByOrderByLikeCountDesc(pageable);
        System.out.println("도서 목록 (좋아요 순):");
        books.getContent().forEach(book -> {
            System.out.println("제목: " + book.getName() + ", 좋아요 수: " + book.getLikeCount());
        });
        assertThat(books).isNotNull();
    }
}