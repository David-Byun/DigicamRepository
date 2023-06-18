package com.kbstar.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

@RestController
public class ChartImplController {

    @RequestMapping("/chart02")
    public Object chart02() {
        //{'category' : [], 'datas' : []} 이런식으로 만들면 끄집어 낼 수 있음
        //json array에서 분석된 결과를 가져와야함 data 12개
        JSONObject jo = new JSONObject();

        JSONArray jaCnt = new JSONArray();

        for (int i = 1; i < 12; i++) {
            Random r = new Random();
            int cnt = r.nextInt(10000) + 1;
            jaCnt.add(cnt);
        }
        JSONArray jaYear = new JSONArray();
        for (int i = 2011; i <= 2023; i++) {
            jaYear.add(i);
        }
        jo.put("category", jaYear);
        jo.put("datas", jaCnt);



        return jo;
    }

    @RequestMapping("/chart0301")
    public Object chart0301() {
        // [[],[],[]]
        JSONArray ja = new JSONArray();
        for (int i = 1; i <= 5; i++) {
            Random r = new Random();
            int num = r.nextInt(20)+1;
            JSONArray jadata = new JSONArray();
            jadata.add("data:" + num);
            jadata.add(num);
            ja.add(jadata);
        }
        System.out.println(ja);
        return ja;
    }

    @RequestMapping("/chart0302")
    public Object chart0302() {
        // [{}, {}, {}]
        JSONArray ab = new JSONArray();

        for (int i = 1; i <= 10; i++) {
            Random r = new Random();
            JSONObject obj = new JSONObject();
            int aa = r.nextInt(100)+1;
            int bb = r.nextInt(100)+1;
            obj.put("name", "name" + aa);
            obj.put("value", bb);
            ab.add(obj);
        }
        return ab;
    }

    @RequestMapping("/chart0303")
    public Object chart0303() {
        Random r = new Random();
        // [[],[],[]]
        JSONObject jo = new JSONObject();

        JSONArray pre = new JSONArray();
        JSONArray temp = new JSONArray();

        for (int i = 1; i < 12; i++) {
            int cnt = r.nextInt(100) + 1;
            pre.add(cnt);
        }

        for (int i = 2011; i <= 2023; i++) {
            int tem = r.nextInt(20) + 1;
            temp.add(tem);
        }
        jo.put("precipitation", pre);
        jo.put("temp", temp);

        return jo;

    }


    @RequestMapping("/chart05")
    public Object checkid(String year) {
        JSONArray ja = new JSONArray();
        for (int i = 1; i <= 12; i++) {
            Random r = new Random();
            int num = r.nextInt(100)+1;
            ja.add(num);
        }
        return ja;
    }


}
















