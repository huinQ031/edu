<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>B-JUI 前端管理框架</title>
    <!-- bootstrap - css -->
    <link href="${ctx}/static/bjui/themes/css/bootstrap.css" rel="stylesheet">
    <!-- core - css -->
    <link href="${ctx}/static/bjui/themes/css/style.css" rel="stylesheet">
    <link href="${ctx}/static/bjui/themes/green/core.css"  rel="stylesheet">
    <link href="${ctx}/static/bjui/themes/css/fontsize.css" rel="stylesheet">
    <!-- plug - css -->
    <link href="${ctx}/static/bjui/plugins/kindeditor_4.1.11/themes/default/default.css" rel="stylesheet">
    <link href="${ctx}/static/bjui/plugins/colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
    <link href="${ctx}/static/bjui/plugins/nice-validator-1.0.7/jquery.validator.css" rel="stylesheet">
    <link href="${ctx}/static/bjui/plugins/bootstrapSelect/bootstrap-select.css" rel="stylesheet">
    <link href="${ctx}/static/bjui/plugins/webuploader/webuploader.css" rel="stylesheet">
    <link href="${ctx}/static/bjui/themes/css/FA/css/font-awesome.min.css" rel="stylesheet">
    <!-- Favicons -->
    <link rel="apple-touch-icon-precomposed" href="${ctx}/static/bjui/assets/ico/apple-touch-icon-precomposed.png">
    <link rel="shortcut icon" href="${ctx}/static/bjui/assets/ico/favicon.png">
    <!--[if lte IE 7]>
    <link href="${ctx}/static/bjui/themes/css/ie7.css" rel="stylesheet">
    <![endif]-->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lte IE 9]>
    <script src="${ctx}/static/bjui/other/html5shiv.min.js"></script>
    <script src="${ctx}/static/bjui/other/respond.min.js"></script>
    <![endif]-->
    <!-- jquery -->
    <script src="${ctx}/static/bjui/js/jquery-1.11.3.min.js"></script>
    <script src="${ctx}/static/bjui/js/jquery.cookie.js"></script>
    <!--[if lte IE 9]>
    <script src="${ctx}/static/bjui/other/jquery.iframe-transport.js"></script>
    <![endif]-->
    <!-- B-JUI -->
    <script src="${ctx}/static/bjui/js/bjui-all.min.js"></script>
    <!-- plugins -->
    <!-- swfupload for kindeditor -->
    <script src="${ctx}/static/bjui/plugins/swfupload/swfupload.js"></script>
    <!-- Webuploader -->
    <script src="${ctx}/static/bjui/plugins/webuploader/webuploader.js"></script>
    <!-- kindeditor -->
    <script src="${ctx}/static/bjui/plugins/kindeditor_4.1.11/kindeditor-all-min.js"></script>
    <script src="${ctx}/static/bjui/plugins/kindeditor_4.1.11/lang/zh-CN.js"></script>
    <!-- colorpicker -->
    <script src="${ctx}/static/bjui/plugins/colorpicker/js/bootstrap-colorpicker.min.js"></script>
    <!-- ztree -->
    <script src="${ctx}/static/bjui/plugins/ztree/jquery.ztree.all-3.5.js"></script>
    <!-- nice validate -->
    <script src="${ctx}/static/bjui/plugins/nice-validator-1.0.7/jquery.validator.js"></script>
    <script src="${ctx}/static/bjui/plugins/nice-validator-1.0.7/jquery.validator.themes.js"></script>
    <!-- bootstrap plugins -->
    <script src="${ctx}/static/bjui/plugins/bootstrap.min.js"></script>
    <script src="${ctx}/static/bjui/plugins/bootstrapSelect/bootstrap-select.min.js"></script>
    <script src="${ctx}/static/bjui/plugins/bootstrapSelect/defaults-zh_CN.min.js"></script>
    <!-- icheck -->
    <script src="${ctx}/static/bjui/plugins/icheck/icheck.min.js"></script>
    <!-- HighCharts -->
    <script src="${ctx}/static/bjui/plugins/highcharts/highcharts.js"></script>
    <script src="${ctx}/static/bjui/plugins/highcharts/highcharts-3d.js"></script>
    <script src="${ctx}/static/bjui/plugins/highcharts/themes/gray.js"></script>
    <!-- other plugins -->
    <script src="${ctx}/static/bjui/plugins/other/jquery.autosize.js"></script>
    <link href="${ctx}/static/bjui/plugins/uploadify/css/uploadify.css" rel="stylesheet">
    <script src="${ctx}/static/bjui/plugins/uploadify/scripts/jquery.uploadify.min.js"></script>
    <script src="${ctx}/static/bjui/plugins/download/jquery.fileDownload.js"></script>
    <!-- init -->
    <script type="text/javascript">
        $(function() {
            BJUI.init({
                JSPATH       : '${ctx}/static/bjui/',         //[可选]框架路径
                PLUGINPATH   : '${ctx}/static/bjui/plugins/', //[可选]插件路径
                loginInfo    : {url:'login_timeout.html', title:'登录', width:440, height:240}, // 会话超时后弹出登录对话框
                statusCode   : {ok:200, error:300, timeout:301}, //[可选]
                ajaxTimeout  : 300000, //[可选]全局Ajax请求超时时间(毫秒)
                alertTimeout : 3000,  //[可选]信息提示[info/correct]自动关闭延时(毫秒)
                pageInfo     : {total:'totalRow', pageCurrent:'pageCurrent', pageSize:'pageSize', orderField:'orderField', orderDirection:'orderDirection'}, //[可选]分页参数
                keys         : {statusCode:'statusCode', message:'message'}, //[可选]
                ui           : {
                    sidenavWidth     : 220,
                    showSlidebar     : true, //[可选]左侧导航栏锁定/隐藏
                    overwriteHomeTab : false //[可选]当打开一个未定义id的navtab时，是否可以覆盖主navtab(我的主页)
                },
                debug        : true,    // [可选]调试模式 [true|false，默认false]
                theme        : 'green' // 若有Cookie['bjui_theme'],优先选择Cookie['bjui_theme']。皮肤[五种皮肤:default, orange, purple, blue, red, green]
            })
            //时钟
            var today = new Date(), time = today.getTime()
            $('#bjui-date').html(today.formatDate('yyyy/MM/dd'))
            setInterval(function() {
                today = new Date(today.setSeconds(today.getSeconds() + 1))
                $('#bjui-clock').html(today.formatDate('HH:mm:ss'))
            }, 1000)
        });

        //菜单-事件-zTree
        function MainMenuClick(event, treeId, treeNode) {
            if (treeNode.target && treeNode.target == 'dialog' || treeNode.target == 'navtab')
                event.preventDefault()
            if (treeNode.isParent) {
                var zTree = $.fn.zTree.getZTreeObj(treeId)
                zTree.expandNode(treeNode)
                return
            }
            if (treeNode.target && treeNode.target == 'dialog')
                $(event.target).dialog({id:treeNode.targetid, url:treeNode.url, title:treeNode.name})
            else if (treeNode.target && treeNode.target == 'navtab')
                $(event.target).navtab({id:treeNode.targetid, url:treeNode.url, title:treeNode.name, fresh:treeNode.fresh, external:treeNode.external})
        }
        // 满屏开关
        var bjui_index_container = 'container_fluid'
        function bjui_index_exchange() {
            bjui_index_container = bjui_index_container == 'container_fluid' ? 'container' : 'container_fluid'
            $('#bjui-top').find('> div').attr('class', bjui_index_container)
            $('#bjui-navbar').find('> div').attr('class', bjui_index_container)
            $('#bjui-body-box').find('> div').attr('class', bjui_index_container)
        }
    </script>
