package com.kbstar.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

import java.util.Date;

@Getter
@AllArgsConstructor
@ToString
public class Cart {
    private int id;
    private String custId;
    private int itemId;
    private int cnt;
    private Date rdate;

    //constructor 만들어서 테스트 해봐도 됨
    private String cust_name;
    private String item_name;
    private int item_price;
    private String item_imgname;

    public Cart(String custId, int itemId, int cnt) {
        this.custId = custId;
        this.itemId = itemId;
        this.cnt = cnt;
    }

    public Cart(int id, String custId, int itemId, int cnt) {
        this.id = id;
        this.custId = custId;
        this.itemId = itemId;
        this.cnt = cnt;
    }
}
