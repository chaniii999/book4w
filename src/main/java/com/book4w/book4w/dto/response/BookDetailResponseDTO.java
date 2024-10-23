package com.book4w.book4w.dto.response;

import com.book4w.book4w.entity.Book;

public class BoardDetailResponseDTO {
    private String id;
    private String name;
    private String writer;
    private String pub;
    private int year;
    private double rating;
    private int reviewCount;
    private int likeCount;

    // 생성자
    public BookDetailRequestDTO(Book book) {
        this.id = book.getId();
        this.name = book.getName();
        this.writer = book.getWriter();
        this.pub = book.getPub();
        this.year = book.getYear();
        this.rating = book.getRating();
        this.reviewCount = book.getReviewCount();
        this.likeCount = book.getLikeCount();
    }
}
