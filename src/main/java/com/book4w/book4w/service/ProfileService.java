package com.book4w.book4w.service;

import com.book4w.book4w.dto.response.LikedBooksResponseDTO;
import com.book4w.book4w.dto.response.MyReviewResponseDTO;
import com.book4w.book4w.dto.response.ProfileMemberResponseDTO;
import com.book4w.book4w.entity.Member;
import com.book4w.book4w.repository.BookLikeRepository;
import com.book4w.book4w.repository.BookRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@RequiredArgsConstructor
@Service
@Slf4j
public class ProfileService {

    private final MemberService memberService;


    @Transactional
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
        log.info("member: {}", member);

        if (member != null) {
            return member.getReviews().stream()
                    .map(MyReviewResponseDTO::fromReview)
                    .toList();
//                    .map(review -> MyReviewResponseDTO.builder()
//                            .bookId(review.getBook().getId())
//                            .bookName(review.getBook().getName())
//                            .writer(review.getBook().getWriter())
//                            .content(review.getContent())
//                            .rating(review.getRating())
//                            .build())
//                    .toList();
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
