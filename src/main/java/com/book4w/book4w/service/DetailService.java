package com.book4w.book4w.service;

import com.book4w.book4w.dto.request.MemberRequestDTO;
import com.book4w.book4w.entity.Book;
import com.book4w.book4w.entity.BookLike;
import com.book4w.book4w.entity.Member;
import com.book4w.book4w.repository.BookLikeRepository;
import com.book4w.book4w.repository.BookRepository;
import com.book4w.book4w.dto.response.DetailPageResponseDTO;
import com.book4w.book4w.repository.BookRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DetailService {
    private final BookRepository bookRepository;
    private final BookLikeRepository bookLikeRepository;
    private final MemberService memberService;

    public DetailPageResponseDTO getBookDetail(String id, String userId) {
        return bookRepository.findById(id)
            .map(book -> {
                boolean isLiked = bookLikeRepository.existsByBookIdAndMemberUuid(id, userId);
                return DetailPageResponseDTO.builder()
                    .id(book.getId())
                    .name(book.getName())
                    .writer(book.getWriter())
                    .pub(book.getPub())
                    .year(book.getYear())
                    .rating(book.getRating())
                    .reviewCount(book.getReviewCount())
                    .likeCount(book.getLikeCount())
                    .coverImage(book.getCoverImage())
                    .isLiked(isLiked) // 좋아요 상태 설정
                    .build();
            })
            .orElseThrow(() -> new IllegalArgumentException("Book not found"));
    }




    //
    @Transactional
    public boolean toggleLike(String bookId, String memberUuid) {
        Book book = bookRepository.findById(bookId).orElseThrow(() -> new RuntimeException("책을 찾을 수 없습니다."));
        Member member = memberService.findById(memberUuid).orElseThrow(() -> new RuntimeException("사용자를 찾을 수 없습니다."));

        boolean isLiked = bookLikeRepository.existsByBookIdAndMemberUuid(bookId, memberUuid);
        if (isLiked) {
            // 좋아요 삭제
            bookLikeRepository.deleteByBookIdAndMemberUuid(bookId, memberUuid);
            book.setLikeCount(book.getLikeCount() - 1);

            // Member의 likedBooks 목록에서 삭제
            member.getLikedBooks().remove(book);
        } else {
            // 좋아요 추가
            bookLikeRepository.save(new BookLike(null, book, member));
            book.setLikeCount(book.getLikeCount() + 1);

            // Member의 likedBooks 목록에 추가
            member.getLikedBooks().add(book);
            System.out.println("book = " + book);
        }


        // 변경사항을 저장
        memberService.save(member); // likedBooks 필드 업데이트 반영
        bookRepository.save(book); // 좋아요 수 반영
        return !isLiked;
    }

}
