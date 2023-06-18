package com.kbstar.ncp;

import com.kbstar.util.OCRUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.Map;

@Slf4j
@SpringBootTest
class OCRTests {

    //평문 암호화
    @Value("${uploadimgdir}")
    String imgpath;

    @Test
    void contextLoads() {
        JSONObject jo = null;
        jo = (JSONObject) OCRUtil.getResult(imgpath, "biz2.jpeg");

        JSONArray array = (JSONArray) jo.get("images");
        JSONObject ob = (JSONObject) array.get(0);
        JSONObject fields = (JSONObject) ob.get("fields");

        JSONObject bizArr1 = (JSONObject) fields.get(0);
        JSONObject bizArr2 = (JSONObject) fields.get(1);
        JSONObject bizArr3 = (JSONObject) fields.get(2);
        JSONObject bizArr4 = (JSONObject) fields.get(3);
        JSONObject bizArr5 = (JSONObject) fields.get(4);


        String biznum = (String) bizArr1.get("name");
        String bizname = (String) bizArr2.get("name");
        String bizowner = (String) bizArr3.get("name");
        String bizdate = (String) bizArr4.get("name");
        String bizadd = (String) bizArr5.get("name");

        System.out.println("bizadd = " + bizadd);


    }
}
