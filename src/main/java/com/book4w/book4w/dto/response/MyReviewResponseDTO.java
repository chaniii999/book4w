package com.book4w.book4w.dto.response;

import com.book4w.book4w.entity.Review;
import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@Builder
public class MyReviewResponseDTO {
    private String bookId;
    private String bookName;
    private String writer;
    private String content;
    private int rating;

    // 팩토리 메서드 추가
    public static MyReviewResponseDTO fromReview(Review review) {
        return MyReviewResponseDTO.builder()
                .bookId(review.getBook().getId())
                .bookName(review.getBook().getName())
                .writer(review.getBook().getWriter())
                .content(review.getContent())
                .rating(review.getRating())
                .build();
    }
}
