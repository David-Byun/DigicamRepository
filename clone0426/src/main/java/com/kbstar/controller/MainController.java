package com.kbstar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @RequestMapping("/")
    public String index(Model model) {
        model.addAttribute("center", "index");
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


    @RequestMapping("/livechart")
    public String livechart(Model model) {
        model.addAttribute("center", "livechart");
        return "index";
    }


}
