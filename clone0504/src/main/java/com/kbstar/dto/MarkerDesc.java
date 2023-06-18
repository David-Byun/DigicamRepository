package com.kbstar.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class MarkerDesc {
    private int id;
    private int markerId;
    private String item;
    private int price;
    private String imgname;

    public MarkerDesc(int markerId, String item, int price, String imgname) {
        this.markerId = markerId;
        this.item = item;
        this.price = price;
        this.imgname = imgname;
    }
}
