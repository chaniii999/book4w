package com.book4w.book4w.dto.response;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
@Builder
public class MyReviewResponseDTO {
    private String bookName;
    private String writer;
    private String content;
    private int rating;

}
