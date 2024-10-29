package com.book4w.book4w.dto.request;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class BookDetailRequestDTO {
    private String id;
    private String name;
    private String writer;
    private String pub;
    private int year;
    private double rating;
    private int reviewCount;
    private int likeCount;
    private boolean isLiked;


}
