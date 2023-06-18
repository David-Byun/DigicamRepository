package com.kbstar.dto;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Sales {
    private String rdate; // 2023-01-02 자바에선 rdate, DB에서는 날짜형식 sql TO_DATE 사용
    private int price;
    private String gender;
}
