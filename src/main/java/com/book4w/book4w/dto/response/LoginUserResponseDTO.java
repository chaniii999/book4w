package com.book4w.book4w.dto.response;

import com.book4w.book4w.entity.Book;
import com.book4w.book4w.entity.Review;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Setter
@Getter
@ToString
@Builder
public class LoginUserResponseDTO {
    private String uuid;
    private String email;
    private String nickname;
    private List<Review> reviews;
    private List<Book> likedBooks;
}
