package com.ztd.education.vo;

/**
 * Created by jack  2017/7/29.
 */
public class TeacherReportDayVO {

    private Integer id;
    private Integer userId;
    private Integer courseId;
    private String courseStage;
    private String reportContent;
    private String studentSituation;
    private String reportDate;
    private String createTime;
    private String remark;
    private String teacherName;
    private String courseName;
    private String courseTypeCode;
    private Integer studentNum;
    private Integer currentStudentNum;
    private String beginDate;
    private String planEndDate;
    private String endDate;
    private String status;

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

    public String getReportDate() {
        return reportDate;
    }

    public void setReportDate(String reportDate) {
        this.reportDate = reportDate;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
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

    public String getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(String beginDate) {
        this.beginDate = beginDate;
    }

    public String getPlanEndDate() {
        return planEndDate;
    }

    public void setPlanEndDate(String planEndDate) {
        this.planEndDate = planEndDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getCurrentStudentNum() {
        return currentStudentNum;
    }

    public void setCurrentStudentNum(Integer currentStudentNum) {
        this.currentStudentNum = currentStudentNum;
    }
}
