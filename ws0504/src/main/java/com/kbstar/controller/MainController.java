package com.kbstar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @RequestMapping("/")
    public String index(Model model) {
        return "index";
    }

    @RequestMapping("/card")
    public String card(Model model) {
        model.addAttribute("center", "card");
        return "index";
    }

    @RequestMapping("/chart")
    public String chart(Model model) {
        model.addAttribute("center", "chart");
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", "login");
        return "index";
    }

    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("center", "register");
        return "index";
    }

    @RequestMapping("/livechart")
    public String liveChart(Model model) {
        model.addAttribute("center", "livechart");
        return "index";
    }

}
