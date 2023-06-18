package com.kbstar.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@RestController
public class ChartController {

    @RequestMapping("/chart/get")
    public Object getChart() {
        JSONArray json = new JSONArray();
        List<String> webs = new ArrayList<>();
        int sum = 0;
        webs.add("Chrome");
        webs.add("Safari");
        webs.add("Edge");
        webs.add("Firefox");
        webs.add("Other");

        //[{},{}]
        for (String web : webs) {
            Random r = new Random();
            JSONObject obj = new JSONObject();

            //총합이 100인 5개의 랜덤숫자 추출
            int idx = r.nextInt(25) + 1;
            if (web == "Other") {
                obj.put("y", 100 - sum);
            } else {
                obj.put("y", idx);
                sum += idx;
            }
            obj.put("name", web);
            obj.put("drilldown",web);
            json.add(obj);
        }
        return json;
    }

    @RequestMapping("/areachart/get")
    public Object getAreaChart() {
        JSONObject obj = new JSONObject();
        JSONArray json = new JSONArray();
        for (int i = 0; i < 12; i++) {
            Random r = new Random();
            int idx = r.nextInt(6000) + 1;
            json.add(idx);
        }
        String[] arr ={"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
        obj.put("data", json);
        obj.put("categories", arr);
        return obj;
    }

    @RequestMapping("/barchart/get")
    public Object getBarChart() {
        JSONArray json = new JSONArray();
        JSONArray json1 = new JSONArray();
            for (int i = 0; i < 5; i++) {
                Random r = new Random();
                int idx = r.nextInt(25) + 1;
                json1.add(idx);
                json.add(json1);
            }

        return json;
    }

}
