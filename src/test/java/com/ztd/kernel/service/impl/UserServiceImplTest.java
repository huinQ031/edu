package com.ztd.kernel.service.impl;

import com.ztd.kernel.model.User;
import com.ztd.kernel.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by lijike 2017/7/25.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/spring.xml")
public class UserServiceImplTest {

    @Autowired
    private UserService userService;

    @Test
    public void test(){
        User user = userService.selectById(1);
        System.out.println(user);
    }

}