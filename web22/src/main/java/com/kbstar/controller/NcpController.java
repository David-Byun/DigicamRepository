package com.kbstar.controller;

import com.kbstar.dto.Ncp;
import com.kbstar.util.CFRCelebrityUtil;
import com.kbstar.util.CFRFaceUtil;
import com.kbstar.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

@Controller
@Slf4j
public class NcpController {

    @Value("${uploadimgdir}")
    String imgpath;

    @Autowired
    CFRCelebrityUtil celebrityUtil;

    @Autowired
    CFRFaceUtil cfrFaceUtil;

    @RequestMapping("/cfr1impl")
    public String cfr1(Model model, Ncp ncp) throws ParseException {

        // 이미지 저장한다.
        FileUploadUtil.saveFile(ncp.getImg(), imgpath);

        // NCP 에 요청한다.
        String imgname = ncp.getImg().getOriginalFilename(); //이미지가 나옴
        JSONObject result = (JSONObject) celebrityUtil.getResult(imgpath, imgname);
        log.info(result.toJSONString());

        JSONArray faces = (JSONArray) result.get("faces");
        JSONObject obj = (JSONObject) faces.get(0);
        JSONObject celebrity = (JSONObject) obj.get("celebrity");
        String value = (String) celebrity.get("value");


        // 결과를 받는다.
        model.addAttribute("result", value);
        model.addAttribute("center", "cfr1");

        return "index";
    }


    @RequestMapping("/cfr2impl")
    public String cfr2(Model model, Ncp ncp) throws ParseException {

        // 이미지 저장한다.
        FileUploadUtil.saveFile(ncp.getImg(), imgpath);

        // NCP 에 요청한다.
        String imgname = ncp.getImg().getOriginalFilename(); //이미지가 나옴
        JSONObject result = (JSONObject) cfrFaceUtil.getResult(imgpath, imgname);
        log.info(result.toJSONString());

        JSONArray faces = (JSONArray) result.get("faces");
        JSONObject obj = (JSONObject) faces.get(0);
        JSONObject gender = (JSONObject) obj.get("gender");
        JSONObject emotion = (JSONObject) obj.get("emotion");
        JSONObject pose = (JSONObject) obj.get("pose");
        JSONObject age = (JSONObject) obj.get("age");

        String emotion_value = (String) emotion.get("value");
        String gender_value = (String) gender.get("value");
        String pose_value = (String) pose.get("value");
        String age_value = (String) age.get("value");

        Map<String, String> map = new HashMap<>();

        map.put("emotion", emotion_value);
        map.put("gender", gender_value);
        map.put("pose", pose_value);
        map.put("age", age_value);
        model.addAttribute("result", map);
        model.addAttribute("center", "cfr2");
        return "index";
    }

    @RequestMapping("/mycfr")
    public String mycfr(Model model, String imgname) throws ParseException {

        JSONObject result = (JSONObject) cfrFaceUtil.getResult(imgpath, imgname);
        log.info(result.toJSONString());

        JSONArray faces = (JSONArray) result.get("faces");
        JSONObject obj = (JSONObject) faces.get(0);
        JSONObject gender = (JSONObject) obj.get("gender");
        JSONObject emotion = (JSONObject) obj.get("emotion");
        JSONObject pose = (JSONObject) obj.get("pose");
        JSONObject age = (JSONObject) obj.get("age");

        String emotion_value = (String) emotion.get("value");
        String gender_value = (String) gender.get("value");
        String pose_value = (String) pose.get("value");
        String age_value = (String) age.get("value");

        Map<String, String> map = new HashMap<>();

        map.put("emotion", emotion_value);
        map.put("gender", gender_value);
        map.put("pose", pose_value);
        map.put("age", age_value);
        model.addAttribute("result", map);
        model.addAttribute("center", "pic");
        return "index";
    }

}
