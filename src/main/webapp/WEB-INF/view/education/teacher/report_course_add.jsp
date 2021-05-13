<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link href='${ctx}/static/plugins/fullcalendar/fullcalendar.css' rel='stylesheet'/>
    <link href='${ctx}/static/plugins/bootstrap/css/bootstrap.min.css' rel='stylesheet'/>
    <link href='${ctx}/static/plugins/fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print'/>
    <style>
        #calendar {
            width: 540px;
        }

        .dib {
            display: inline-block;
        }
    </style>
</head>
<body>
<div class="row">
    <div class="col-md-5">
        <div id="calendar" class="dib" style="float: left"></div>
    </div>
    <div class="col-md-7">
        <div class="panel panel-default">
            <div class="panel-heading">上报课时</div>
            <div class="panel-body">
                <form class="form-horizontal" method="post" action="${ctx}/education/teacher/reportcourse/add"
                      id="reportcourse-form">
                    <div class="form-group report-course"></div>
                    <button type="submit" class="btn btn-primary btn-save">提交</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="template" style="display: none">
    <div>
        <label class="col-sm-2 control-label"></label>
        <input type="hidden">
        <div class="col-sm-2">
            <div class="checkbox">
                <label>
                    <input type="checkbox" checked>上午
                </label>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="checkbox">
                <label>
                    <input type="checkbox" checked>下午
                </label>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="checkbox">
                <label>
                    <input type="checkbox">晚上
                    &nbsp &nbsp
                    <button type="button" class="btn btn-danger btn-xs" onclick="delReport(this)">删除</button>
                </label>
            </div>
        </div>
    </div>
</div>

<script src='${ctx}/static/plugins/jquery/jquery.min.js'></script>
<script src='${ctx}/static/plugins/fullcalendar/jquery-ui.custom.min.js'></script>
<script src='${ctx}/static/plugins/fullcalendar/fullcalendar.js'></script>
<script type="text/javascript">
    /** calendar配置 **/
    $(document).ready(
        function () {
            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();
            $("#calendar").fullCalendar(
                {
                    header: {
                        right: 'today',
                        center: 'title',
                        left: 'prev,next'
                    },
                    buttonText: {
                        prev: "<span class='fc-text-arrow' style='font-size: 12px'>&lsaquo;上个月</span>",
                        next: "<span class='fc-text-arrow' style='font-size: 12px'>下个月&rsaquo;</span>"
                    },
                    editable: true,
                    dayClick: function (dayDate, allDay, jsEvent, view) { //点击单元格事件
                        if (dayDate.getMonth() == $('#calendar').fullCalendar('getDate').getMonth()) {
                            var d = $.fullCalendar.formatDate(dayDate, "yyyy-MM-dd");
                            var check = $('.fc-day-check-' + d).html();
                            if (check != '') {
                                $('.fc-day-check-' + d).html('').attr('fc-day-check-check', 'false');
                                $('.fc-day-check-' + d).parent().parent().css('background-color', '');
                                selectCheck();
                            } else {
                                $('.fc-day-check-' + d).html('<img src="${ctx}/static/plugins/fullcalendar/images/ok.png">').attr('fc-day-check-check', 'true');
                                $('.fc-day-check-' + d).parent().parent().css('background-color', '#E7E7E7');
                                selectCheck();
                            }
                        }
                    }
                });
        });

    function selectCheck() {
        $('.report-course').empty();
        $("[fc-day-check-check='true']").each(function () {
            var d = $(this).attr('date');
            var $template = $('#template').clone();
            $template.find("div:eq(0)").attr('id', $(this).attr('date'));
            $template.find("label:eq(0)").html($(this).attr('date'));
            $template.find("input:eq(0)").attr('name', 'reportDate').attr('value', $(this).attr('date'));
            $template.find("input:eq(1)").attr('name', 'reportDateAM');
            $template.find("input:eq(2)").attr('name', 'reportDatePM');
            $template.find("input:eq(3)").attr('name', 'reportDateWS');
            $template.find("button:eq(0)").attr('title', d);
            $('.report-course').append($template.html());
        });
    }
    /** 绑定事件到日期下拉框 **/
    $(function () {
        $("#fc-dateSelect").delegate("select", "change", function () {
            var fcsYear = $("#fcs_date_year").val();
            var fcsMonth = $("#fcs_date_month").val();
            $("#calendar").fullCalendar('gotoDate', fcsYear, fcsMonth);
        });
    });
    function delReport(obj) {
        var d = obj.title;
        $('#' + d).remove();
        $('.fc-day-check-' + d).html('').attr('fc-day-check-check', 'false');
        $('.fc-day-check-' + d).parent().parent().css('background-color', '');
        selectCheck();
    }

    $('.btn-save').click(function () {
        alert('aaa');
        $.post($form.attr('action'), $form.serialize(), function (result) {
            if (result.status == 200) {
                alert("上报成功");
                //$("#body-content").empty().load('${ctx}/education/teacher/reportDayHistory');
            } else {
                alert("上报失败");
            }
        }, 'json');
    });
</script>

</body>
</html>