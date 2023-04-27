package com.kbstar.item;


import com.kbstar.dto.Item;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class UpdateTest {

    @Autowired
    ItemService service;
    @Test
    void contextLoads() {
        try {
            service.modify(new Item(105,"모자",20000, "hat.jpg", null));
            service.get(105);
            log.info("수정 정상..");
        } catch (Exception e) {
            log.info("오류..");


        }
    }

}
