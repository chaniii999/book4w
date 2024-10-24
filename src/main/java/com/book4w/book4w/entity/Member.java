package com.book4w.book4w.entity;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;

import java.time.LocalDateTime;

/*
-- 회원 관리 테이블
CREATE TABLE members (
    member_uuid CHAR(36) NOT NULL PRIMARY KEY,  -- UUID, 고유 식별자
    member_email VARCHAR(15) NOT NULL UNIQUE,       -- 회원 ID, 고유해야 함
    member_pw VARCHAR(20) NOT NULL,             -- 회원 비밀번호
    member_nickname VARCHAR(10) NOT NULL,        -- 회원 닉네임
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- 회원 가입 일자
);
 */

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Member {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "member_uuid", nullable = false, updatable = false)
    private String uuid;

    @Column(name = "member_email", unique = true, nullable = false)
    private String email;

    @Column(name ="member_pw", nullable = false)
    private String password;

    @Column(name = "nickname", nullable = false)
    private String nickname;

    @CreatedDate
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;
}