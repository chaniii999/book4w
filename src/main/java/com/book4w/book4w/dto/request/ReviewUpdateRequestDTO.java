package com.book4w.book4w.dto.request;


import com.book4w.book4w.entity.Book;
import com.book4w.book4w.entity.Member;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
@Builder
public class ReviewUpdateRequestDTO {

    private String content;

    private Member member;

    private Book book;
}
