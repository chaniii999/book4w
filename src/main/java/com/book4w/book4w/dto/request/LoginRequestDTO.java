package com.book4w.book4w.dto.request;


import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter @ToString
@Builder
public class LoginRequestDTO {
    private String email;
    private String password;

}
