package com.kbstar.controller;

import com.kbstar.dto.Item;
import com.kbstar.service.ItemService;
import com.kbstar.util.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/item")
public class ItemController {

    private final ItemService itemService;
    String dir = "item/";

    @Value("${uploadimgdir}")
    String uploadimgdir;

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Item> items = itemService.get();
        model.addAttribute("ilist", items);
        model.addAttribute("center", dir + "all");
        return "index";
    }

    @RequestMapping("/addimpl")
    public String addimpl(Model model, Item item) throws Exception {
        MultipartFile mf =  item.getImg();

        //파일에서 이미지를 끄집어 낸다.
        String imgname = mf.getOriginalFilename();
        item.setImgname(imgname);

        //db에 파일 저장
        itemService.register(item);

        //이미지 저장 디렉토리에 이미지를 저장한다.
        //우리가 업로드한 파일이 원하는 폴더로 들어간다(static으로 호출해서 함수 사용)
        FileUploadUtil.saveFile(mf, uploadimgdir);

        return "redirect:/item/all";
    }

    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, Item item) throws Exception {

        MultipartFile mf =  item.getImg();

        //파일에서 이미지를 끄집어 낸다.
        String imgname = mf.getOriginalFilename();

        //form 안에 안넣고 이미지 파일 form으로 전송하되, 이미지 파일이 공란이면 업데이트 치지 않는다 가능한 시나리오인지 ?
        if (imgname.equals("") || imgname == null) {
            itemService.modify(item);
        } else {
            item.setImgname(imgname);
            itemService.modify(item);
            FileUploadUtil.saveFile(mf, uploadimgdir);
            //이미지 저장 디렉토리에 이미지를 저장한다.
            //우리가 업로드한 파일이 원하는 폴더로 들어간다(static으로 호출해서 함수 사용)
        }

        return "redirect:/item/detail?id=" + item.getId();
    }

    @RequestMapping("/detail")
    public String detail(Model model, int id) throws Exception {
        Item item = null;

        item = itemService.get(id);
        model.addAttribute("gitem", item);
        model.addAttribute("center", "item/detail");
        return "index";
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(int id) throws Exception {
        itemService.remove(id);
        return "redirect:/item/all";
    }
}
