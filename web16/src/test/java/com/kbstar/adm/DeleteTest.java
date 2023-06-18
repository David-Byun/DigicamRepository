package com.kbstar.adm;

import com.kbstar.dto.Adm;
import com.kbstar.dto.Cust;
import com.kbstar.service.AdmService;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

@Slf4j
@SpringBootTest
public class DeleteTest {

    @Autowired
    AdmService service;

    @Test
    void contextLoads() {

        try {
            service.remove("admin01");
            log.info("삭제 정상");
            service.get();
        } catch (Exception e) {
            log.info("삭제가 정상적으로 처리되지 않았습니다");
        }

    }
}
