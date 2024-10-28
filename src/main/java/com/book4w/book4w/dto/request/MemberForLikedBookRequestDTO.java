package com.book4w.book4w.dto.request;

import com.book4w.book4w.entity.Book;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Setter
@Getter
@ToString
@Builder
public class MemberForLikedBookRequestDTO {
    private List<Book> likedBooks;
}
