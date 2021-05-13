package com.ztd.education.service.impl;

import com.ztd.education.vo.TeacherReportDayVO;
import com.ztd.education.model.TeacherReportDay;
import com.ztd.education.mapper.TeacherReportDayMapper;
import com.ztd.education.service.TeacherReportDayService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author lijike
 * @since 2017-07-29
 */
@Service
public class TeacherReportDayServiceImpl extends ServiceImpl<TeacherReportDayMapper, TeacherReportDay> implements TeacherReportDayService {

    @Autowired
    TeacherReportDayMapper teacherReportDayMapper;

    @Override
    public TeacherReportDayVO selectTeacherReportDay(TeacherReportDayVO param) {
        return teacherReportDayMapper.selectTeacherReportDay(param);
    }

    @Override
    public List<TeacherReportDayVO> selectTeacherReportDayHistory(TeacherReportDayVO param){
        return teacherReportDayMapper.selectTeacherReportDayHistory(param);
    }
}
