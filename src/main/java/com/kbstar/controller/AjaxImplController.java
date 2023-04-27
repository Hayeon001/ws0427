package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.dto.Marker;
import com.kbstar.service.MarkerService;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Slf4j
@RestController
public class AjaxImplController {

    @Autowired
    MarkerService service;

    @RequestMapping("/getservertime")
    public Object getservertime(){
        Date date = new Date();
        return date;
    }

    @RequestMapping("/checkid")
    public Object checkid(String id){
        int result =0;
        if(id.equals("qqqq")||id.equals("aaaa")||id.equals("ssss")){
            result = 1;
        }
        return result;
    }
    @RequestMapping("/getdata")
    public Object getdata(){
        //DB데이터를 json으로 바꿔서 리턴

        List<Cust> list = new ArrayList<>();
        list.add(new Cust("id01","pwd01","James1"));
        list.add(new Cust("id02","pwd02","James2"));
        list.add(new Cust("id03","pwd03","James3"));
        list.add(new Cust("id04","pwd04","James4"));
        list.add(new Cust("id05","pwd05","James5"));

        //JAVA Object를 JSON형태로
        //Parsing
        //json 라이브러리 추가 필요
        //        <!-- json request -->
        //		  <dependency>
        //			<groupId>com.googlecode.json-simple</groupId>
        //			<artifactId>json-simple</artifactId>
        //			<version>1.1</version>
        //  	  </dependency>
        JSONArray ja = new JSONArray();
        //json(javascript로 object표현하는 방식)
        // [대괄호]: 배열  [{},{},{},...]

        for(Cust obj:list){
            JSONObject jo = new JSONObject();
            Random r = new Random();
            int i = r.nextInt(100)+1;
            jo.put("id", obj.getId());
            jo.put("pwd", obj.getPwd());
            jo.put("name", obj.getName());
            ja.add(jo);
        }
        return ja;
    }

    @RequestMapping("/markers")
    public Object markers(String loc) throws Exception{
        List<Marker> list = null;
        try {
            list = service.get();
        } catch (Exception e) {
            log.info("---------");
            throw new RuntimeException(e);
        }


//        List<Marker> list = new ArrayList<>();
//        if (loc.equals("s")) {
//
//            list.add(new Marker(100, "비스트로 친친", "http://www.naver.com", 37.5820922, 126.9727623, "lights.jpg", "s"));
//            list.add(new Marker(101, "통의동", "http://www.naver.com", 37.5765897, 126.9738104, "nature.jpg", "s"));
//            list.add(new Marker(102, "디미", "http://www.naver.com", 37.5792425, 126.9736558, "fjords.jpg", "s"));
//
//        } else if (loc.equals("b")) {
//            list.add(new Marker(106, "국밥", "http://www.naver.com", 37.559667, 126.937041, "lights.jpg", "s" ));
//        } else if (loc.equals("j")) {
//            list.add(new Marker(103, "성수역점", "http://www.naver.com", 37.548431, 127.0507763, "lights.jpg", "j" ));
//            list.add(new Marker(104, "1호점", "http://www.naver.com", 37.5472351, 127.0514373, "lights.jpg", "j" ));
//            list.add(new Marker(105, "코오롱타워점", "http://www.naver.com", 37.5467346, 127.050026, "lights.jpg", "j" ));
//        }

        JSONArray ja = new JSONArray();
        for (Marker obj : list) {
            JSONObject jo = new JSONObject();
            jo.put("id", obj.getId());
            jo.put("title", obj.getTitle());
            jo.put("target", obj.getTarget());
            jo.put("lat", obj.getLat());
            jo.put("lng", obj.getLng());
            jo.put("img", obj.getImg());
            jo.put("loc", obj.getLoc());
            ja.add(jo);
        }

        return ja;
    }
}






