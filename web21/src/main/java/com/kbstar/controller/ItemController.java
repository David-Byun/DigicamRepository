package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Cart;
import com.kbstar.dto.Cust;
import com.kbstar.dto.Item;
import com.kbstar.service.CartService;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/item")
public class ItemController {
    @Autowired
    ItemService itemService;
    @Autowired
    CartService cartService;
    String dir= "item/";

    @RequestMapping("")
    public String main(Model model){
        model.addAttribute("center",dir+"center");
        model.addAttribute("left",dir+"left");
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("center",dir+"add");
        model.addAttribute("left",dir+"left");
        return "index";
    }
    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Item> list = null;
        try {
            list = itemService.get();
        }catch(Exception e){
            throw new Exception("시스템 장애:ER0002");
        }
        model.addAttribute("allitem",list);
        model.addAttribute("center",dir+"all");
        model.addAttribute("left",dir+"left");
        return "index";
    }
    @RequestMapping("/allpage")
    public String allpage(@RequestParam(required = false, defaultValue = "1")int pageNo, Model model) throws Exception {
        PageInfo<Item> p;
        try {
            p = new PageInfo<>(itemService.getPage(pageNo),5); //5: 하단 네비게이션 갯수
        }catch(Exception e){
            throw new Exception("시스템 장애:ER0002");
        }
        model.addAttribute("target","item");

        model.addAttribute("cpage",p);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"allpage");
        return "index";
    }
    @RequestMapping("/get")
    public String get(Model model, Integer id) throws Exception {
        Item item = null;
        item = itemService.get(String.valueOf(id));
        model.addAttribute("gitem",item);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"get");
        return "index";
    }
    @RequestMapping("/allcart")
    public String allcart(Model model, String id) throws Exception {
        List<Cart> list = null;
        int sum = 0;
        try {
            list = cartService.getMyCart(id);
            for (Cart a : list) {
                sum += a.getItem_price();
            }
            log.info(sum + "");
        }catch(Exception e){
            log.info("==============error============ {}", e.getMessage());

        }
        model.addAttribute("allcart",list);
        model.addAttribute("center","cart");
        return "index";

    }
    @RequestMapping("/addcart")
    public String addcart(Model model, Cart cart) throws Exception {
        cartService.register(cart);
        return "redirect:/item/allcart?id="+cart.getCust_id();
    }
    @RequestMapping("/delcart")
    public Object delcart(Model model, String id, HttpSession session) throws Exception {
        cartService.remove(id);
        if(session != null){
            Cust cust = (Cust) session.getAttribute("logincust");
            return "redirect:/item/allcart?id="+cust.getId();
        }
        return "redirect:/";
    }
}