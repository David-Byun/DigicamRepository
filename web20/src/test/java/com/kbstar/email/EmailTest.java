package com.kbstar.email;

import com.kbstar.dto.Cust;
import com.kbstar.mail.SendMailUtil;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

@Slf4j
@SpringBootTest
public class EmailTest {

    @Autowired
    SendMailUtil sendMailUtil;

    @Test
    void contextLoads() throws Exception {
        log.info("start email test ================");
        sendMailUtil.sendAuthMessage("kbdavid890414@gmail.com", "회원가입을 축하드립니다.");
    }
}
