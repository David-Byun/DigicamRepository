package com.kbstar.controller;

import com.kbstar.dto.Cust;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cust")
public class CustController {

    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());
    private final String DIR = "cust/";

    // 127.0.0.1/cust
    @RequestMapping("")
    public String main(Model model) {
        model.addAttribute("center", DIR+"center");
        model.addAttribute("left", DIR+"left");
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("center", DIR+"add");
        model.addAttribute("left", DIR+"left");
        return "index";
    }

    @RequestMapping("/get")
    public String get(Model model, String id) {
        Cust cust = new Cust(id, "xxx","james");
        model.addAttribute("gcust", cust);
        model.addAttribute("center", DIR+"get");
        model.addAttribute("left", DIR+"left");
        return "index";
    }

    @RequestMapping("/all")
    public String all(Model model) {
        List<Cust> list = new ArrayList<>();
        list.add(new Cust("id01","pwd01","제임스1"));
        list.add(new Cust("id02","pwd02","제임스2"));
        list.add(new Cust("id03","pwd03","제임스3"));
        list.add(new Cust("id04","pwd04","제임스4"));
        list.add(new Cust("id05","pwd05","제임스5"));
        model.addAttribute("clist", list);
        model.addAttribute("center", DIR+"all");
        model.addAttribute("left", DIR+"left");
        return "index";
    }

    @RequestMapping("/link")
    public String link(Model model) {
        model.addAttribute("center", DIR+"link");
        model.addAttribute("left", DIR+"left");
        return "index";
    }
}
