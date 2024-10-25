package com.book4w.book4w.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity // 스프링 시큐리티 모듈을 활성화.
public class SecurityConfig {

    // 시큐리티 기본 설정 (권한 처리, 초기 로그인 화면 없애기 등등...)
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        // 스프링 시큐리티에서 기본으로 제공하는 CSRF 토큰 공격을 방지하기 위한 장치 해제.
        // CSRF(Cross Site Request Forgery) 사이트 간 요청 위조
        http.csrf(AbstractHttpConfigurer::disable);

        http.authorizeHttpRequests(
                // 모든 요청에 대해 인증을 하지 않겠다.
                auth -> auth.requestMatchers("/**").permitAll()
        );

        return http.build();
    }

    // 비밀번호 암호화 객체를 빈 등록
    // 직접 생성한 클래스의 경우에는 @Component 등으로 빈 등록이 가능하지만,
    // 외부에서 제공받는 객체의 경우에는 @Bean으로 등록해야 합니다.
    @Bean
    public PasswordEncoder encoder() {
        return new BCryptPasswordEncoder();
    }




}















