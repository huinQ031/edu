package com.ztd.education.controller;

import com.ztd.common.model.ResponseResult;
import com.ztd.education.model.Course;
import com.ztd.education.model.TeacherReportDay;
import com.ztd.education.service.CourseService;
import com.ztd.education.service.TeacherReportDayService;
import com.ztd.education.vo.TeacherReportDayVO;
import com.ztd.kernel.model.ShiroUser;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 *  前端控制器
 * @author lijike
 * @since 2017-07-29
 */
@Controller
@RequestMapping("/education/teacher/reportday")
public class TeacherReportDayController {

    private static final String PATH = "education/teacher/";

    @Autowired
    TeacherReportDayService teacherReportDayService;

    @Autowired
    CourseService courseService;

    @ResponseBody
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public ResponseResult add(TeacherReportDay reportDay){

        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        reportDay.setUserId(Integer.parseInt(user.getId()));
        if (reportDay.getId()==null){
            reportDay.setCreateTime(new Date());
        }
        teacherReportDayService.insertOrUpdate(reportDay);
        return ResponseResult.ok(reportDay.getId());
    }

    @RequestMapping(value = "/view/{id}",method = RequestMethod.GET)
    public String view(@PathVariable Integer id, Model model){
        TeacherReportDayVO param = new TeacherReportDayVO();
        param.setId(id);
        TeacherReportDayVO reportDay = teacherReportDayService.selectTeacherReportDay(param);
        model.addAttribute("reportDay",reportDay);
        model.addAttribute("course",courseService.selectById(reportDay.getCourseId()));
        return PATH + "/report_day_view";
    }

    @RequestMapping(value = "/update/{id}",method = RequestMethod.GET)
    public String update(@PathVariable Integer id, Model model, HttpServletRequest request){

        List<Course> courseList = courseService.selectList(null);
        model.addAttribute("courseList",courseList);

        TeacherReportDayVO param = new TeacherReportDayVO();
        param.setId(id);
        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        param.setUserId(Integer.parseInt(user.getId()));

        String reportDate = request.getParameter("reportDate");
        param.setReportDate(reportDate);
        TeacherReportDayVO vo = teacherReportDayService.selectTeacherReportDay(param);
        model.addAttribute("report",vo);
        model.addAttribute("course",courseService.selectById(vo.getCourseId()));
        return PATH + "/report_day_update";
    }


    @RequestMapping(value = "/delete/{id}",method = RequestMethod.GET)
    @ResponseBody
    public ResponseResult  delete(@PathVariable Integer id, Model model, HttpServletRequest request){
        teacherReportDayService.deleteById(id);
        return ResponseResult.ok();
    }
}
