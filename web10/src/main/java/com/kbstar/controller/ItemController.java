package com.kbstar.controller;

import com.kbstar.dto.Item;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/item")
public class ItemController {
    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());
    private final String DIR = "item/";

    @RequestMapping("")
    public String main(Model model) {
        model.addAttribute("center", DIR + "center");
        model.addAttribute("left", DIR + "left");
        return "index";
    }

    @RequestMapping("/all")
    public String all(Model model) {
        List<Item> list = new ArrayList<>();
        list.add(new Item(100, "pants1", 1000, "pants1.jpeg", new Date()));
        list.add(new Item(101, "pants2", 2000, "pants2.jpeg", new Date()));
        list.add(new Item(102, "pants3", 3000, "pants3.jpeg", new Date()));
        list.add(new Item(103, "pants4", 4000, "pants4.jpeg", new Date()));
        list.add(new Item(104, "pants5", 5000, "pants5.jpeg", new Date()));
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
}
