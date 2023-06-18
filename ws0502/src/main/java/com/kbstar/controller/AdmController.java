package com.kbstar.controller;

import com.kbstar.dto.Adm;
import com.kbstar.service.AdmService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class AdmController {

    private final AdmService service;
    private final BCryptPasswordEncoder encoder;


    @RequestMapping("/loginimpl")
    public String login(Model model, String id, String pwd, HttpSession session) throws Exception {
        Adm adm = null;
        String nextPage = "loginfail";
        try {
            adm = service.get(id);
            if (adm != null && encoder.matches(pwd, adm.getPwd())) {
                nextPage = "loginok";
                session.setAttribute("loginadm", adm);

            }
        } catch (Exception e) {

            throw new Exception("어드민 회원 아이디 혹은 패스워드가 달라요!");
        }
        model.addAttribute("center", nextPage);
        return "index";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        //세션에 있는 정보를 없애는 내용
        if (session != null) {
            //세션에 있는 모든 정보를 없애라
            session.invalidate();
        }
        return "index";
    }

    @RequestMapping("/myinfo")
    public String myinfo(Model model, String id) {
        Adm admin = null;
        try {
            admin = service.get(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("adm", admin);
        model.addAttribute("center", "myinfo");
        return "index";
    }

    @RequestMapping("/registerimpl")
    public String register(Model model, Adm adm, HttpSession session) throws Exception {
        try {
            adm.setPwd(encoder.encode(adm.getPwd()));
            service.register(adm);
        } catch (Exception e) {
            throw new Exception("회원 등록이 실패했어요 다시 시도해주세요");
        }
        session.setAttribute("loginadm", adm);
        model.addAttribute("center", "registerok");
        return "index";
    }

    @RequestMapping("/myinfoimpl")
    public String myinfo(Model model, Adm adm) throws Exception {
        try {
            adm.setPwd(encoder.encode(adm.getPwd()));
            service.modify(adm);
        } catch (Exception e) {
            throw new Exception("회원 등록이 실패했어요 다시 시도해주세요");
        }
        return "redirect:/myinfo?id=" + adm.getId();
    }
}
