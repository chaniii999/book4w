package com.book4w.book4w.dto.request;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter @ToString
public class PageDTO {

    private int pageNo; // 요청 페이지번호
    private int amount; // 페이지 당 게시물 수

    public PageDTO() {
        this.pageNo = 1;
        this.amount = 9;
    }

    public int getPageStart() {
        return (pageNo - 1) * amount;
    }

}
