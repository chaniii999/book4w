package com.book4w.book4w.entity;

import jakarta.persistence.*;
import lombok.*;

@Setter
@Getter
@ToString(exclude = {"member","book"})
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder

@Entity
@Table(name = "reviews")
public class Review {

    @Id
    @Column(name = "review_uuid", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_uuid",nullable = false)
    private Member member;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "book_uuid", nullable = false)
    private Book book;

    @Column(length = 500, nullable = false)
    private String content;

    @Column(nullable = false)
    private int rating;

}
