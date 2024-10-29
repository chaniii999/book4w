package com.book4w.book4w;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@EnableJpaAuditing
@SpringBootApplication
public class Book4wApplication {

    public static void main(String[] args) {
        SpringApplication.run(Book4wApplication.class, args);
    }
}