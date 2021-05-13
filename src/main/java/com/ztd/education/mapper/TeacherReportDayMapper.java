package com.ztd.education.mapper;
import com.ztd.education.vo.TeacherReportDayVO;
import com.ztd.education.model.TeacherReportDay;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 * @author lijike
 * @since 2017-07-29
 */
public interface TeacherReportDayMapper extends BaseMapper<TeacherReportDay> {

    TeacherReportDayVO selectTeacherReportDay(TeacherReportDayVO param);
    List<TeacherReportDayVO> selectTeacherReportDayHistory(TeacherReportDayVO param);

}