package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.mapper.CustMapper;
import com.kbstar.service.CustService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/cust")
public class CustController {

    //Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());

    private final CustService custService;
    private final String DIR = "cust/";

    // 127.0.0.1/cust
    @RequestMapping("")
    public String main(Model model) {
        model.addAttribute("center", DIR+"center");
        model.addAttribute("left", DIR+"left");
        Random r = new Random();
        int inx = r.nextInt(1000) + 1;
        log.info(inx + "");
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
    public String all(Model model) throws Exception {
        List<Cust> list = null;
        try {
            list = custService.get();
        } catch (Exception e) {
            throw new Exception("시스템 장애 : ER0001");
        }
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






