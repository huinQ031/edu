package com.ztd.kernel.service.impl;
import com.ztd.kernel.service.SysService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import java.util.List;

/**
 * Created by lijike 2017/7/26.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/spring.xml")
public class SysServiceImplTest {

    @Autowired
    private SysService sysService;

    @Test
    public void test(){
        List<String> list = sysService.getUserPermissionsByAccount("lijike");
        for (String s: list) {
            System.out.println(s);
        }
    }
}