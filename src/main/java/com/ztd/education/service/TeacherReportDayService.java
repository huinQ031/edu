package com.ztd.education.service;

import com.ztd.education.vo.TeacherReportDayVO;
import com.ztd.education.model.TeacherReportDay;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author lijike
 * @since 2017-07-29
 */
public interface TeacherReportDayService extends IService<TeacherReportDay> {
    TeacherReportDayVO selectTeacherReportDay(TeacherReportDayVO param);
    List<TeacherReportDayVO> selectTeacherReportDayHistory(TeacherReportDayVO param);
}
