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
@TableName("edu_course")
public class Course extends Model<Course> {

    private static final long serialVersionUID = 1L;

	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
	@TableField("course_name")
	private String courseName;
	@TableField("course_type_code")
	private String courseTypeCode;
	@TableField("student_num")
	private Integer studentNum;
	@TableField("begin_date")
	private Date beginDate;
	@TableField("plan_end_date")
	private Date planEndDate;
	@TableField("end_date")
	private Date endDate;
	@TableField("status")
	private String status;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getCourseTypeCode() {
		return courseTypeCode;
	}

	public void setCourseTypeCode(String courseTypeCode) {
		this.courseTypeCode = courseTypeCode;
	}

	public Integer getStudentNum() {
		return studentNum;
	}

	public void setStudentNum(Integer studentNum) {
		this.studentNum = studentNum;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getPlanEndDate() {
		return planEndDate;
	}

	public void setPlanEndDate(Date planEndDate) {
		this.planEndDate = planEndDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "Course{" +
				"id=" + id +
				", courseName='" + courseName + '\'' +
				", courseTypeCode='" + courseTypeCode + '\'' +
				", studentNum=" + studentNum +
				", beginDate=" + beginDate +
				", planEndDate=" + planEndDate +
				", endDate=" + endDate +
				", status='" + status + '\'' +
				'}';
	}
}
