package com.book4w.book4w.controller;

import com.book4w.book4w.dto.request.MemberRequestDTO;
import com.book4w.book4w.entity.Member;
import com.book4w.book4w.service.MemberService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest
class MemberControllerTest {

    @Autowired
    MemberService memberService;

    // given

    @Test
    @DisplayName("회원가입 테스트")
    void JoinTest() {
        MemberRequestDTO member = MemberRequestDTO.builder()
                .email("test@test.com")
                .password("test_password")
                .nickname("test_nickname")
                .build();

        // when
        Member result = memberService.save(member);

        // then
        assertNotNull(result);
    }


}