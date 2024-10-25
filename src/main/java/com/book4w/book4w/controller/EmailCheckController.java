package com.book4w.book4w.controller;

import com.book4w.book4w.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;
@RestController
@RequiredArgsConstructor
public class EmailCheckController {

    private final MemberRepository memberRepository;

    @GetMapping("/check-email")
    public ResponseEntity<Map<String, Object>> checkEmail(@RequestParam("email") String email) {
        Map<String, Object> response = new HashMap<>();
        boolean exists = memberRepository.existsByEmail(email);
        response.put("exists", exists);
        return ResponseEntity.ok(response);
    }
}