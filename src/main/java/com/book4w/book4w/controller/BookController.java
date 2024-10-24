package com.book4w.book4w.controller;

import com.book4w.book4w.entity.Book;
import com.book4w.book4w.repository.BookRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class BookController {

    @Autowired
    BookRepository bookRepository;

    @GetMapping("/books")
    public String getBooks(Model model) {
        // 모든 책 정보를 조회
        List<Book> books = bookRepository.findAll();
        // 모델에 책 데이터를 추가하여 HTML로 전달
        model.addAttribute("books", books);
        return "books"; // books.html 페이지로 데이터를 넘김
    }
}
