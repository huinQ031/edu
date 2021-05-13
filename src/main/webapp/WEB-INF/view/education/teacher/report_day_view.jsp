<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="${ctx}/static/plugins/bootstrap/css/bootstrap.min.css"/>

<form id="form-report-day" method="post" action="${ctx}/education/teacher/reportday/add">
    <table class="table">
        <tr>
            <td>日报日期</td>
            <td>
                ${reportDay.reportDate}
            </td>
        </tr>
        <tr>
            <td>任课老师</td>
            <td>
                ${reportDay.teacherName}
            </td>
        </tr>
        <tr>
            <td width="10%">课程信息</td>
            <td>
                课程名称：${reportDay.courseName} <br>
                课程科目：${reportDay.courseTypeCode} <br>
                课程阶段：${reportDay.courseStage} <br>
                课程状态：${reportDay.status}<br>
                开课班级人数：${reportDay.studentNum} <br>
                目前班级人数：${reportDay.currentStudentNum} <br>
                开课时间：${reportDay.beginDate}<br>
                计划结课时间：${reportDay.planEndDate}<br>
                结课时间：${reportDay.endDate}
            </td>
        </tr>
        <tr>
            <td>工作内容</td>
            <td>

                <textarea class="form-control" rows="2" readonly
                          style="font-size: 12px">${reportDay.reportContent}</textarea>
            </td>
        </tr>
        <tr>
            <td>学员情况</td>
            <td>
                ${reportDay.studentSituation}
            </td>
        </tr>
        <tr>
            <td>备注</td>
            <td>
                ${reportDay.remark}
            </td>
        </tr>
    </table>
</form>
