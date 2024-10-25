package com.book4w.book4w.dto.request;

import com.book4w.book4w.entity.Member;
import lombok.*;
import org.springframework.security.crypto.password.PasswordEncoder;

@Getter @Setter @ToString
@Builder
@AllArgsConstructor
public class MemberRequestDTO {
    private String email;
    private String nickname;
    private String password;

    public Member toEntity(PasswordEncoder encoder) {
        return Member.builder()
                .email(email)
                .nickname(nickname)
                .password(encoder.encode(password))
                .build();
    }
}