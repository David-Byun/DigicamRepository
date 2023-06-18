package com.kbstar.cust;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class ModifyTest {

    @Autowired
    CustService service;

    @Test
    void contextLoads() {
        Cust obj = new Cust("id01", "pwd01", "james");
        try {
            service.modify(obj);
            log.info("수정 정상");
        } catch (Exception e) {
            log.info("에러..");
        }

    }
}
