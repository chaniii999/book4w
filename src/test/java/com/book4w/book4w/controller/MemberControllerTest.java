package com.book4w.book4w.controller;

import com.book4w.book4w.dto.request.MemberRequestDTO;
import com.book4w.book4w.entity.Member;
import com.book4w.book4w.repository.MemberRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
class MemberControllerTest {
    @Autowired
    protected MockMvc mockMvc;

    @Autowired
    protected ObjectMapper objectmapper;    // 직렬화, 역직렬화

    @Autowired
    MemberRepository memberRepository;

    // given

    @Test
    @DisplayName("회원가입 테스트")
    void JoinTest() throws Exception {
        // given
        final String url = "/member/sign-up";
        final String email = "test@test.com";
        final String password = "test_password";
        final String nickname = "test_nickname";

        MemberRequestDTO member = MemberRequestDTO.builder()
                .email(email)
                .password(password)
                .nickname(nickname)
                .build();

        // 객체 JSON으로 직렬화
        final String requestBody = objectmapper.writeValueAsString(member);

        // when
        // 요청 전송
        ResultActions result = mockMvc.perform(post(url)
                .contentType(MediaType.APPLICATION_JSON)
                .content(requestBody));

        List<Member> members = memberRepository.findAll();

        // then
        result.andExpect(status().isCreated());

        assertEquals(1, members.size());
    }
}