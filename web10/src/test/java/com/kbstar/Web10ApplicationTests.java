package com.kbstar;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class Web10ApplicationTests {

    @Autowired
    CustService service;

    @Test
    void contextLoads() throws Exception {
        Cust obj = new Cust("id01", "pwd01", "james");
        service.register(obj);
    }
}
