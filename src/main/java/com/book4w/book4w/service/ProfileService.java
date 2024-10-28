package com.book4w.book4w.service;

import com.book4w.book4w.dto.request.MemberRequestDTO;
import com.book4w.book4w.dto.response.LikedBooksResponseDTO;
import com.book4w.book4w.dto.response.MyReviewResponseDTO;
import com.book4w.book4w.dto.response.ProfileMemberResponseDTO;
import com.book4w.book4w.entity.Book;
import com.book4w.book4w.entity.BookLike;
import com.book4w.book4w.entity.Member;
import com.book4w.book4w.repository.BookLikeRepository;
import com.book4w.book4w.repository.BookRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@RequiredArgsConstructor
@Service
public class ProfileService {

    private final MemberService memberService;
    private final BookRepository bookRepository;
    private final BookLikeRepository bookLikeRepository;

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

    public ProfileMemberResponseDTO getMyProfile(String email) {
        Member member = memberService.findByEmail(email);
        if (member != null) {
            return ProfileMemberResponseDTO.builder()
                    .nickname(member.getNickname())
                    .email(member.getEmail())
                    .createdAt(member.getCreatedAt())
                    .build();
        }
        return null;
    }

    public void changeNickname(String email, String newNickname) {
        Member member = memberService.findByEmail(email);
        if (member != null) {
            member.setNickname(newNickname);
            memberService.update(member); // 회원 정보를 업데이트하는 메서드 호출
        }
    }



}
