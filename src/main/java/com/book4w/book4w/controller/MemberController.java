package com.book4w.book4w.controller;

import com.book4w.book4w.dto.request.MemberRequestDTO;
import com.book4w.book4w.entity.Member;
import com.book4w.book4w.service.LoginResult;
import com.book4w.book4w.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.print.MultiDoc;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
@RequestMapping("/domain")
public class MemberController {
    private final MemberService memberService;

    @GetMapping("/sign-in")
    public String signIn() {
        return "domain/sign-in";
    }

    @PostMapping("/sign-in")
    public String signIn(@RequestParam String email,
                         @RequestParam String password,
                         HttpServletRequest request,
                         HttpServletResponse response) {

        Member member = memberService.findByEmail(email); // 계정 찾아서
        LoginResult result = memberService.authenticate(email,password); // 계정,비번 맞니?
        if (result == LoginResult.SUCCESS) { // 맞으면

            memberService.maintainLoginState(request.getSession(true),email); // 로그인상태 유지!
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
        return "domain/sign-up";
    }

    @PostMapping("/sign-up")
    public String signUp(@RequestParam String email,
                         @RequestParam String nickname,
                         @RequestParam String password,
                         Model model) {
       Member findMember = memberService.findByEmail(email);

        if (findMember == null) {
            memberService.save(new MemberRequestDTO(email, nickname, password));
            return "redirect:/domain/sign-in";

        } else {
            return "domain/sign-up";
        }
    }
}