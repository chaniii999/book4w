package com.book4w.book4w.repository;

import com.book4w.book4w.dto.request.PageDTO;
import com.book4w.book4w.dto.response.BoardDetailResponseDTO;
import com.book4w.book4w.entity.Book;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookRepository extends JpaRepository<Book, Long>{
    //List<BoardDetailResponseDTO> findAll(PageDTO page);
    /*
    1. sortByRating

    2. sortByReivewCount

    3. sortByLikeCount

    4. findByTitleContaining

    5. findByWriter

    6. findByPub

     */
    @Query("SELECT  COUNT(b) FROM Book b")
    public int getTotalCount(PageDTO pageDTO);

    // 좋아요순
    Page<Book> findAllByOrderByLikeCountDesc(Pageable page);
    // 리뷰순
    Page<Book> findAllByOrderByReviewCountDesc(Pageable page);
    // 평점순
    Page<Book> findAllByOrderByRatingDesc(Pageable page);


}
