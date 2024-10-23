package com.book4w.book4w.controller;

import com.book4w.book4w.dto.response.HomeRecommendedResponseDTO;
import com.book4w.book4w.service.HomeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final HomeService homeService;

    @GetMapping("/")
    public String Home(Model model) {
        List<HomeRecommendedResponseDTO> recommendedByRating = homeService.recommendedListByRating();
        List<HomeRecommendedResponseDTO> recommendedByReviewCount = homeService.recommendedListByReviewCount();
        List<HomeRecommendedResponseDTO> recommendedByLikeCount = homeService.recommendedListByLikeCount();

        model.addAttribute("recommendedByRating", recommendedByRating);
        model.addAttribute("recommendedByReviewCount", recommendedByReviewCount);
        model.addAttribute("recommendedByLikeCount", recommendedByLikeCount);

        return "home";
    }
}
