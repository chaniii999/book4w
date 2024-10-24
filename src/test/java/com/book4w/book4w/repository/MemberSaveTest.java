package com.book4w.book4w.repository;

import com.book4w.book4w.entity.Member;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;

@SpringBootTest
public class MemberSaveTest {

    @Autowired
    private MemberRepository memberRepository;

    @Test
    @DisplayName("더미 유저 생성")
    void memberDummySaveTest() {
        // given
        Member user1 = Member.builder()
                .email("pjh80@naver.com")
                .password("pakjss123")
                .nickname("해뤼러")
                .build();
        Member user2 = Member.builder()
                .email("bojhg02@gmail.com")
                .password("passkjl9999")
                .nickname("해러")
                .build();
        Member user3 = Member.builder()
                .email("kkkhh91@hotmail.net")
                .password("hakkkkky")
                .nickname("해p러")
                .build();
        // when
        memberRepository.saveAll(Arrays.asList(user1, user2, user3));
        // then
    }
}
