package com.book4w.book4w.repository;

import com.book4w.book4w.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, String> {



    @Query("SELECT m.memberUuid FROM Member m WHERE m.memberEmail = :email AND m.memberPw = :password)
    String findMemberUuid(@Param("email") String email, @Param("password") String password);
}