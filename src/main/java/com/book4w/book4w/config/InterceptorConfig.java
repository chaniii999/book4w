package com.book4w.book4w.config;

import com.book4w.book4w.interceptor.AfterLoginInterceptor;
import com.book4w.book4w.interceptor.BeforeLoginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig  implements WebMvcConfigurer {

    @Autowired
    private AfterLoginInterceptor afterLoginInterceptor;
    @Autowired
    private BeforeLoginInterceptor beforeLoginInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry
                .addInterceptor(afterLoginInterceptor)
                .addPathPatterns("/sign-in", "/sign-up");
        registry
                .addInterceptor(beforeLoginInterceptor)
                .addPathPatterns("/profile/info","/profile/liked-books","/profile/my-reviews");
    }
}
