package com.book4w.book4w.dto.response;

import com.book4w.book4w.entity.Book;
import lombok.*;

@Getter @ToString @EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class HomeRecommendedResponseDTO {

    private String bookUuid;
    private String bookName;
    private String bookWriter;
    private String bookPub;
    private String coverImage;


    private double bookRating;
    private int reviewCount;
    private int likeCount;

    public HomeRecommendedResponseDTO(Book book) {
        this.bookUuid = book.getId();
        this.bookName = book.getName();
        this.bookWriter = book.getWriter();
        this.bookPub = book.getPub();
        this.coverImage = book.getCoverImage();

        this.bookRating = book.getRating();
        this.reviewCount = book.getReviewCount();
        this.likeCount = book.getLikeCount();

    }

}





