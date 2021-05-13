<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="panel-heading ">
    教学部教学进度
</div>
<div class="panel-body">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th width="8%">日报日期</th>
            <th width="8%">任课老师</th>
            <th width="8%">课程名称</th>
            <th width="8%">课程阶段</th>
            <th>教学内容、工作内容</th>
            <th width="13%">课程信息</th>
            <th width="12%">学员情况</th>
            <th width="8%"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${list}">
            <tr>
                <td style="font-size: 14px">${c.reportDate}</td>
                <td style="font-size: 14px">
                        ${c.teacherName}
                </td>
                <td style="font-size: 14px">
                        ${c.courseName}
                </td>
                <td style="font-size: 14px">
                        ${c.courseStage}
                </td>
                <td style="font-size: 14px">
                        ${c.reportContent}
                </td>
                <td style="font-size: 12px">
                    开课时间：${c.beginDate}<br>
                    课程状态：${c.status}
                </td>

                <td style="font-size: 12px">
                    开课人数：${c.studentNum} <br>
                    目前人数：${c.currentStudentNum} <br>
                </td>
                <td>
                    <button class="btn btn-info btn-sm report-view"  value="${c.id}">详情</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<!-- 模态弹出窗内容 -->
<div class="modal" id="mymodal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4>日报详情</h4>
            </div>
            <div class="modal-body">
                <div id="content">模态弹出窗主体内容</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<script>
    $('.report-view').on('click', function(){
        $("#mymodal").modal();
        $("#content").empty().load('${ctx}/education/teacher/reportday/view/' + this.value);
    });
</script>