package com.ztd.education.model;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author lijike
 * @since 2017-07-29
 */
@TableName("edu_teacher_report_day")
public class TeacherReportDay extends Model<TeacherReportDay> {

    private static final long serialVersionUID = 1L;

	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
	@TableField("user_id")
	private Integer userId;
	@TableField("course_id")
	private Integer courseId;
	@TableField("student_num")
	private Integer studentNum;
	@TableField("course_stage")
	private String courseStage;
	@TableField("report_content")
	private String reportContent;
	@TableField("student_situation")
	private String studentSituation;
	@TableField("report_date")
	private Date reportDate;
	@TableField("create_time")
	private Date createTime;
	@TableField("remark")
	private String remark;

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public Integer getStudentNum() {
		return studentNum;
	}

	public void setStudentNum(Integer studentNum) {
		this.studentNum = studentNum;
	}

	public String getCourseStage() {
		return courseStage;
	}

	public void setCourseStage(String courseStage) {
		this.courseStage = courseStage;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public String getStudentSituation() {
		return studentSituation;
	}

	public void setStudentSituation(String studentSituation) {
		this.studentSituation = studentSituation;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "TeacherReportDay{" +
			"id=" + id +
			", userId=" + userId +
			", courseId=" + courseId +
			", studentNum=" + studentNum +
			", courseStage=" + courseStage +
			", reportContent=" + reportContent +
			", studentSituation=" + studentSituation +
			", reportDate=" + reportDate +
			", createTime=" + createTime +
			"}";
	}
}
