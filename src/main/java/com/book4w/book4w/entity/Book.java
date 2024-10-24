package com.book4w.book4w.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Setter
@Getter
@ToString(exclude = "reviews") // 순환 참조 방지를 위해 reviews 제외
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder

@Entity
@Table(name = "books")
public class Book {

    @Id
    @Column(name = "book_uuid")
    @GeneratedValue(strategy = GenerationType.UUID) // UUID 생성 전략
    private String id;

    @Column(name = "book_name", nullable = false)
    private String name;

    @Column(name = "book_writer", nullable = false)
    private String writer;

    @Column(name = "book_pub", nullable = false)
    private String pub;

    @Column(name = "book_year", nullable = false)
    private int year;

    @Column(name = "book_rating", nullable = false)
    private double rating = 0.0;

    @Column(name = "book_review_count", nullable = false)
    private int reviewCount = 0;

    @Column(name = "book_like_count", nullable = false)
    private int likeCount = 0;

    @Column(name = "book_cover_image")
    private String coverImage;

    @OneToMany(mappedBy = "book", fetch = FetchType.LAZY, cascade = CascadeType.ALL) // 리뷰와의 관계 추가
    private List<Review> reviews; // 해당 책에 대한 리뷰 목록
}
