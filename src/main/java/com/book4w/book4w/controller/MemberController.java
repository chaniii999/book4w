package com.book4w.book4w.controller;

import com.book4w.book4w.dto.request.MemberRequestDTO;
import com.book4w.book4w.entity.Member;
import com.book4w.book4w.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@Controller
@RequiredArgsConstructor
@RequestMapping("/domain")
public class MemberController {
    private final MemberService memberService;

    @GetMapping("/sign-in")
    public String signIn() {
        return "/domain/sign-in";
    }

    @PostMapping("sign-in")
    public String signIn(@RequestParam String email,
                         @RequestParam String password,
                         HttpServletRequest request,
                         HttpServletResponse response) {

        Member member = memberService.findByEmail(email);
        if (member != null && password.equals(member.getPassword())) {
            // 세션 ID 생성
            String sessionId = UUID.randomUUID().toString();
            member.setSessionId(sessionId); // 세션 ID 설정
            memberService.updateMemberSessionId(member); // 세션 ID 업데이트

            // 세션을 생성하여 클라이언트에 전달 (예: HttpSession 사용)
            HttpSession session = request.getSession();
            session.setAttribute("sessionId", sessionId);

            return "redirect:/"; // 로그인 성공 후 리다이렉트
        } else {
            return "redirect:/domain/sign-in"; // 로그인 실패 시 리다이렉트
        }
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        // 현재 세션 무효화
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // 현재 사용자 세션 ID 삭제
        Member member = memberService.findBySessionId(session.getId());
        if (member != null) {
            member.setSessionId(null); // 세션 ID 초기화
            memberService.updateMemberSessionId(member); // 업데이트
        }

        return "redirect:/domain/sign-in"; // 로그아웃 후 리다이렉트
    }

    @GetMapping("/sign-up")
    public String signUp() {
        return "/domain/sign-up";
    }

    @PostMapping("/sign-up")
    public String signUp(@RequestParam String email,
                         @RequestParam String nickname,
                         @RequestParam String password) {

        memberService.save(new MemberRequestDTO(email, nickname, password));

        return "redirect:/domain/sign-in";
    }
}