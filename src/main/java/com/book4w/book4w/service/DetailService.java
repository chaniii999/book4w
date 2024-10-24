package com.book4w.book4w.service;

import com.book4w.book4w.repository.BookRepository;
import com.book4w.book4w.dto.response.DetailPageResponseDTO;
import com.book4w.book4w.repository.BookRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DetailService {
    private final BookRepository bookRepository;

    public DetailPageResponseDTO getBookDetail(String id) {
        return bookRepository.findById(id)
                .map(book -> DetailPageResponseDTO.builder()
                        .id(book.getId())
                        .name(book.getName())
                        .writer(book.getWriter())
                        .pub(book.getPub())
                        .year(book.getYear())
                        .rating(book.getRating())
                        .reviewCount(book.getReviewCount())
                        .likeCount(book.getLikeCount())
                        .coverImage("path/to/bookCover.jpg")
                        .build())
                .orElseThrow(() -> new IllegalArgumentException("Book not found"));
    }

}
