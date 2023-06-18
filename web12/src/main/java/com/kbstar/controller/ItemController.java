package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Item;
import com.kbstar.service.ItemService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/item")
@RequiredArgsConstructor
public class ItemController {

    private final ItemService itemService;
    private final String DIR = "item/";

    @RequestMapping("")
    public String main(Model model) {
        model.addAttribute("center", DIR + "center");
        model.addAttribute("left", DIR + "left");
        return "index";
    }

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Item> list = null;
        try {
            list = itemService.get();
        } catch (Exception e) {
            throw new Exception("시스템 장애 : ER0002");
        }
        model.addAttribute("allItem", list);
        model.addAttribute("center", DIR + "all");
        model.addAttribute("left", DIR + "left");
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("center", DIR + "add");
        model.addAttribute("left", DIR + "left");
        return "index";
    }

    /*
        항상 몇번째 페이지인지 요청하는 내용이 필요함
     */
    @RequestMapping("/allpage")
    public String allpage(Model model, @RequestParam(required = false, defaultValue = "1") int pageNo) throws Exception {
        PageInfo<Item> p;
        try {
            p = new PageInfo<>(itemService.getPage(pageNo), 5);
        } catch (Exception e) {
            throw new Exception("시스템 장애 : ER0002");
        }
        model.addAttribute("target", "item");
        model.addAttribute("cpage", p);
        model.addAttribute("center", DIR + "all");
        model.addAttribute("left", DIR + "allpage");
        return "index";
    }


}
