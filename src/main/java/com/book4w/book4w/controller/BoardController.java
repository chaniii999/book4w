package com.book4w.book4w.controller;

import com.book4w.book4w.entity.Book;
import com.book4w.book4w.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
@Slf4j
public class BoardController {

    private final BoardService boardService;

    @GetMapping("/list")
    public String list(Model model,
                       @PageableDefault(size = 9)Pageable page,
                       @RequestParam(required = false) String sort) {
        log.info("/list/board: GET");

        // page 설정에 맞춰 북 목록을 Map에 저장하겠다.
        //Page<Book> bookPage = getSortedBookPage(sort,page);

        Page<Book> bookPage = boardService.getBookList(page);

        model.addAttribute("bList",bookPage.getContent());
        model.addAttribute("maker", bookPage);
        return "list";
    }

    private Page<Book> getSortedBookPage(String sort, Pageable pageable) {
        return switch (sort) {
            case "likes" -> boardService.getOrderLikesDesc(pageable);
            case "reviews" -> boardService.getOrderReviewDesc(pageable);
            case "rating" -> boardService.getOrderRatingDesc(pageable);
            default -> boardService.getBookList(pageable);
        };
    }

}
