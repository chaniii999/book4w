package com.book4w.book4w.controller;

import com.book4w.book4w.dto.response.LikedBooksResponseDTO;
import com.book4w.book4w.dto.response.LoginUserResponseDTO;
import com.book4w.book4w.dto.response.MyReviewResponseDTO;
import com.book4w.book4w.dto.response.ProfileMemberResponseDTO;
import com.book4w.book4w.service.ProfileService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import org.springframework.web.bind.annotation.RequestParam;

import static com.book4w.book4w.utils.LoginUtils.LOGIN_KEY;

@Controller
@RequiredArgsConstructor
@RequestMapping("/profile")
public class ProfileController {

    private final ProfileService profileService;


    @GetMapping("/info")
    public String info(HttpServletRequest request,
        Model model) {
        HttpSession session = request.getSession();
        LoginUserResponseDTO user = (LoginUserResponseDTO) session.getAttribute(LOGIN_KEY);

        if (user != null) {
            ProfileMemberResponseDTO member = profileService.getMyProfile(user.getEmail());
            model.addAttribute("member", member);
        }
        return "member-info";
    }

    @GetMapping("/liked-books")
    public String likedBooks(HttpServletRequest request,
                             Model model,
                             @PageableDefault(page = 0, size = 5) Pageable page) {
        HttpSession session = request.getSession();
        LoginUserResponseDTO user = (LoginUserResponseDTO) session.getAttribute(LOGIN_KEY);

        if (user != null) {
            Page<LikedBooksResponseDTO> likedBooks = profileService.getLikedBooksForMember(user.getEmail(),page);
            if (likedBooks != null) {
                System.out.println("likedBooks = " + likedBooks);
            }
            model.addAttribute("likedBooks", likedBooks);
        } else {
            return "redirect:/";
        }

        return "liked-books";
    }

    @GetMapping("/my-reviews")
    public String myReviews(HttpServletRequest request,
                            Model model,
                            @PageableDefault(page = 0, size = 5) Pageable page) {
        HttpSession session = request.getSession();
        LoginUserResponseDTO user = (LoginUserResponseDTO) session.getAttribute(LOGIN_KEY);
        if (user != null) {
            Page<MyReviewResponseDTO> myReviews = profileService.getmyReviewsForMember(
                user.getEmail(),page);
            model.addAttribute("myReviews", myReviews);
        }

        return "my-reviews";
    }

    @PostMapping("/change-nickname")
    public String changeNickname(HttpServletRequest request,
        @RequestParam("newNickname") String newNickname, Model model) {
        HttpSession session = request.getSession();
        LoginUserResponseDTO user = (LoginUserResponseDTO) session.getAttribute(LOGIN_KEY);
        if (user != null) {
            profileService.changeNickname(user.getEmail(), newNickname);
            model.addAttribute("message", "닉네임을 변경했습니다");
        }
        return "redirect:/profile/info";

    }

}
