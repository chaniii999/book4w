package com.book4w.book4w.main.repository;

import com.book4w.book4w.main.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<Book, Long>{
    /*
    1. sortByRating

    2. sortByReivewCount

    3. sortByLikeCount

    4. findByTitleContaining

    5. findByWriterContaining

    6. findByPub

     */
}
