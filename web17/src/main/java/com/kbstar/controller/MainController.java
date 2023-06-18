package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.dto.Ncp;
import com.kbstar.service.CustService;
import com.kbstar.util.FileUploadUtil;
import com.kbstar.util.OCRUtil;
import com.kbstar.util.WeatherUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Slf4j
@Controller
public class MainController {

    //평문 암호화
    @Value("${uploadimgdir}")
    String imgpath;


    @Value("${adminserver}")
    String adminserver;

    @Autowired
    CustService custService;

    @Autowired
    private BCryptPasswordEncoder encoder;

    @RequestMapping("/")
    public String main(Model model) throws Exception {
//        String result = WeatherUtil.getWeather1("109");
        model.addAttribute("center", "center");
//        model.addAttribute("weatherinfo", result);
        return "index";
    }

    @RequestMapping("/ocr1impl")
    public String ocr1impl(Model model, Ncp ncp) {
        // img를 서버에 저장한다
        FileUploadUtil.saveFile(ncp.getImg(), imgpath);

        // NCP에 요청한다  :: test했던 것 복붙
        String imgname = ncp.getImg().getOriginalFilename(); //이미지명 추출
        JSONObject result =
                (JSONObject)OCRUtil.getResult(imgpath, imgname);
        Map map = OCRUtil.getData(result);

        model.addAttribute("result",map);
        model.addAttribute("center","ocr1");
        return "index";
    }



    @RequestMapping("/ocr2impl")
    public String ocr2impl(Model model, Ncp ncp) {
        // img를 서버에 저장한다
        FileUploadUtil.saveFile(ncp.getImg(), imgpath);

        // NCP에 요청한다  :: test했던 것 복붙
        String imgname = ncp.getImg().getOriginalFilename(); //이미지명 추출
        JSONObject result =
                (JSONObject)OCRUtil.getResult(imgpath, imgname);
        Map map = OCRUtil.getData2(result);

        model.addAttribute("result",map);
        model.addAttribute("center","ocr2");
        return "index";
    }

    // /quics?page=bs01
    @RequestMapping("/quics")
    public String quics(String page) {
        return page;
    }

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", "login");
        return "index";
    }

    @RequestMapping("/cfr1")
    public String cfr1(Model model) {
        model.addAttribute("center", "cfr1");
        return "index";
    }

    @RequestMapping("/ocr1")
    public String ocr1(Model model) {
        model.addAttribute("center", "ocr1");
        return "index";
    }

    @RequestMapping("/ocr2")
    public String ocr2(Model model) {
        model.addAttribute("center", "ocr2");
        return "index";
    }


    @RequestMapping("/cfr2")
    public String cfr2(Model model) {
        model.addAttribute("center", "cfr2");
        return "index";
    }


    @RequestMapping("/websocket")
    public String websocket(Model model) {
        model.addAttribute("adminserver", adminserver);
        model.addAttribute("center", "websocket");
        return "index";
    }

    @RequestMapping("/pic")
    public String pic(Model model) {
        model.addAttribute("center", "pic");
        return "index";
    }


    @RequestMapping("/custinfo")
    public String custinfo(Model model, String id) throws Exception {
        Cust cust = null;
        try {
            cust = custService.get(id);
        } catch (Exception e) {
            throw new Exception("시스템 장애");
        }
        model.addAttribute("custinfo", cust);
        model.addAttribute("center", "custinfo");
        return "index";
    }

    @RequestMapping("/custinfoimpl")
    public String custinfoimpl(Model model, Cust cust) throws Exception {
        try {
            log.info(cust.getPwd());
            //비밀번호 수정하기 전에 encode 해서 변경해줌, 암호화는 복호화 안되며 match 함수를 통해서만 비교 가능 수정되면 변경정보 확인을 위해 cust info 페이지로 이동
            cust.setPwd(encoder.encode(cust.getPwd()));
            custService.modify(cust);
        } catch (Exception e) {
            throw new Exception("시스템 장애");
        }
        // cust info 페이지로 이동시켜줘야함, java 코딩에서는 더해줘야함
        return "redirect:/custinfo?id=" + cust.getId();
    }


    @RequestMapping("/logout")
    public String logout(Model model, HttpSession session) {
        //세션에 있는 정보를 없애는 내용
        if (session != null) {
            //세션에 있는 모든 정보를 없애라
            session.invalidate();
        }
        return "index";
    }

    @RequestMapping("/loginimpl")
    public String loginImpl(Model model, String id, String pwd, HttpSession session) throws Exception {
        Cust cust = null;
        String nextPage = "loginfail";
        try {
            cust = custService.get(id);
            //회원 아이디가 있을 경우
            if (cust != null && encoder.matches(pwd, cust.getPwd())) {
                //& : 앞과 뒤 모두 실행, && : 앞에서 실패하면 바로 실패
                nextPage = "loginok";
                //메모리에 세션 유지시켜줌(한 라인으로, 기본 30분이며 setTimeout 하면 시간 조정 가능)
                session.setMaxInactiveInterval(100000);
                session.setAttribute("logincust", cust);
                //세션에서 담은 것도 화면에서 끄집어 낼 수 있음
            }
        } catch (Exception e) {
            throw new Exception("시스템 장애 잠시 후 다시 로그인하세요.");
        }
        model.addAttribute("center", nextPage);
        return "index";
    }

    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("center", "register");
        return "index";
    }

    @RequestMapping(value ="/registerimpl")
    public String registerImpl(Model model, Cust cust, HttpSession session) throws Exception {
        try {
            cust.setPwd(encoder.encode(cust.getPwd()));
            custService.register(cust);
            session.setAttribute("logincust", cust);
        } catch (Exception e) {
            throw new Exception("가입 오류");
        }
        model.addAttribute("rcust", cust);
        model.addAttribute("center", "registerok");
        return "index";
    }
}
