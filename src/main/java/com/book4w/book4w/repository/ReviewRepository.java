package com.book4w.book4w.repository;

import com.book4w.book4w.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ReviewRepository extends JpaRepository<Review, String> {

    // 리뷰 작성하기 위해서 Id로
    List<Review> findByBook_Id(String bookId);
}
