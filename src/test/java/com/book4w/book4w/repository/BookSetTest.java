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
            double desiredAverageRating = 1.3 + (random.nextDouble() * (4.7 - 1.3)); // 1.3 ~ 4.7 랜덤값 생성

            // 1.0부터 400 사이의 랜덤 총 평점 생성
            int rating = random.nextInt(400) + 1; // 총 평점 수 (1 ~ 400)

            // 2. 적어도 평균 평점이 1.0이 되도록 reviewCount 설정
            // reviewCount는 총 평점을 평균 평점으로 나눈 값의 정수 부분으로 설정
            int reviewCount = (int) Math.max(Math.ceil((double) rating / desiredAverageRating), 1);

            // 3. 리뷰 수가 최소 1개 이상이고, 생성된 값보다 클 수 있도록 재설정
            if (reviewCount < 1) {
                reviewCount = 1; // 최소 1개의 리뷰는 필수
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
