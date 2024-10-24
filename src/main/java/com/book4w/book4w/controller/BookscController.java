package com.book4w.book4w.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BookscController {

    @GetMapping("/search")
    public String searchBooks(@RequestParam("query") String query, Model model) {
        // 검색어로 도서를 검색하는 로직 구현
        List<Book> books = bookService.searchBooks(query); // 검색 로직
        model.addAttribute("books", books);
        return "books"; // 결과를 보여줄 템플릿
    }
}
