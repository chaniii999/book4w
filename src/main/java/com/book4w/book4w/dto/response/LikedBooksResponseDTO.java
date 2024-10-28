package com.book4w.book4w.dto.response;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder
public class LikedBooksResponseDTO {
    private String id;
    private String name;
    private String writer;
    private String pub;
    private final String coverImage;
    private double rating;
    private int reviewCount;
    private int likeCount;
}
