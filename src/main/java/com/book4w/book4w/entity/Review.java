package com.book4w.book4w.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.UUID;
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

    @Column(nullable = false)
    private String memberId;
    @Column(nullable = false)
    private String bookUuid;
    @Column(length = 500, nullable = false)
    private String content;

    @Column(nullable = false)
    private int rating = 1;

}
