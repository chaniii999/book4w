package com.book4w.book4w.repository;

import com.book4w.book4w.entity.Book;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BookRepository extends JpaRepository<Book, String> {

    // 평점 순 상위 3
    List<Book> findTop3ByOrderByRatingDesc();

    // 리뷰 수 순 상위 3
    List<Book> findTop3ByOrderByReviewCountDesc();

    // 좋아요 수 순 상위 3
    List<Book> findTop3ByOrderByLikeCountDesc();

    // 좋아요순
    Page<Book> findAllByOrderByLikeCountDesc(Pageable page);
    // 리뷰순
    Page<Book> findAllByOrderByReviewCountDesc(Pageable page);
    // 평점순
    Page<Book> findAllByOrderByRatingDesc(Pageable page);

    // 책제목 검색
    Page<Book> findAllByNameContaining(String query, Pageable page);
    // 검색 + 좋아요순
    Page<Book> findAllByNameContainingOrderByLikeCountDesc(String query, Pageable page);
    // 검색 + 리뷰순
    Page<Book> findAllByNameContainingOrderByReviewCountDesc(String query, Pageable page);
    // 검색 + 평점순
    Page<Book> findAllByNameContainingOrderByRatingDesc(String query, Pageable page);

}
