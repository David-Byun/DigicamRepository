package com.kbstar.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@AllArgsConstructor
@Setter
@NoArgsConstructor
@Getter
public class Item {
    private int id;
    private String name;
    private int price;
    private String imgname;
    private Date rdate;

    private MultipartFile img;
    public Item(int id, String name, int price, String imgname, Date rdate) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.imgname = imgname;
        this.rdate = rdate;
    }
}
