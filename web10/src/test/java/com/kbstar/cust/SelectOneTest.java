package com.kbstar.cust;

import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class SelectOneTest {


    @Autowired
    CustService service;

    @Test
    void contextLoads() {
        String obj = "id01";
        try {
            service.get(obj);
        } catch (Exception e) {
            log.info("오류");
        }
    }
}
