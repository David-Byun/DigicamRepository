package com.kbstar.adm;

import com.kbstar.service.AdmService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class SelectOneTest {


    @Autowired
    AdmService service;

    @Test
    void contextLoads() {
        try {
            service.get("admin03");
            log.info("조회 정상");
        } catch (Exception e) {
            log.info("에러..");
        }

    }
}
