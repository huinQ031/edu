<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="panel-heading ">
    日报填报
</div>
<div class="panel-body">
    <form id="form-report-day" method="post" action="${ctx}/education/teacher/reportday/add">
        <input type="hidden" name="id" value="${report.id}">
        <table class="table table-condensed">
            <tr>
                <td>日报日期</td>
                <td>

                    <div class="form-group">
                        <input onClick="WdatePicker({onpicking:function(dp){changeReportDate(dp)}})" type='text' class="form-control" name="reportDate"
                               value='${reportDate}'
                               data-date-format="yyyy-mm-dd" style="width: 120px" readonly id="reportDate"/>
                    </div>
                </td>
            </tr>
            <tr>
                <td width="10%">课程名称</td>
                <td>
                    <c:if test="${empty report}">
                        <c:forEach items="${courseList}" var="c">
                            <div id="course-${c.id}" style="display: none" class="course-detail">
                                科目：${c.courseTypeCode} &nbsp;&nbsp;| &nbsp;&nbsp;
                                状态：${c.status} &nbsp;&nbsp;| &nbsp;&nbsp;
                                开课人数：${c.studentNum} &nbsp;&nbsp;| &nbsp;&nbsp;
                                开课时间：<fmt:formatDate pattern="YYYY-MM-dd" value="${c.beginDate}"></fmt:formatDate>
                                &nbsp;&nbsp;|&nbsp;&nbsp;
                                计划结课程时间：<fmt:formatDate pattern="YYYY-MM-dd" value="${c.planEndDate}"></fmt:formatDate>
                                &nbsp;&nbsp;| &nbsp;&nbsp;
                                结课程时间：<fmt:formatDate pattern="YYYY-MM-dd" value="${c.endDate}"></fmt:formatDate>
                            </div>
                        </c:forEach>
                        <div class="form-group">
                            <select class="form-control" name="courseId" id="select-course">
                                <option value=""></option>
                                <c:forEach items="${courseList}" var="c">
                                    <option value="${c.id}">${c.courseName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </c:if>
                    <c:if test="${not empty report}">
                        <div id="course-${report.courseId}" class="course-detail">
                            科目：${report.courseTypeCode} &nbsp;&nbsp;| &nbsp;&nbsp;
                            状态：${report.status} &nbsp;&nbsp;| &nbsp;&nbsp;
                            开课人数：${report.studentNum} &nbsp;&nbsp;| &nbsp;&nbsp;
                            开课时间：${report.beginDate}
                            &nbsp;&nbsp;|&nbsp;&nbsp;
                            计划结课程时间：${report.planEndDate}
                            &nbsp;&nbsp;| &nbsp;&nbsp;
                            结课程时间：${report.endDate}
                        </div>
                        <div class="form-group">
                            <input type="hidden" class="form-control" value="${report.courseId}" name="courseId"/>
                            <input type="text" class="form-control" value="${report.courseName}" name="courseName" readonly/>
                        </div>
                    </c:if>
                </td>
            </tr>

            <tr>
                <td>课程阶段</td>
                <td>
                    <select class="form-control" name="courseStage" style="width: 120px">
                        <option value="第一阶段" <c:if test="${report.courseStage=='第一阶段'}">selected</c:if> >第一阶段</option>
                        <option value="第二阶段" <c:if test="${report.courseStage=='第二阶段'}">selected</c:if> >第二阶段</option>
                        <option value="第三阶段" <c:if test="${report.courseStage=='第三阶段'}">selected</c:if> >第三阶段</option>
                        <option value="第四阶段" <c:if test="${report.courseStage=='第四阶段'}">selected</c:if> >第四阶段</option>
                        <option value="第五阶段" <c:if test="${report.courseStage=='第五阶段'}">selected</c:if> >第五阶段</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td>目前班级人数</td>
                <td>
                    <div class="form-group">
                        <input type="text" class="form-control" name="studentNum" value="${report.currentStudentNum}" style="width: 120px"/>
                    </div>
                </td>
            </tr>

            <tr>
                <td>工作内容</td>
                <td>
                    <div class="form-group">
                        <textarea class="form-control" rows="2" name="reportContent">${report.reportContent}</textarea>
                    </div>
                </td>
            </tr>
            <tr>
                <td>学员情况</td>
                <td>
                    <input type="text" class="form-control" name="studentSituation" value="${report.studentSituation}"/>
                </td>
            </tr>

            <tr>
                <td>备注</td>
                <td>
                    <div class="form-group">
                        <input type="text" class="form-control" name="remark" value="${report.remark}"/>
                    </div>
                </td>
            </tr>
            <tr>
                <td></td>
                <td style="text-align: right">
                    <button type="submit" class="btn btn-primary">提交</button>
                </td>
            </tr>
        </table>
    </form>
</div>
<script type="text/javascript">
    function changeReportDate(obj) {
        //alert(obj.cal.getNewDateStr());
        var reportDate = obj.cal.getNewDateStr();
        $("#body-content").empty().load('${ctx}/education/teacher/reportDayAdd?reportDate='+reportDate);
    }
    $(document).ready(function () {
        $('#select-course').change(function () {
            var courseId = $("#select-course").val();
            if (courseId == '') {
                $('.course-detail').hide();
            } else {
                $('.course-detail').hide();
                $('#course-' + courseId).show();
            }
        });
        //表单校验提交
        $('#form-report-day').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                studentNum: {
                    validators: {
                        notEmpty: {
                            message: '班级人数不能为空'
                        }
                    }
                },
                reportContent: {
                    validators: {
                        notEmpty: {
                            message: '工作内容不能为空'
                        }
                    }
                },
                courseId: {
                    validators: {
                        notEmpty: {
                            message: '课程名称不能为空'
                        }
                    }
                }
            }
        }).on('success.form.bv', function (e) {
            e.preventDefault();
            var $form = $(e.target);
            var bv = $form.data('bootstrapValidator');
            $.post($form.attr('action'), $form.serialize(), function (result) {
                if (result.status == 200) {
                    alert("填报成功");
                    $("#body-content").empty().load('${ctx}/education/teacher/reportDayHistory');
                } else {
                    alert("填报失败");
                }
            }, 'json');
        });
    });
</script>