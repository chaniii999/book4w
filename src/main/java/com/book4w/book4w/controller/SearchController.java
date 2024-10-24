package com.book4w.book4w.controller;

import com.book4w.book4w.entity.Book;
import com.book4w.book4w.service.BookService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public class SearchController {
    private final BookService bookService;

    public SearchController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping
    public String searchBooks(@RequestParam String query, Model model) {
        List<Book> searchResults = bookService.searchBooks(query);
        model.addAttribute("searchResults", searchResults);
        model.addAttribute("query", query);
        return "searchResults";
    }
}
