package com.book4w.book4w.utils;

import com.book4w.book4w.dto.response.LoginUserResponseDTO;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginUtils {
    //로그인 키
    public static final String LOGIN_KEY = "login";

    public static boolean isLogin(HttpSession session) {
        return session.getAttribute(LOGIN_KEY) != null;
    }

    public static String getCurrentLoginMemberAccount(HttpSession session) {
        LoginUserResponseDTO dto
                = (LoginUserResponseDTO) session.getAttribute(LOGIN_KEY);
        return dto.getEmail();
    }

    // 내가 쓴 게시물인지 확인해 주는 메서드
    public static boolean isMine(HttpSession session, String targetAccount) {
        return targetAccount.equals(getCurrentLoginMemberAccount(session));
    }
}
