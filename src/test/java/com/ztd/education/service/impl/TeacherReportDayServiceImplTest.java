package com.ztd.education.service.impl;

import com.ztd.education.vo.TeacherReportDayVO;
import com.ztd.education.service.TeacherReportDayService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by jack  2017/7/29.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/spring.xml")
public class TeacherReportDayServiceImplTest {

    @Autowired
    TeacherReportDayService teacherReportDayService;

    @Test
    public void test(){

    }

}