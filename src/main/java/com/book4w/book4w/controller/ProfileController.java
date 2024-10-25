package com.book4w.book4w.controller;

import com.book4w.book4w.dto.response.LikedBooksResponseDTO;
import com.book4w.book4w.dto.response.LoginUserResponseDTO;
import com.book4w.book4w.dto.response.MyReviewResponseDTO;
import com.book4w.book4w.entity.Member;
import com.book4w.book4w.service.ProfileService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import static com.book4w.book4w.utils.LoginUtils.LOGIN_KEY;

@Controller
@RequiredArgsConstructor
@RequestMapping("/profile")
public class ProfileController {

    private final ProfileService profileService;


    @GetMapping("/info")
    public String info(HttpSession session, Model model) {
        Member member = (Member) session.getAttribute(LOGIN_KEY);

        if (member != null) { // 세션에서 받은 멤버정보 받아오기.
            model.addAttribute("member", member);
        } else {
            return "redirect:/domain/sign-in";
        }
        return "member-info";
    }

    @GetMapping("/liked-books")
    public String likedBooks(HttpServletRequest request,
                             Model model) {
        HttpSession session = request.getSession();
        LoginUserResponseDTO user = (LoginUserResponseDTO) session.getAttribute(LOGIN_KEY);

        if (user != null) {
            List<LikedBooksResponseDTO> likedBooks = profileService.getLikedBooksForMember(user.getEmail());
            model.addAttribute("likedBooks", likedBooks);
        }

        return "liked-books";
    }

    @GetMapping("/my-reviews")
    public String myReviews(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        LoginUserResponseDTO user = (LoginUserResponseDTO) session.getAttribute(LOGIN_KEY);
        if (user != null) {
            List<MyReviewResponseDTO> myReviews = profileService.getmyReviewsForMember(user.getEmail());
            model.addAttribute("myReviews", myReviews);
        }

        return "my-reviews";
    }
}