</head>
<body>
<body>
<!--[if lte IE 7]>
<div id="errorie"><div>您还在使用老掉牙的IE，正常使用系统前请升级您的浏览器到 IE8以上版本 <a target="_blank" href="http://windows.microsoft.com/zh-cn/internet-explorer/ie-8-worldwide-languages">点击升级</a>&nbsp;&nbsp;强烈建议您更改换浏览器：<a href="http://down.tech.sina.com.cn/content/40975.html" target="_blank">谷歌 Chrome</a></div></div>
<![endif]-->
<div id="bjui-top" class="bjui-header">
    <div class="container_fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapsenavbar" data-target="#bjui-top-collapse" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <nav class="collapse navbar-collapse" id="bjui-top-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="datetime"><a><span id="bjui-date">0000/00/00</span> <span id="bjui-clock">00:00:00</span></a></li>
                <li><a href="#">账号：BJUI</a></li>
                <li><a href="#">角色：管理员</a></li>
                <li><a href="changepassword.html" data-toggle="dialog" data-id="sys_user_changepass" data-mask="true" data-width="400" data-height="300">修改密码</a></li>
                <li><a href="login.html" style="font-weight:bold;">&nbsp;<i class="fa fa-power-off"></i> 注销登陆</a></li>
                <li class="dropdown"><a href="#" class="dropdown-toggle bjui-fonts-tit" data-toggle="dropdown" title="更改字号"><i class="fa fa-font"></i> 大</a>
                    <ul class="dropdown-menu" role="menu" id="bjui-fonts">
                        <li><a href="javascript:;" class="bjui-font-a" data-toggle="fonts"><i class="fa fa-font"></i> 特大</a></li>
                        <li><a href="javascript:;" class="bjui-font-b" data-toggle="fonts"><i class="fa fa-font"></i> 大</a></li>
                        <li><a href="javascript:;" class="bjui-font-c" data-toggle="fonts"><i class="fa fa-font"></i> 中</a></li>
                        <li><a href="javascript:;" class="bjui-font-d" data-toggle="fonts"><i class="fa fa-font"></i> 小</a></li>
                    </ul>
                </li>
                <li><a href="javascript:;" onclick="bjui_index_exchange()" title="横向收缩/充满屏幕"><i class="fa fa-exchange"></i></a></li>
            </ul>
        </nav>
    </div>
