package com.kbstar;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Slf4j
@SpringBootTest
class Web14ApplicationTests {

    //평문 암호화
    @Autowired
    private BCryptPasswordEncoder encoder;

    @Test
    void contextLoads() {
        String rawPassword = "pwd01";
        String encPassword = encoder.encode(rawPassword);
        log.info("-------------------------------------");
        log.info(rawPassword);
        log.info("암호화 된 비번" + encPassword);
        log.info("-------------------------------------");
        boolean result = encoder.matches(rawPassword,encPassword);
        log.info(result+""); //boolean 못들어가서 String 값으로 변환
    }
}
