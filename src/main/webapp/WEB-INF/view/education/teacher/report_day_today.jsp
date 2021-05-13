<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/header.jsp" %>
<div class="panel-heading ">
    今日日报
</div>
<div class="panel-body">
    <c:if test="${empty reportDay}">
        今日日报未填报
    </c:if>
    <c:if test="${not empty reportDay}">
        <table class="table">
            <tr>
                <td>日报日期</td>
                <td>
                        ${reportDay.reportDate}
                </td>
            </tr>
            <tr>
                <td width="10%">课程信息</td>
                <td>
                    课程名称：${course.courseName} <br>
                    课程科目：${course.courseTypeCode} <br>
                    课程阶段：${reportDay.courseStage} <br>
                    课程状态：${course.status}<br>
                    开课班级人数：${course.studentNum} <br>
                    目前班级人数：${reportDay.studentNum} <br>
                    开课时间：<fmt:formatDate pattern="YYYY-MM-dd" value="${course.beginDate}"></fmt:formatDate><br>
                    计划结课时间：<fmt:formatDate pattern="YYYY-MM-dd" value="${course.planEndDate}"></fmt:formatDate><br>
                    结课时间：<fmt:formatDate pattern="YYYY-MM-dd" value="${course.endDate}"></fmt:formatDate>
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
    </c:if>
</div>

