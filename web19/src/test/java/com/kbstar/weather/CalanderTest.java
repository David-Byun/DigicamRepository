package com.kbstar.weather;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Calendar;

@Slf4j
@SpringBootTest
class CalanderTest {

    @Test
    void contextLoads() throws Exception {
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH) + 1;
        String month_str = month + "";
        if (month_str.length() == 1) {
            month_str = "0" + month_str;
        }
        int day = c.get(Calendar.DATE);

        String today = "" + year + month_str + day + "0600";
        log.info(today);
    }
}

