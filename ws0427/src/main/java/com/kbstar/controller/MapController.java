package com.kbstar.controller;

import com.kbstar.dto.Marker;
import com.kbstar.mapper.MarkerMapper;
import com.kbstar.service.MarkerService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/map")
public class MapController {

    private final MarkerService markerService;
    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());
    String dir = "map/";

    @RequestMapping("/map01")
    public String map01(Model model) {
        List<Marker> marker = null;
        try {
            marker = markerService.get();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        model.addAttribute("marker", marker);
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
}
