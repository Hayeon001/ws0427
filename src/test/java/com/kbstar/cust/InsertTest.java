package com.kbstar.cust;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

@Slf4j
@SpringBootTest
class InsertTest {

    @Autowired
    CustService service;
    @Test
    void contextLoads() {
        Cust obj = new Cust("id21", "pwd20", "james");
        //service.register(obj);  ->예외처리 try/catch
        try {
            service.register(obj);
            log.info("등록 정상..");
        } catch (Exception e) {
            if(e instanceof DuplicateKeyException){  //중복된 키값에 대한 예외처리 필수
                log.info("ID가 중복되었습니다-------------------------------------");
            }else{
                log.info("시스템 장애입니다-------------------------------------");
            }
        }
    }
}
