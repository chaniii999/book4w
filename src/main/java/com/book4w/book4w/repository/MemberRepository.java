package com.book4w.book4w.repository;

import com.book4w.book4w.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, String> {
}