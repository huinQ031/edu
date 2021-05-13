package com.ztd.education.model;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author lijike
 * @since 2017-07-31
 */
@TableName("edu_course_report")
public class CourseReport extends Model<CourseReport> {

    private static final long serialVersionUID = 1L;

	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
	@TableField("user_id")
	private Integer userId;
	@TableField("course_date")
	private Date courseDate;
	@TableField("date_am")
	private String dateAm;
	@TableField("date_pm")
	private String datePm;
	@TableField("date_ws")
	private String dateWs;


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

	public Date getCourseDate() {
		return courseDate;
	}

	public void setCourseDate(Date courseDate) {
		this.courseDate = courseDate;
	}

	public String getDateAm() {
		return dateAm;
	}

	public void setDateAm(String dateAm) {
		this.dateAm = dateAm;
	}

	public String getDatePm() {
		return datePm;
	}

	public void setDatePm(String datePm) {
		this.datePm = datePm;
	}

	public String getDateWs() {
		return dateWs;
	}

	public void setDateWs(String dateWs) {
		this.dateWs = dateWs;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "CourseReport{" +
			"id=" + id +
			", userId=" + userId +
			", courseDate=" + courseDate +
			", dateAm=" + dateAm +
			", datePm=" + datePm +
			", dateWs=" + dateWs +
			"}";
	}
}
