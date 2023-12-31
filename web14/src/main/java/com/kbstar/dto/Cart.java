package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Getter
@AllArgsConstructor
@ToString
@Setter
@NoArgsConstructor
public class Cart {
    private int id;
    private String cust_id;
    private int item_id;
    private int cnt;
    private Date rdate;

    public Cart(String cust_id, int item_id, int cnt) {
        this.cust_id = cust_id;
        this.item_id = item_id;
        this.cnt = cnt;
    }

    public Cart(int id, String cust_id, int item_id, int cnt) {
        this.id = id;
        this.cust_id = cust_id;
        this.item_id = item_id;
        this.cnt = cnt;
    }

    private String cust_name;
    private String item_name;
    private int item_price;
    private String item_imgname;


}