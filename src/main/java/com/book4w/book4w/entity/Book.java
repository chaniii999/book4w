package com.book4w.book4w.main.entity;


import jakarta.persistence.*;
import lombok.*;

@Setter @Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder

@Entity
@Table(name = "books")
public class Book {

    @Id
    @Column(name = "book_uuid")
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Column(name = "book_name", nullable = false)
    private String name;

    @Column(name = "book_writer", nullable = false)
    private String writer;

    @Column(name = "book_pub", nullable = false)
    private String publisher;

    @Column(name = "book_year", nullable = false)
    private int year;

    @Column(name = "book_rating", nullable = false)
    private double rating;

    @Column(name = "book_review_count", nullable = false)
    private int reviewCount = 0;

    @Column(name = "book_like_count", nullable = false)
    private int likeCount = 0;
}

/*
book_uuid char(36) PK
book_name varchar(100)
book_writer varchar(100)
book_pub varchar(100)
book_year int
book_rating double
book_review_count int
book_like_count int
 */