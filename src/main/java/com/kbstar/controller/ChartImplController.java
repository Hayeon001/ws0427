package com.kbstar.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;


@RestController
public class ChartImplController {
//    @RequestMapping("/chart02")
//    public Object chart02(){
//        // [1,2,3]
//        // [{1],{2} ...] 형태가 다르면 얘기가 달라짐
//
//        JSONArray ja = new JSONArray();
//        for(int i=1;i<=12; i++){
//            Random r = new Random();
//            int cnt = r.nextInt(10000)+1;
//            ja.add(cnt);
//        }
//        return ja;
//    }

    // 카테고리 수정하고 싶을 때
    // {'category':[], 'datas':[]}
    @RequestMapping("/chart02")
    public Object chart02(){
        // [1,2,3]
        // [{1],{2} ...] 형태가 다르면 얘기가 달라짐
        JSONObject jo = new JSONObject();

        JSONArray jaCnt = new JSONArray();
        for(int i=1;i<=12; i++){
            Random r = new Random();
            int cnt = r.nextInt(10000)+1;
            jaCnt.add(cnt);
        }
        JSONArray jaYear = new JSONArray();
        for(int i=2012;i<=2023; i++){
            jaYear.add(i);
        }
        jo.put("category",jaYear);
        jo.put("datas",jaCnt);
        return jo;
    }

    //////////////////////////////////////////

    @RequestMapping ("/chart0301")
    public Object chart0301(){
        //배열안에 배열로 달래
        //[[],[],[]...]
        JSONArray ja = new JSONArray();
        for(int i=1; i<=5; i++){
            Random r = new Random();
            int num = r.nextInt(20)+1;
            JSONArray jadata = new JSONArray();
            jadata.add("data : "+num);
            jadata.add(num);
            ja.add(jadata); //배열안에 배열 만들어서 넣고 데이터 쌓기
        };
        return ja;
    }
    @RequestMapping ("/chart0302")
    public Object chart0302(){

        JSONObject jo = new JSONObject();

        JSONArray jaCnt = new JSONArray();
        for(int i=1;i<=5; i++){
            Random r = new Random();
            int cnt = r.nextInt(10000)+1;
            jaCnt.add(cnt);
        }
        JSONArray jaYear = new JSONArray();
        for(int i=2021;i<=2023; i++){
            jaYear.add(i);
        }
        jo.put("category",jaYear);
        jo.put("datas",jaCnt);
        return jo;
    }
    @RequestMapping ("/chart0303")
    public Object chart0303(){
        //배열안에 배열로 달래
        //[[],[],[]...]
        JSONArray ja = new JSONArray();
        for(int i=1; i<=30; i++){
            Random r = new Random();
            int num = r.nextInt(1000)+1;
            JSONArray jadata = new JSONArray();
            jadata.add("data : "+num);
            jadata.add(num);
            ja.add(jadata); //배열안에 배열 만들어서 넣고 데이터 쌓기
        };
        return ja;
    }
    @RequestMapping ("/chart0304")
    public Object chart0304(){

        JSONObject jo = new JSONObject();

        JSONArray jaCnt = new JSONArray();
        for(int i=1;i<=17; i++){
            Random r = new Random();
            int cnt = r.nextInt(10000)+1;
            jaCnt.add(cnt);
        }
        JSONArray jaYear = new JSONArray();
        for(int i=2021;i<=2023; i++){
            jaYear.add(i);
        }
        jo.put("category",jaYear);
        jo.put("datas",jaCnt);
        return jo;
    }

    @RequestMapping("/chart05")
    public Object chart05(String year) {
        JSONArray ja = new JSONArray();
        for (int i=1; i<=12; i++) {
            Random r = new Random();
            int num = r.nextInt(100)+1;
            ja.add(num);
        }
        return ja;
    }
}






