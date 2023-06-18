package com.kbstar.item;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Cust;
import com.kbstar.dto.Item;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectPageTest {

    @Autowired
    ItemService service;

    @Test
    void contextLoads() {
        PageInfo<Item> pageInfo; //결과값이 나옴
        try {
            pageInfo = new PageInfo<>(service.getPage(1), 5); //하단 네이게이션바
        } catch (Exception e) {
            log.info("오류..");
        }
    }

}
