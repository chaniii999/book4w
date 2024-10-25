package com.book4w.book4w.service;

import com.book4w.book4w.dto.request.MemberRequestDTO;
import com.book4w.book4w.dto.response.LoginUserResponseDTO;
import com.book4w.book4w.entity.Member;
import com.book4w.book4w.repository.MemberRepository;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import static com.book4w.book4w.service.LoginResult.*;
import static com.book4w.book4w.utils.LoginUtils.LOGIN_KEY;

@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberRepository memberRepository;
    private final PasswordEncoder encoder;
    public void save(MemberRequestDTO dto) {

        Member member = dto.toEntity(encoder);
        memberRepository.save(member);
    }

    public LoginResult authenticate(String email,
                                    String pw) {

        Member member = memberRepository.findByEmail(email);

        //회원가입 여부 검사
        if (member == null) {
            return  NO_ACCESS;
        }

        // 비밀번호 일치 검사
        if (!encoder.matches(pw, member.getPassword())) {
            return NO_PW;
        }


        return SUCCESS;
    }

    public void maintainLoginState(HttpSession session,
                                   String email) {

        Member foundMember = findByEmail(email);

        LoginUserResponseDTO dto = LoginUserResponseDTO.builder()
                .uuid(foundMember.getUuid())
                .email(foundMember.getEmail())
                .nickname(foundMember.getNickname())
                .likedBooks(foundMember.getLikedBooks())
                .reviews(foundMember.getReviews())
                .build();
        session.setAttribute(LOGIN_KEY, dto);
    }




    public Member findByEmail(String email) {
        return memberRepository.findByEmail(email);
    }

    public void updateMemberSessionId(Member member) {
        memberRepository.save(member);
    }

    public Member findBySessionId(String id) {
        return memberRepository.findBySessionId(id);
    }
}