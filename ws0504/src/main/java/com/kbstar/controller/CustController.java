package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/cust")
public class CustController {

    @Autowired
    CustService custService;

    @Autowired
    BCryptPasswordEncoder encoder;
    String dir = "cust/";

    @RequestMapping("/add")
    public String add(Model model) throws Exception {
        List<Cust> list = null;
        list = custService.get();
        System.out.println("list = " + list);
        model.addAttribute("clist", list);
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Cust> list = null;
        list = custService.get();
        System.out.println("list = " + list);
        model.addAttribute("clist", list);
        model.addAttribute("center", dir + "all");
        return "index";
    }

    // Cust 객체가 만들어지면서 체크를 해준다(dto에 명시되었던 내용들)
    @RequestMapping("/addimpl")
    public String addimpl(Model model, @Validated Cust cust, Errors errors) throws Exception {
        if (errors.hasErrors()) {
            List<ObjectError> es = errors.getAllErrors();
            String msg = "";
            for (ObjectError e : es) {
                msg += "<h4>";
                msg += e.getDefaultMessage();
                msg += "</h4>";
            }
            throw new Exception(msg);
        }
        cust.setPwd(encoder.encode(cust.getPwd()));
        custService.register(cust);
        return "redirect:/cust/all";
    }

    @RequestMapping("/detail")
    public String myinfo(Model model, String id) throws Exception {
        Cust cust = custService.get(id);
        model.addAttribute("custinfo", cust);
        model.addAttribute("center", "custinfo");
        return "index";
    }

    @RequestMapping("/detailimpl")
    public String myinfoimpl(Model model,Cust cust) {
        cust.setPwd(encoder.encode(cust.getPwd()));
        try {
            custService.modify(cust);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("custinfo", cust);
        model.addAttribute("center", "custinfo");
        return "redirect:/cust/detail?id="+cust.getId();
    }

    @RequestMapping("/delete")
    public String delete(String id) {
        try {
            custService.remove(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/cust/all";
    }
}
