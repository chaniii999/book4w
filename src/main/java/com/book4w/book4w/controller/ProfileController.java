package com.book4w.book4w.controller;

import com.book4w.book4w.entity.Member;
import com.book4w.book4w.repository.MemberRepository;
import com.book4w.book4w.service.ProfileService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/profile")
public class ProfileController {

    private final ProfileService profileService;

    @GetMapping("/info")
    public String memberInfo(HttpSession session, Model model) {
        Member member = (Member) session.getAttribute("member");

        if (member != null) { // 세션에서 받은 멤버정보 받아오기.
            model.addAttribute("member", member);
        } else {
            return "redirect:/domain/sign-in";
        }
        return "info";
    }
}
