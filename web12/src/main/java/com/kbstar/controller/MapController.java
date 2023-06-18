package com.kbstar.controller;

import com.kbstar.dto.Marker;
import com.kbstar.dto.MarkerDesc;
import com.kbstar.service.MarkerDescService;
import com.kbstar.service.MarkerService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/map")
public class MapController {

    private final MarkerService markerService;
    private final MarkerDescService markerDescService;
    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());
    String dir = "map/";

    @RequestMapping("/map01")
    public String map01(Model model) {
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"map01");
        return "index";
    }

    @RequestMapping("/map02")
    public String map02(Model model) {
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"map02");
        return "index";
    }

    @RequestMapping("/map03")
    public String map03(Model model) {
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"map03");
        return "index";
    }

    @RequestMapping("/map04")
    public String map04(Model model) {
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"map04");
        return "index";
    }

    @RequestMapping("/map05")
    public String map05(Model model) {
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"map05");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model, int id) throws Exception {
        Marker marker = null;
        List<MarkerDesc> mlist = null;
        try {
            marker = markerService.get(id);
            mlist = markerDescService.getMarkerDesc(id);
        } catch (Exception e) {
            throw new Exception("가게 정보를 가져올 수 없어요");
        }
        model.addAttribute("mlist", mlist);
        model.addAttribute("left", dir+"left");
        model.addAttribute("gmarket", marker);
        model.addAttribute("center", dir+"detail");
        return "index";
    }
}
