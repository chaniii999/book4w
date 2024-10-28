package com.book4w.book4w.controller;

import com.book4w.book4w.dto.request.MemberRequestDTO;
import com.book4w.book4w.entity.Member;
import com.book4w.book4w.service.LoginResult;
import com.book4w.book4w.service.MemberService;
import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

import static com.book4w.book4w.utils.LoginUtils.LOGIN_KEY;

@Controller
@RequiredArgsConstructor
public class MemberController {
    private final MemberService memberService;

    @GetMapping("/sign-in")
    public String signIn() {
        return "sign-in";
    }

    @PostMapping("/sign-in")
    public String signIn(@RequestParam String email,
                         @RequestParam String password,
                         HttpServletRequest request
                         ) {

        Member member =  memberService.findByEmail(email); // 계정 찾아서
        LoginResult result = memberService.authenticate(email,password); // 계정,비번 맞니?
        HttpSession session = request.getSession();
        if (result == LoginResult.SUCCESS) { // 맞으면
            session.setAttribute(LOGIN_KEY,member);

            memberService.maintainLoginState(session,email); // 로그인상태 유지!
            return "redirect:/"; // 로그인 성공 후 리다이렉트
        } else {
            return "redirect:/sign-in"; // 로그인 실패 시 리다이렉트
        }
    }

    @GetMapping("/log-out")
    public String logout(HttpSession session) {
        // 현재 세션 무효화
        session.invalidate();
        return "redirect:/sign-in"; // 로그아웃 후 리다이렉트
    }

    @GetMapping("/sign-up")
    public String signUp() {
        return "sign-up";
    }

    @PostMapping("/sign-up")
    public String signUp(@RequestParam String email,
                         @RequestParam String nickname,
                         @RequestParam String password
                         ) {
       Member findMember = memberService.findByEmail(email);

        if (findMember == null) {
            memberService.save(new MemberRequestDTO(email, nickname, password));
            return "redirect:/sign-in";

        } else {
            return "sign-up";
        }
    }

    // 이메일 인증 코드 전송 처리
    @PostMapping("/send-auth-code")
    public ResponseEntity<Void> sendAuthCode(@RequestParam String email, HttpSession session) throws MessagingException {
        String authCode = memberService.sendAuthCode(email); // 인증 코드 발송
        session.setAttribute("sentAuthCode", authCode); // 세션에 인증 코드 저장
        return ResponseEntity.ok().build(); // 성공 응답 반환
    }

    // 인증 코드 확인 처리
    @PostMapping("/verify-auth-code")
    public ResponseEntity<Map<String, Object>> verifyAuthCode(@RequestParam String authCode, HttpSession session) {
        String sentAuthCode = (String) session.getAttribute("sentAuthCode");

        Map<String, Object> response = new HashMap<>();
        response.put("isValid", sentAuthCode != null && sentAuthCode.equals(authCode)); // 입력된 코드와 비교
        return ResponseEntity.ok(response); // 응답 반환
    }
}