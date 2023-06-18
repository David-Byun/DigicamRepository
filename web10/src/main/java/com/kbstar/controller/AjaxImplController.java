package com.kbstar.controller;


import com.kbstar.dto.Cust;
import com.kbstar.dto.Marker;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@RestController
public class AjaxImplController {

    @RequestMapping("/getservertime")
    public Object getservertime() {
        Date date = new Date();
        return date;
    }

    @RequestMapping("/checkid")
    public int checkid(String id) {
        int result = 0;
        if (id.equals("qqqq") || id.equals("aaaa") || id.equals("ssss")) {
            result = 1;
        } else {
        }
        return result;
    }

    // Java Obejct ---> JSON
    @RequestMapping("/getdata")
    public Object getdata() {
        List<Cust> list = new ArrayList<>();
        list.add(new Cust("id01","pwd01","제임스1"));
        list.add(new Cust("id02","pwd02","제임스2"));
        list.add(new Cust("id03","pwd03","제임스3"));
        list.add(new Cust("id04","pwd04","제임스4"));
        list.add(new Cust("id05","pwd05","제임스5"));

        //ajax가 요청하면 ja를 보내준다. JSON (JavaScript Object Notation) [{},{},{}]
        JSONArray ja = new JSONArray();
        for(Cust obj:list){
            JSONObject jo = new JSONObject();
            Random r = new Random();
            int i = r.nextInt(100) + 1;
            jo.put("id", obj.getId());
            jo.put("pwd", obj.getPwd());
            jo.put("name", obj.getName()+i);
            ja.add(jo);
        }
        return ja;
    }

    @RequestMapping("/markers")
    public Object markers(String loc) {
        List<Marker> list = new ArrayList<>();
        if (loc.equals("s")) {
            list.add(new Marker(100, "국밥", "http://www.nate.com", 37.579609, 126.956, "a.jpg", "s"));
            list.add(new Marker(101, "떡볶이", "http://www.daum.com", 37.579615, 126.976, "b.jpeg", "s"));
            list.add(new Marker(102, "치킨", "http://www.naver.com", 37.579619, 126.966, "c.jpg", "s"));
        } else if (loc.equals("b")) {
            list.add(new Marker(103, "국밥", "http://www.nate.com", 35.1009643, 129.0291238, "a.jpg", "b"));
            list.add(new Marker(104, "떡볶이", "http://www.daum.com", 35.1009623, 129.0291220, "b.jpeg", "b"));
            list.add(new Marker(105, "치킨", "http://www.naver.com", 35.1009663, 129.0296220, "c.jpg", "b"));
        } else if (loc.equals("j")) {
            list.add(new Marker(106, "국밥", "http://www.nate.com", 33.5042977, 126.954048, "a.jpg", "j"));
            list.add(new Marker(107, "떡볶이", "http://www.daum.com", 33.5042987, 126.954038, "b.jpeg", "j"));
            list.add(new Marker(108, "치킨", "http://www.naver.com", 33.5042997, 126.954058, "c.jpg", "j"));
        }
        JSONArray ja = new JSONArray();
        for (Marker obj : list) {
            JSONObject jo = new JSONObject();
            jo.put("id", obj.getId());
            jo.put("title", obj.getTitle());
            jo.put("lat", obj.getLat());
            jo.put("lng", obj.getLng());
            jo.put("img", obj.getImg());
            jo.put("loc", obj.getLoc());
            ja.add(jo);
        }
        return ja;
    }
}
