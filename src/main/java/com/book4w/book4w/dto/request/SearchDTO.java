package com.book4w.book4w.dto.request;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@ToString
public class SearchDTO extends PageDTO {
    private String type, keyword;

    public SearchDTO() {
        this.type = "";
        this.keyword = "";
    }
}
