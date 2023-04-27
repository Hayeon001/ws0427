package com.kbstar.cust;

import com.kbstar.dto.Cust;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class UpdateTest {

    @Autowired
    CustService service;
    @Test
    void contextLoads() {

        try {
            service.modify(new Cust("id02","pwd002","james"));
            log.info("등록 정상..");
        } catch (Exception e) {
            log.info("오류..");
            //e.printStackTrace(); //어떤 오류인지 자세히

        }
    }

}
