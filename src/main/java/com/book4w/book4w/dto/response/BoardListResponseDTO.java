package com.book4w.book4w.dto.response;

import com.book4w.book4w.entity.Book;
import lombok.*;

@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
public class BoardListResponseDTO {
    private final String bookUuid;
    private final String name;
    private final String writer;
    private final String pub;
    private final int year;
    private final String coverImage;
    private final double rating;
    private final int reviewCount;
    private final int likeCount;

    public BoardListResponseDTO(Book book) {
        this.bookUuid = book.getId();
        this.name = book.getName();
        this.writer = book.getWriter();
        this.pub = book.getPub();
        this.year = book.getYear();
        this.coverImage = book.getCoverImage();
        this.rating = book.getRating();
        this.reviewCount = book.getReviewCount();
        this.likeCount = book.getLikeCount();
    }
}
