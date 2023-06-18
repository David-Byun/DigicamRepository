package com.kbstar.controller;

import com.kbstar.dto.Item;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/table")
public class ItemController {

    @RequestMapping("")
    public String all(Model model) {
        List<Item> itemList = new ArrayList<>();
        itemList.add(new Item(1, "pants1", 1000, "pants1.jpeg", new Date()));
        itemList.add(new Item(2, "pants2", 1000, "pants2.jpeg", new Date()));
        itemList.add(new Item(3, "pants3", 1000, "pants3.jpeg", new Date()));
        itemList.add(new Item(4, "pants4", 1000, "pants4.jpeg", new Date()));
        itemList.add(new Item(5, "pants5", 1000, "pants5.jpeg", new Date()));
        itemList.add(new Item(6, "pants5", 1000, "pants5.jpeg", new Date()));
        itemList.add(new Item(7, "pants5", 1000, "pants5.jpeg", new Date()));
        itemList.add(new Item(8, "pants5", 1000, "pants5.jpeg", new Date()));
        itemList.add(new Item(9, "pants5", 1000, "pants5.jpeg", new Date()));itemList.add(new Item(10, "pants5", 1000, "pants5.jpeg", new Date()));
        itemList.add(new Item(11, "pants5", 1000, "pants5.jpeg", new Date()));
        itemList.add(new Item(12, "pants5", 1000, "pants5.jpeg", new Date()));
        itemList.add(new Item(13, "pants5", 1000, "pants5.jpeg", new Date()));
        itemList.add(new Item(14, "pants5", 1000, "pants5.jpeg", new Date()));
        itemList.add(new Item(15, "pants5", 1000, "pants5.jpeg", new Date()));
        itemList.add(new Item(16, "pants5", 1000, "pants5.jpeg", new Date()));
        itemList.add(new Item(17, "pants5", 1000, "pants5.jpeg", new Date()));
        itemList.add(new Item(18, "pants5", 1000, "pants5.jpeg", new Date()));
        itemList.add(new Item(19, "pants5", 1000, "pants5.jpeg", new Date()));
        itemList.add(new Item(20, "pants5", 1000, "pants5.jpeg", new Date()));

        model.addAttribute("items", itemList);
        model.addAttribute("center", "table");
        return "index";
    }
}
