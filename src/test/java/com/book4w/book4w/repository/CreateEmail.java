package com.book4w.book4w.repository;

import com.book4w.book4w.entity.Member;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootTest
public class CreateEmail {

    @Autowired
    MemberRepository memberRepository;
    @Autowired
    private PasswordEncoder encoder;

    @Test
    @DisplayName("이메일생성")
    void createAccount() {
        // given
        Member member = Member.builder()
                .email("t@0.com")
                .password(encoder.encode("1234"))
                .nickname("테스트계정")
                .build();
        // when
        // then
        memberRepository.save(member);
    }


}
