package com.kbstar.controller;

import com.kbstar.dto.Item;
import com.kbstar.mapper.ItemMapper;
import com.kbstar.service.ItemService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/item")
public class ItemController {

    private final ItemService itemService;
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
        List<Item> items = null;
        try {
            items = itemService.get();
            model.addAttribute("allItem", items);
            model.addAttribute("center", DIR + "all");
            model.addAttribute("left", DIR + "left");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("center", DIR + "add");
        model.addAttribute("left", DIR + "left");
        return "index";
    }
}
