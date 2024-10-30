package com.book4w.book4w.repository;

import com.book4w.book4w.entity.Book;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookRepository extends JpaRepository<Book, String> {

    // 평점 순 상위 3
    @Query("SELECT b FROM Book b ORDER BY (CASE WHEN b.reviewCount > 0 THEN b.rating / b.reviewCount ELSE 0 END) DESC")
    List<Book> findTop3ByOrderByRatingDividedByReviewCountDesc(Pageable pageable);


    // 리뷰 수 순 상위 3
    List<Book> findTop3ByOrderByReviewCountDesc();

    // 좋아요 수 순 상위 3
    List<Book> findTop3ByOrderByLikeCountDesc();

    // 좋아요순
    Page<Book> findAllByOrderByLikeCountDesc(Pageable page);
    // 리뷰순
    Page<Book> findAllByOrderByReviewCountDesc(Pageable page);
    // 평점순
    @Query("SELECT b FROM Book b ORDER BY (CASE WHEN b.reviewCount > 0 THEN b.rating / b.reviewCount ELSE 0 END) DESC")
    Page<Book> findAllByOrderByRatingDividedByReviewCountDesc(Pageable page);

    // 책제목 검색
    Page<Book> findAllByNameContaining(String query, Pageable page);
    // 검색 + 좋아요순
    Page<Book> findAllByNameContainingOrderByLikeCountDesc(String query, Pageable page);
    // 검색 + 리뷰순
    Page<Book> findAllByNameContainingOrderByReviewCountDesc(String query, Pageable page);
    // 검색 + 평점순



    @Query("SELECT b FROM Book b WHERE b.name LIKE %:query% ORDER BY (CASE WHEN b.reviewCount > 0 THEN b.rating / b.reviewCount ELSE 0 END) DESC")
    Page<Book> findAllByNameContainingOrderByRatingDividedByReviewCountDesc(@Param("query") String query, Pageable pageable);

}
