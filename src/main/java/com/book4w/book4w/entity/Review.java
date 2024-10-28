package com.book4w.book4w.entity;

import jakarta.persistence.*;
import lombok.*;

@Getter @Setter
@ToString(exclude = {"member", "book"})
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "reviews")

public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "review_uuid", nullable = false, updatable = false)
    private String id; // Long 타입으로 변경 (UUID 대신)

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_uuid", nullable = false)
    private Member member; // 작성한 회원

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "book_uuid", nullable = false)
    private Book book; // 리뷰가 작성된 도서

    @Column(length = 500, nullable = false)
    private String content; // 리뷰 내용

    @Column(nullable = false)
    private int rating; // 평점
}