package com.book4w.book4w.controller;

import com.book4w.book4w.dto.request.MemberRequestDTO;
import com.book4w.book4w.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {
    private final MemberService memberService;

    @GetMapping("/sign-in")
    public String signIn() {
        return "/member/sign-in";
    }

    @GetMapping("/sign-up")
    public String signUp() {
        return "/member/sign-up";
    }

    @PostMapping("/sing-up")
    public String signUp(MemberRequestDTO dto) {
        memberService.save(dto);
        return "redirect:/member/sign-in";
    }
}
