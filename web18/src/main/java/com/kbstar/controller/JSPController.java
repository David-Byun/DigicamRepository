package com.kbstar.controller;

import com.kbstar.dto.Cust;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/jsp")
public class JSPController {

    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());
    private final String DIR = "jsp/";

    // 127.0.0.1/cust
    @RequestMapping("/jsp01")
    public String jsp01(Model model) {
        model.addAttribute("num", 1_000);
        Cust cust = new Cust("id01","pwd01","이말숙");
        model.addAttribute("cust", cust);
        model.addAttribute("center", DIR+"jsp01");
        Date date = new Date();
        model.addAttribute("cdate", date);
        model.addAttribute("left", DIR+"left");
        return "index";
    }

    @RequestMapping("/jsp02")
    public String add(Model model) {
        Cust cust = new Cust("id01","pwd01","제임스");
        model.addAttribute("rcust", cust);
        model.addAttribute("num", 1);
        model.addAttribute("center", DIR+"jsp02");
        model.addAttribute("left", DIR+"left");
        return "index";
    }

    @RequestMapping("/jsp03")
    public String jsp03(Model model) {
        List<Cust> list = new ArrayList<>();
        list.add(new Cust("id01","pwd01","제임스1"));
        list.add(new Cust("id02","pwd02","제임스2"));
        list.add(new Cust("id03","pwd03","제임스3"));
        list.add(new Cust("id04","pwd04","제임스4"));
        list.add(new Cust("id05","pwd05","제임스5"));
        model.addAttribute("clist", list);

        model.addAttribute("center", DIR+"jsp03");
        model.addAttribute("left", DIR+"left");
        return "index";
    }

    @RequestMapping("/jsp04")
    public String jsp04(Model model) {
        model.addAttribute("center", DIR+"jsp04");
        model.addAttribute("left", DIR+"left");
        return "index";
    }

    @RequestMapping("/jsp05")
    public String jsp05(Model model) {
        model.addAttribute("center", DIR+"jsp05");
        model.addAttribute("left", DIR+"left");
        return "index";
    }
}
