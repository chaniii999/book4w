package com.book4w.book4w.dto.request;

import com.book4w.book4w.entity.Member;
import lombok.*;

@Getter @Setter @ToString
@Builder
@AllArgsConstructor
public class MemberRequestDTO {
    private String email;
    private String nickname;
    private String password;

    public Member toEntity() {
        return Member.builder()
                .email(email)
                .nickname(nickname)
                .password(password)
                .build();
    }
}