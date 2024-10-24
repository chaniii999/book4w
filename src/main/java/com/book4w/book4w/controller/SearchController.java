package com.book4w.book4w.controller;

import com.book4w.book4w.entity.Book;
import com.book4w.book4w.service.BookService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@Slf4j
public class SearchController {
    private final BookService bookService; // 책 검색 관련 서비스

    public SearchController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("/search")
    public String searchBooks(@RequestParam String query, Model model) {
        log.info("query: {}", query);
        // 검색어가 포함된 책 목록을 가져옴
        List<Book> searchResults = bookService.searchBooks(query);

        // 검색 결과가 있는 경우, 모델에 데이터를 저장하고 view로 넘김
        model.addAttribute("searchResults", searchResults);
        model.addAttribute("query", query);

        return "searchResults";  // 검색 결과 페이지로 이동
    }
}
