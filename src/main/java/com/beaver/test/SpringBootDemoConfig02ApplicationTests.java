package com.beaver.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
public class SpringBootDemoConfig02ApplicationTests {
    private Logger logger = LoggerFactory.getLogger(getClass());


    @Test
    public void test02() throws InterruptedException {
        Thread.sleep(1000);
        logger.trace("trace");
        logger.debug("debug");
        logger.info("info");
        logger.error("error{}",1);

    }

}
