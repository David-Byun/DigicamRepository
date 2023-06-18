package com.kbstar.markerdesc;


import com.kbstar.service.MarkerDescService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class GetMarkerDesc {

    @Autowired
    MarkerDescService service;
    @Test
    void contextLoads() {
        try {
            service.getMarkerDesc(107);
        } catch (Exception e) {
            log.info("error : {}", e);
        }
    }

}
