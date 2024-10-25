package com.book4w.book4w.dto.request;

import com.book4w.book4w.entity.Review;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Builder;

@Builder
public class ReviewPostRequestDTO {
    private int rating;

    @NotBlank
    @Size(min = 1, max = 300)
    private final String content;

    private final String memberName;

    public ReviewPostRequestDTO(Review review) {
        this.content = review.getContent();
        this.memberName = review.getMember().getNickname();
        this.rating = review.getRating();
    }
}
