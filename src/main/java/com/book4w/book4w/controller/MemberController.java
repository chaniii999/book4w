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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    @GetMapping("/email-auth")
    public String emailAuth(@RequestParam("email") String email, Model model) throws MessagingException {
        String authCode = memberService.sendAuthCode(email);  // 인증 코드 발송
        model.addAttribute("authCode", authCode);  // 인증 코드를 모델에 추가
        return "emailAuth";  // emailAuth.jsp 페이지로 이동
    }
}