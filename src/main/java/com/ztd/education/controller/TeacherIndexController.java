package com.ztd.education.controller;

import com.ztd.education.model.Course;
import com.ztd.education.service.CourseService;
import com.ztd.education.service.TeacherReportDayService;
import com.ztd.education.vo.TeacherReportDayVO;
import com.ztd.kernel.model.ShiroUser;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Created by jack 2017/7/28.
 * 教务系统主页
 */
@Controller
@RequestMapping("/education/teacher")
public class TeacherIndexController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private TeacherReportDayService teacherReportDayService;

    private static final String PATH = "education/teacher/";

    @RequestMapping("/main")
    public String main(Model model) {
        TeacherReportDayVO param = new TeacherReportDayVO();
        Date date = new Date();
        DateTime dateTime = new DateTime(date);
        dateTime = dateTime.minusDays(1);//获取上一天
        param.setReportDate(dateTime.toString("yyyy-MM-dd"));
        List<TeacherReportDayVO> list = teacherReportDayService.selectTeacherReportDayHistory(param);
        model.addAttribute("list", list);
        return PATH + "main";
    }

    @RequestMapping("/reportDayHistory")
    public String reportDayHistory(Model model) {
        TeacherReportDayVO param = new TeacherReportDayVO();
        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        param.setUserId(Integer.parseInt(user.getId()));
        List<TeacherReportDayVO> list = teacherReportDayService.selectTeacherReportDayHistory(param);
        model.addAttribute("list", list);
        return PATH + "report_day_history";
    }

    /**
     * 跳转到个人日志填报页面
     *
     * @param model
     * @return
     */
    @RequestMapping("/reportDayAdd")
    public String reportDayAdd(Model model, HttpServletRequest request) {
        List<Course> courseList = courseService.selectList(null);
        model.addAttribute("courseList", courseList);

        TeacherReportDayVO param = new TeacherReportDayVO();
        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        param.setUserId(Integer.parseInt(user.getId()));
        String reportDate = request.getParameter("reportDate");
        if (StringUtils.isEmpty(reportDate)) {
            model.addAttribute("reportDate", DateTime.now().toString("yyyy-MM-dd"));
            param.setReportDate(DateTime.now().toString("yyyy-MM-dd"));
        } else {
            model.addAttribute("reportDate", reportDate);
            param.setReportDate(reportDate);
        }
        TeacherReportDayVO vo = teacherReportDayService.selectTeacherReportDay(param);
        model.addAttribute("report", vo);
        return PATH + "report_day_add";
    }

    @RequestMapping("/reportDaySummary")
    public String reportDaySummary(Model model) {
        TeacherReportDayVO param = new TeacherReportDayVO();
        Date date = new Date();
        DateTime dateTime = new DateTime(date);
        param.setReportDate(dateTime.toString("yyyy-MM-dd"));
        List<TeacherReportDayVO> list = teacherReportDayService.selectTeacherReportDayHistory(param);
        model.addAttribute("list", list);
        return PATH + "main";
    }

    @RequestMapping("/reportCourseIndex")
    public String reportCourseIndex(Model model) {
        return PATH + "report_course_index";
    }


    @RequestMapping(value = "/reportDayToday", method = RequestMethod.GET)
    public String reportDayToday(Model model) {

        TeacherReportDayVO param = new TeacherReportDayVO();
        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        param.setUserId(Integer.parseInt(user.getId()));
        param.setReportDate(DateTime.now().toString("yyyy-MM-dd"));
        TeacherReportDayVO reportDay = teacherReportDayService.selectTeacherReportDay(param);

        model.addAttribute("reportDay", reportDay);
        if (reportDay != null) {
            model.addAttribute("course", courseService.selectById(reportDay.getCourseId()));
        }
        return PATH + "/report_day_today";
    }
}
