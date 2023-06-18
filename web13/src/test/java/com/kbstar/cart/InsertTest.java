package com.kbstar.cart;

import com.kbstar.dto.Adm;
import com.kbstar.dto.Cart;
import com.kbstar.service.AdmService;
import com.kbstar.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

@Slf4j
@SpringBootTest
public class InsertTest {

    @Autowired
    CartService service;

    @Test
    void contextLoads() {
        Cart cart =  new Cart("abc", 101, 7);
        try {
            service.register(cart);
            service.get();
        } catch (Exception e) {
            log.info("에러 발생");
        }
    }
}
