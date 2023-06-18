package com.kbstar.ncp;

import com.kbstar.util.OCRUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class OCR2Tests {

    //평문 암호화
    @Value("${uploadimgdir}")
    String imgpath;

    @Test
    void contextLoads() {
        JSONObject obj = null;
        obj = (JSONObject) OCRUtil.getResult(imgpath, "passport.png");


        JSONArray fields = (JSONArray) obj.get("fields");


        JSONObject country_obj0 = (JSONObject) fields.get(0);
        String country = (String)country_obj0.get("inferText");

        JSONObject country_obj1 = (JSONObject)fields.get(1);
        String num = (String)country_obj1.get("inferText");

        JSONObject country_obj2 = (JSONObject)fields.get(2);
        String surname = (String)country_obj2.get("inferText");

        JSONObject country_obj3 = (JSONObject)fields.get(3);
        String givenname = (String)country_obj3.get("inferText");

        JSONObject country_obj4 = (JSONObject)fields.get(4);
        String korname = (String)country_obj4.get("inferText");

        JSONObject country_obj5 = (JSONObject)fields.get(5);
        String birth = (String)country_obj5.get("inferText");

        JSONObject country_obj6 = (JSONObject)fields.get(6);
        String start = (String)country_obj6.get("inferText");

        JSONObject country_obj7 = (JSONObject)fields.get(7);
        String end = (String)country_obj7.get("inferText");

        System.out.println("end = " + end);


    }
}
