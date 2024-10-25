package com.book4w.book4w.repository;

import com.book4w.book4w.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface MemberRepository extends JpaRepository<Member, String> {
    Member findByEmail(String email);

    Member findBySessionId(String sessionId);


}