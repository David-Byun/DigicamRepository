package com.kbstar.controller;

import com.kbstar.dto.Cust;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());

    @RequestMapping("/")
    public String main(Model model) {
        model.addAttribute("center", "center");
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

    @RequestMapping(value ="/loginImpl")
    public String loginImpl(Model model, String id, String pwd) {
        logger.info(id + " " + pwd);
        return "index";
    }

    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("center", "register");
        return "index";
    }

    @RequestMapping(value ="/registerImpl")
    public String registerImpl(Model model, Cust custDTO) {
        logger.info("-----" + custDTO.toString() + "-----");
        model.addAttribute("rcust", custDTO);
        model.addAttribute("center", "registerok");
        return "index";
    }


}
