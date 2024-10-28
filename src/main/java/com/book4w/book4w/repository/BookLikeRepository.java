package com.book4w.book4w.repository;

import com.book4w.book4w.entity.BookLike;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookLikeRepository extends JpaRepository<BookLike, String> {
    boolean existsByBookIdAndMemberUuid(String bookId, String memberUuid);
    void deleteByBookIdAndMemberUuid(String bookId, String memberUuid);
}
