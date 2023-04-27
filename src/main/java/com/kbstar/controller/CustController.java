package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Slf4j  //logger 대신
@Controller
@RequestMapping("/cust")
public class CustController {

    @Autowired
    CustService service;

    //cust 눌렀을 때 나오는 부분
    //Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());


    String dir = "cust/";

    //127.0.0.1/cust
    @RequestMapping("")
    public String main(Model model){
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"add");
        //logger.info("---------------------------------------");  //cust를 클릭할 때마다 로그찍기
        Random r = new Random();
        int inx =r.nextInt(1000)+1;
        log.info(inx+"");
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

    @RequestMapping("/get")
    public String get(Model model, String id){
        //id로 db에서 사용자 정보 조회
        Cust cust = new Cust(id,"xxx","james");
        model.addAttribute("gcust",cust);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"get");
        return "index";
    }



    @RequestMapping("/all")
    public String all(Model model) throws Exception{
//        //가상데이터
//        List<Cust> list = new ArrayList<>();
//        list.add(new Cust("id01","pwd01","James1"));
//        list.add(new Cust("id02","pwd02","James2"));
//        list.add(new Cust("id03","pwd03","James3"));
//        list.add(new Cust("id04","pwd04","James4"));
//        list.add(new Cust("id05","pwd05","James5"));
//        model.addAttribute("clist",list);
//        //담은 데이터를 dir+"all"의 all에 뿌리기/ //table형태로
        List<Cust> list = null;
        try {
            list = service.get();
        } catch (Exception e) {
            log.info("----------");
            e.printStackTrace();
        }

        model.addAttribute("clist",list);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"all");
        return "index";
    }

}
