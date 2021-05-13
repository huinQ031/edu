<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="panel-heading ">
    个人历史日报
</div>
<div class="panel-body">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th width="15%">课程进度</th>
            <th width="15%">课程状态</th>
            <th width="10%">学员情况</th>
            <th width="8%">日报日期</th>
            <th style="text-align: center">工作内容</th>
            <th width="15%">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${list}">
            <tr>
                <td style="font-size: 12px">
                    课程名称：${c.courseName}<br>
                    课程阶段：${c.courseTypeCode}${c.courseStage}<br>
                </td>
                <td style="font-size: 12px">
                    开课时间：${c.beginDate}<br>
                    课程状态：${c.status}<br>
                </td>
                <td style="font-size: 12px">
                    开课人数：${c.studentNum} <br>
                    目前人数：${c.currentStudentNum} <br>
                </td>
                <td style="font-size: 12px">${c.reportDate}</td>
                <td>
                    <textarea class="form-control" rows="2" readonly style="font-size: 12px">${c.reportContent}</textarea>
                </td>
                <td>
                    <button class="btn btn-info btn-sm report-view"  value="${c.id}">查看</button>
                    <button class="btn btn-warning btn-sm report-update" id="update" value="${c.id}_${c.reportDate}">修改</button>
                    <button class="btn btn-danger btn-sm report-del" value="${c.id}">删除</button>
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
                <h4>个人日报</h4>
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

    $('.report-update').on('click', function(){
        var field = this.value.split("_");
        $("#body-content").empty().load('${ctx}/education/teacher/reportday/update/' + field[0]+'?repordDate='+field[1]);
    });

    $('.report-del').on('click', function(){
        if(window.confirm('确认删除？')){
            $.ajax({
                url:'${ctx}/education/teacher/reportday/delete/'+this.value,
                type: "GET",
                dataType: "json",
                success: function(data){
                    if(data.status == 200){
                        alert('删除成功');
                        $("#body-content").empty().load('${ctx}/education/teacher/reportDayHistory');
                    }else{
                        alert('删除失败');
                        return false;
                    }
                }
            });
            return true;
        }else{
            return false;
        }

    });
</script>