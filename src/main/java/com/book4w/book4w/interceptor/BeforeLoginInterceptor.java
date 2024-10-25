package com.book4w.book4w.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import java.io.PrintWriter;

import static com.book4w.book4w.utils.LoginUtils.isLogin;

@Configuration
public class BeforeLoginInterceptor implements HandlerInterceptor {


    // 비회원 - 프로필 페이지, 좋아요 리스트, 리뷰 리스트 접근 제한

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        // 세션 받아오기
        HttpSession session = request.getSession();

        // 세션에 데이터가 존재하지 않으면 null이 리턴
        if (!isLogin(session)) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter w = response.getWriter();
            String htmlCode = "<!DOCTYPE html>\n" +
                    "<html lang=\"ko\">\n" +
                    "<head>\n" +
                    "  <meta charset=\"UTF-8\">\n" +
                    "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                    "  <title>Document</title>\n" +
                    "</head>\n" +
                    "<body>\n" +
                    "\n" +
                    "  <script>\n" +
                    "    alert('로그인 이후 사용가능한 서비스입니다.');\n" +
                    "    location.href='/';\n" +
                    "  </script>\n" +
                    "  \n" +
                    "</body>\n" +
                    "</html>";
            w.write(htmlCode);
            w.flush();

            return false; // 컨트롤러로 들어가는 요청을 막음.
        }

        return true; // 로그인 안했으면 통과~

    }

}