package com.kbstar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class MainController {
    @RequestMapping("/")
    public String main() {
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

    @RequestMapping(value ="/loginSuccess", method = {RequestMethod.GET})
    public String loginSuccess(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("id", params.get("id"));
        model.addAttribute("pwd", params.get("pwd"));
        return "loginSuccess";
    }

    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("center", "register");
        return "index";
    }


}
