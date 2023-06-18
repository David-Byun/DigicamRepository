package com.kbstar.controller;

import com.kbstar.dto.Marker;
import com.kbstar.dto.MarkerSearch;
import com.kbstar.service.MarkerService;
import com.kbstar.util.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/marker")
public class MarkerController {

    private final MarkerService markerService;

    @Value("${uploadimgdir}")
    String uploadimgdir;

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("center", "marker/add");
        return "index";
    }


    @RequestMapping("/search")
    public String search(Model model, MarkerSearch ms) {
        List<Marker> list = markerService.search(ms);
        model.addAttribute("ms", ms);
        model.addAttribute("mlist", list);
        model.addAttribute("center", "marker/all");
        return "index";
    }


    @RequestMapping("/addimpl")
    public String addimpl(Model model, Marker marker) throws Exception {

        MultipartFile mf = marker.getImgname();

        String imgname = mf.getOriginalFilename();
        marker.setImg(imgname);

        markerService.register(marker);

        FileUploadUtil.saveFile(mf, imgname);

        model.addAttribute("center", "marker/add");
        return "redirect:/marker/all";
    }


    @RequestMapping("/all")
    public String all(Model model, Marker marker) throws Exception {
        List<Marker> markerList = markerService.get();
        model.addAttribute("mlist", markerList);
        model.addAttribute("center", "marker/all");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model, int id) throws Exception {
        Marker marker = markerService.get(id);
        model.addAttribute("marker", marker);
        model.addAttribute("center", "marker/detail");
        return "index";
    }


    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, Integer id) throws Exception {
        markerService.remove(id);
        return "redirect:/marker/all";
    }

    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, Marker marker) throws Exception {

        MultipartFile imgname = marker.getImgname();
        String filename = imgname.getOriginalFilename();
        if (filename == null || filename.equals("")) {
            markerService.modify(marker);
        } else {
            marker.setImg(filename);
            markerService.modify(marker);
            FileUploadUtil.saveFile(imgname, uploadimgdir);
        }
        return "redirect:/marker/detail?id=" + marker.getId();
    }

}
