package com.book4w.book4w.service;

import com.book4w.book4w.dto.response.LikedBooksResponseDTO;
import com.book4w.book4w.dto.response.MyReviewResponseDTO;
import com.book4w.book4w.entity.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
public class ProfileService {

    private final MemberService memberService;

    public List<LikedBooksResponseDTO> getLikedBooksForMember(String email) {
        Member member = memberService.findByEmail(email);
        if (member != null) {
            return member.getLikedBooks().stream()
                    .map(book -> LikedBooksResponseDTO.builder()
                            .id(book.getId())
                            .name(book.getName())
                            .writer(book.getWriter())
                            .pub(book.getPub())
                            .coverImage(book.getCoverImage())
                            .rating(book.getRating())
                            .reviewCount(book.getReviewCount())
                            .likeCount(book.getLikeCount())
                            .build())
                    .toList();
        }
        return Collections.emptyList();



    }

    public List<MyReviewResponseDTO> getmyReviewsForMember(String email) {
        Member member = memberService.findByEmail(email);
        if (member != null) {
            return member.getReviews().stream()
                    .map(review -> MyReviewResponseDTO.builder()
                            .bookName(review.getBook().getName())
                            .writer(review.getBook().getWriter())
                            .content(review.getContent())
                            .rating(review.getRating())
                            .build())
                    .toList();
        }
        return Collections.emptyList();
    }
}
