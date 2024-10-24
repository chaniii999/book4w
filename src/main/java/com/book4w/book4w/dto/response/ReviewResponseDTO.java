package com.book4w.book4w.dto.response;

import com.book4w.book4w.entity.Review;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor

public class ReviewResponseDTO {
    private int rating;
    private final String content;

    public ReviewResponseDTO(Review review) {
        this.rating = review.getRating();
        this.content = review.getContent();
    }
}


