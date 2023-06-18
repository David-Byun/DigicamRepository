package com.kbstar.ncp;

import com.kbstar.util.CFRCelebrityUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Slf4j
@SpringBootTest
class CFRCelebrityTests {

    @Value("${uploadimgdir}")
    String imgpath;

    //@Component 로 빈등록 했기 때문에 @Autowired로 등록가능
    @Autowired
    CFRCelebrityUtil celebrityUtil;

    @Test
    void contextLoads() throws ParseException {
        String imgname = "ma.jpeg";
        JSONObject result = (JSONObject) celebrityUtil.getResult(imgpath, imgname);
        log.info(result.toJSONString());
    }
}
