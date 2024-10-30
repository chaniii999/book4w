package com.book4w.book4w.repository;

import com.book4w.book4w.entity.Book;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Random;

@SpringBootTest
public class BookSetTest {

    @Autowired
    BookRepository bookRepository;

    private Random random = new Random();

    @Test
    @DisplayName("존재하는 북의 좋아요, 리뷰수, 평점 세팅")
    void setBookData() {
        // given
        List<Book> books = bookRepository.findAll();

        for (Book book : books) {
            // 1.0부터 5.0 사이의 랜덤 평점을 생성
            double rating = random.nextInt(400); // 1.0 ~ 5.0

            // 2. rating을 바탕으로 reviewCount를 설정 (rating이 최대 5.0일 때 reviewCount는 최소 1)
            int reviewCount = random.nextInt(10) + 1; // 최소 1개의 리뷰를 가정

            // 3. 평점 계산 (rating / reviewCount <= 5.0)
            while (rating / reviewCount > 5.0) {
                reviewCount++; // reviewCount를 증가시켜 평점이 5를 넘지 않도록 조정
            }

            // 4. 도서 객체에 값 설정
            book.setRating(rating);
            book.setReviewCount(reviewCount);
            book.setLikeCount(random.nextInt(100)); // 랜덤으로 좋아요 수 설정

            // 5. DB에 저장
            bookRepository.save(book);
        }

    }
}
