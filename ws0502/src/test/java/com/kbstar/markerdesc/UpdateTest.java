package com.kbstar.markerdesc;

import com.kbstar.dto.MarkerDesc;
import com.kbstar.service.MarkerDescService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class UpdateTest {
    @Autowired
    MarkerDescService service;
    @Test
    void contextLoads() {
        MarkerDesc obj = new MarkerDesc(109, "수정닭갈비", 3000, "yang2.jpg" );
        try {

            service.modify(obj);
            log.info("등록 정상..");
        } catch (Exception e) {
                log.info("시스템 장애입니다...------------------------------------------");
                e.printStackTrace();
        }
    }

}
