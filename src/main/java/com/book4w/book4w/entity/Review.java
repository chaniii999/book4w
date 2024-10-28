package com.book4w.book4w.entity;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;

@Getter @Setter
@ToString(exclude = {"member", "book"})
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@EntityListeners(AuditingEntityListener.class)
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

    @CreatedDate
    @Column(name = "created_date", updatable = false)
    private LocalDateTime createdDate;


}