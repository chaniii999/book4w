package com.book4w.book4w.dto.request;

import com.book4w.book4w.entity.Member;
import lombok.*;

@Getter @Setter @ToString
@Builder
@AllArgsConstructor
public class MemberRequestDTO {
    private String email;
    private String password;
    private String nickname;

    public Member toEntity() {
        return Member.builder()
                .email(email)
                .password(password)
                .nickname(nickname)
                .build();
    }
}