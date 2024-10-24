package com.book4w.book4w.controller;

import com.book4w.book4w.dto.request.MemberRequestDTO;
import com.book4w.book4w.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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
                         @RequestParam String password) {

        if (true) {
            return "redirect:/";
        } else {
            return "redirect:/domain/sign-in";
        }
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