package com.kbstar.item;

import com.kbstar.dto.Item;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

@Slf4j
@SpringBootTest
class InsertTest {

    @Autowired
    ItemService service;
    @Test
    void contextLoads() {

        Item obj = new Item(0, "모자", 10000, "hat.jpg", null);
        try {
            service.register(obj);
            log.info("등록 정상..");
            service.get();
        } catch (Exception e) {
            if(e instanceof DuplicateKeyException){  //중복된 키값에 대한 예외처리 필수
                log.info("ID가 중복되었습니다-------------------------------------");
            }else{
                log.info("시스템 장애입니다-------------------------------------");
            }
        }
    }

}
