<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>系统登录</title>
    <link href="${ctx}/static/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/animate.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/login.min.css" rel="stylesheet">

    <script src="${ctx}/static/plugins/jquery/jquery.min.js"></script>
    <script src="${ctx}/static/plugins/jquery-validate/jquery.validate.min.js"></script>
    <script src="${ctx}/static/plugins/jquery-validate/messages_zh.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#login_form").validate();
        });
    </script>
</head>
<body class="signin">
<div class="signinpanel">
    <div class="row">
        <div class="col-sm-7">
            <div class="signin-info">
                <div class="logopanel m-b">
                    <h1></h1>
                </div>
                <div class="m-b"></div>
                <h4>欢迎使用 <strong>XXX 管理系统</strong></h4>
                <ul class="m-b">
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 日报管理</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 课程维护</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 成绩管理</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 学员管理</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> ...</li>
                </ul>
                <strong>还没有账号？
                    <a href="#">立即注册&raquo;</a>
                </strong>
            </div>
        </div>
        <div class="col-sm-5">
            <form action="/login" id="login_form" method="post">
                <h4 class="no-margins">登录</h4>
                <div style="float: right;color:#F00">${error}</div>
                <input type="text" name="loginName" class="form-control uname required" placeholder="用户名"/>
                <input type="password" name="password" class="form-control pword required" placeholder="密码"/>
                <div class="form-group text-right">
                    <input type="checkbox" name="rememberMe"> 记住我
                </div>
                <a href="#">忘记密码？</a>
                <button class="btn btn-success btn-block">登录</button>
            </form>
        </div>
    </div>
    <div class="signup-footer">
        <div class="pull-left">
            &copy; 2017 All Rights Reserved. ZTD
        </div>
    </div>
</div>
</body>
</html>