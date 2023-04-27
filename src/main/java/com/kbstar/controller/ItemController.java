package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.dto.Item;
import com.kbstar.service.CustService;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/item")
public class ItemController {

    @Autowired
    ItemService service;

    //cust 눌렀을 때 나오는 부분
    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());


    String dir = "item/";

    //127.0.0.1/item
    @RequestMapping("")
    public String main(Model model){
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"add");
        return "index";
    }

//    @RequestMapping("")
//    public String main(Model model){
//        model.addAttribute("left","cust/left");
//        model.addAttribute("center","cust/center");
//        return "index";
//    }


    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"add");
        return "index";
    }

    @RequestMapping("/all")
    public String all(Model model){
        //데이터 생성
//        List<Item> list = new ArrayList<>();
//        list.add(new Item(100,"pants1",1000,"a.jpg", new Date()));
//        list.add(new Item(101,"pants2",2000,"b.jpg", new Date()));
//        list.add(new Item(102,"pants3",3000,"c.jpg", new Date()));
//        list.add(new Item(103,"pants4",4000,"d.jpg", new Date()));
//        list.add(new Item(104,"pants5",5000,"e.jpg", new Date()));
//        model.addAttribute("allItem",list);

        List<Item> list = null;
        try {
            list = service.get();
        } catch (Exception e) {
            log.info("----------");
            e.printStackTrace();
        }
        model.addAttribute("allItem",list);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"all");
        return "index";
    }

}
