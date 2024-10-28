package com.book4w.book4w.entity;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder

@EntityListeners(AuditingEntityListener.class)
@Entity
@Table(name = "members")
public class Member {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID) // UUID 대신 AUTO_INCREMENT 사용
    @Column(name = "member_uuid", nullable = false, updatable = false)
    private String uuid; // Long 타입으로 변경 (UUID 대신)

    @Column(name = "member_email", unique = true, nullable = false)
    private String email;

    @Column(name = "member_pw", nullable = false)
    private String password;

    @Column(name = "member_nickname", nullable = false)
    private String nickname;

    @Column(name = "member_session_id")
    private String sessionId; // 세션 ID 필드 추가

    @CreatedDate
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @OneToMany(mappedBy = "member", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Review> reviews; // 작성한 리뷰 목록

    @ManyToMany(fetch = FetchType.EAGER, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinTable(
            name = "liked_books",
            joinColumns = @JoinColumn(name = "member_uuid"),
            inverseJoinColumns = @JoinColumn(name = "book_uuid")
    )
    private List<Book> likedBooks; // 좋아요한 책 목록
}
