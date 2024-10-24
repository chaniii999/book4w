package com.book4w.book4w.entity;

import jakarta.persistence.*;
import lombok.*;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder

@Entity
@Table(name = "reviews")
public class Review {

    @Id
    @Column(name = "book_uuid")
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(nullable = false)
    private Member memberId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(nullable = false)
    private Book bookUuid;

    @Column(length = 500, nullable = false)
    private String content;

    @Column(nullable = false)
    private int rating = 1;

}
