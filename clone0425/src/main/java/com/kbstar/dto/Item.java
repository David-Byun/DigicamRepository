package com.kbstar.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Date;

@AllArgsConstructor
@Getter
public class Item {
    private int id;
    private String name;
    private int price;
    private String imgname;
    private Date regdate;
}