</div>
<header class="navbar bjui-header" id="bjui-navbar">
    <div class="container_fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" id="bjui-navbar-collapsebtn" data-toggle="collapsenavbar" data-target="#bjui-navbar-collapse" aria-expanded="false">
                <i class="fa fa-angle-double-right"></i>
            </button>
            <a class="navbar-brand" href="http://b-jui.com"><img src="${ctx}/static/bjui/images/logo.png" height="30"></a>
        </div>
        <nav class="collapse navbar-collapse" id="bjui-navbar-collapse">
            <ul class="nav navbar-nav navbar-right" id="bjui-hnav-navbar">
                <li class="active">
                    <a href="${ctx}/json/menu-form.json" data-toggle="sidenav" data-id-key="targetid">表单相关</a>
                </li>
            </ul>
        </nav>
    </div>
</header>
<div id="bjui-body-box">
    <div class="container_fluid" id="bjui-body">
        <div id="bjui-sidenav-col">
            <div id="bjui-sidenav">
                <div id="bjui-sidenav-arrow" data-toggle="tooltip" data-placement="left" data-title="隐藏左侧菜单">
                    <i class="fa fa-long-arrow-left"></i>
                </div>
                <div id="bjui-sidenav-box">

                </div>
            </div>
        </div>
        <div id="bjui-navtab" class="tabsPage">
            <div id="bjui-sidenav-btn" data-toggle="tooltip" data-title="显示左侧菜单" data-placement="right">
                <i class="fa fa-bars"></i>
            </div>
            <div class="tabsPageHeader">
                <div class="tabsPageHeaderContent">
                    <ul class="navtab-tab nav nav-tabs">
                        <li><a href="javascript:;"><span><i class="fa fa-home"></i> #maintab#</span></a></li>
                    </ul>
                </div>
                <div class="tabsLeft"><i class="fa fa-angle-double-left"></i></div>
                <div class="tabsRight"><i class="fa fa-angle-double-right"></i></div>
                <div class="tabsMore"><i class="fa fa-angle-double-down"></i></div>
            </div>
            <ul class="tabsMoreList">
                <li><a href="javascript:;">#maintab#</a></li>
            </ul>
            <div class="navtab-panel tabsPageContent">
                <div class="navtabPage unitBox">
                    <div class="bjui-pageContent">
                        <div class="highlight">
                                <pre class="prettyprint">
------------------------
BJUI 更新至 V1.31
------------------------
[修复] datagrid参数templateWidth、dialogFilterW为0时默认为启用；修复排序bug；新增字段参数itemattr，为items参数指定key/value；新增方法filter，用于数据筛选。
[修复] 分页组件。
[更新] ajaxform、ajaxsearch新增参数validate，是否验证标记。
[更新] 验证插件nice validate更新至1.0.7。
[更新] 图标字体Font Awesome更新至4.7.0。
[调整] CSS细微调整。
------------------------

　　　　　　2016-11-01 by.萧克南
                                </pre>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${ctx}/static/bjui/other/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
