<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/plugins/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/plugins/bootstrap-validator/css/bootstrapValidator.css"/>
</head>
<body>
<div class="container-fluid">
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target="#example-navbar-collapse">
                    <span class="sr-only">切换导航</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">菜鸟团队</a>
            </div>
            <div class="collapse navbar-collapse" id="example-navbar-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#" id="report-main">主页</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">个人日报<b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#" id="report-day-add">日报填报</a>
                            </li>

                            <li role="separator" class="divider"></li>

                            <li>
                                <a href="#" id="report-day-today">今日日报</a>
                            </li>

                            <li>
                                <a href="#" id="report-day-history">历史日报</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="#" id="report-course-add">课时上报</a>
                    </li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">汇总查询<b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#" id="report-day-summary">当日日报汇总</a>
                            </li>
                            <li>
                                <a href="#" id="report-sourse-summary">当月课时汇总</a>
                            </li>
                            <li role="separator" class="divider"></li>
                            <li>
                                <a href="#" id="report-course-view">历史日报记录</a>
                            </li>
                            <li>
                                <a href="#" id="report-course-history">历史课时记录</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-user"></span> <shiro:principal property="name"/> <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#" id="page-user-info">个人信息</a>
                            </li>
                            <li>
                                <a href="#" id="page-change-password">修改密码</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="${ctx}/logout"><span class="glyphicon glyphicon-log-in"></span> 退出</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="panel panel-default" id="body-content"></div>
</div>

<script src="${ctx}/static/plugins/jquery/jquery.min.js" type="text/javascript"></script>
<script src="${ctx}/static/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${ctx}/static/plugins/bootstrap-validator/js/bootstrapValidator.min.js" type="text/javascript"></script>
<script src="${ctx}/static/plugins/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="${ctx}/static/plugins/layer/layer.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
        //加载主页面
        $("#body-content").load('${ctx}/education/teacher/main');

        //导航到主页面
        $("#report-main").click(function () {
            $("#body-content").empty().load('${ctx}/education/teacher/main');
        });

        //导航到个人日报填报页面
        $("#report-day-add").click(function () {
            $("#body-content").empty().load('${ctx}/education/teacher/reportDayAdd');
        });

        $("#report-day-today").click(function () {
            $("#body-content").empty().load('${ctx}/education/teacher/reportDayToday');
        });

        //导航到个人日报历史页面
        $("#report-day-history").click(function () {
            $("#body-content").empty().load('${ctx}/education/teacher/reportDayHistory');
        });

        //导航到个人课时填报页面
        $("#report-course-add").click(function () {
            $("#body-content").empty().load('${ctx}/education/teacher/reportCourseIndex');
        });

        //导航到当日日报汇总查询页面
        $("#report-day-summary").click(function () {
            $("#body-content").empty().load('${ctx}/education/teacher/reportDaySummary');
        });
    });
</script>

</body>
</html>
