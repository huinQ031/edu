package com.ztd.education.controller;


import com.ztd.education.model.CourseReport;
import com.ztd.education.service.CourseReportService;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author lijike
 * @since 2017-07-29
 */
@Controller
@RequestMapping("/education/teacher/reportcourse")
public class TeacherReportCourseController {

    @Autowired
    CourseReportService courseReportService;

    private static final String PATH = "education/teacher/";

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String reportCourseAdd(Model model) {
        return PATH + "report_course_add";
    }

    @ResponseBody
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String reportCourseAdd(Model model, HttpServletRequest request) {
        String[] reportDateArray = request.getParameterValues("reportDate");
        String[] reportDateAMArray = request.getParameterValues("reportDateAM");
        String[] reportDateAPMrray = request.getParameterValues("reportDatePM");
        String[] reportDateWSArray = request.getParameterValues("reportDateWS");
        for (int i = 0; i < reportDateArray.length; i++) {
            String courseDate = reportDateArray[i];
            String am = reportDateAMArray[i];
            String pm = reportDateAPMrray[i];
            String ws = reportDateWSArray[i];
//            CourseReport cr = new CourseReport();
//            DateTimeFormatter df = new DateTimeFormatter("yyyy-MM-dd");
//            cr.setCourseDate(DateTime.parse(courseDate,));

        }

        return PATH + "report_course_add";
    }


}
