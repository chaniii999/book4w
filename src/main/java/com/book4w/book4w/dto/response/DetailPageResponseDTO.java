package com.book4w.book4w.dto.response;

import lombok.*;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class DetailPageResponseDTO {

    private String id;
    private String name;
    private String writer;
    private String pub;
    private int year;
    private String coverImage;
    private double rating;
    private int reviewCount;
    private int likeCount;
    private boolean isLiked;

}
