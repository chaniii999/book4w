package com.book4w.book4w.repository;

import com.book4w.book4w.dto.request.PageDTO;
import com.book4w.book4w.entity.Book;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookRepository extends JpaRepository<Book, String> {

    // 평점 순 상위 3개의 책을 조회하는 쿼리 메서드
    List<Book> findTop3ByOrderByRatingDesc();

    // 리뷰 수 순 상위 3개의 책을 조회하는 쿼리 메서드
    List<Book> findTop3ByOrderByReviewCountDesc();

    // 좋아요 수 순 상위 3개의 책을 조회하는 쿼리 메서드
    List<Book> findTop3ByOrderByLikeCountDesc();

    @Query("SELECT  COUNT(b) FROM Book b")
    public int getTotalCount(PageDTO pageDTO);

    // 좋아요순
    Page<Book> findAllByOrderByLikeCountDesc(Pageable page);
    // 리뷰순
    Page<Book> findAllByOrderByReviewCountDesc(Pageable page);
    // 평점순
    Page<Book> findAllByOrderByRatingDesc(Pageable page);



}
