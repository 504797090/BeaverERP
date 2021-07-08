<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<%--<%--%>
<%--if( session.getAttribute("bv_name")==null  || session.getAttribute("bv_name")=="" ) {--%>
<%--response.sendRedirect(basePath+"/beaver/login");--%>
<%--}--%>
<%--%>--%>
<%--<c:set var="ctx" value="${pageContext.request.contextPath}"/>--%>

<html xmlns:th="http://www.w3.org/2005/Atom">
<head>
    <!--编码格式-->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--移动端适配-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Beaver ERP System</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/bootstrapvalidator-master/dist/css/bootstrapValidator.min.css">
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect. -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/dist/css/skins/skin-blue.min.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <![endif]-->
    <!-- Google Font -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <!--所有的css资源-->
    <!--时间选择-->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap-timepicker/0.5.2/css/bootstrap-timepicker.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/bootstrap-datepicker-master/dist/css/bootstrap-datepicker.min.css">
    <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/bootstrap-table-master/dist/bootstrap-table.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/bootstrap-select-1.13.0-dev/dist/css/bootstrap-select.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/x-editable-develop/dist/bootstrap3-editable/css/bootstrap-editable.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/multiselect-master/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/select2-develop/dist/css/select2.min.css">


    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/css/bootstrap-treeview.css">

    <script type="application/javascript"
            src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <!--所有的js资源-->
    <script type="application/javascript"
            src="${pageContext.request.contextPath}/static/bootstrapvalidator-master/dist/js/bootstrapValidator.min.js"></script>
    <!--bootstrap-->
    <script type="application/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>
    <script type="application/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
    <script type="application/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap-table-master/dist/locale/bootstrap-table-zh-CN.min.js"></script>
    <script type="application/javascript"
            src="${pageContext.request.contextPath}/static/x-editable-develop/dist/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
    <script type="application/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap-table-master/dist/extensions/editable/bootstrap-table-editable.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap-select-1.13.0-dev/dist/js/bootstrap-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-datepicker-master/dist/js/bootstrap-datepicker.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-datepicker-master/dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/multiselect-master/dist/js/multiselect.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/select2-develop/dist/js/select2.min.js"></script>
    <script src="https://unpkg.com/bootstrap-table@1.13.4/dist/extensions/select2-filter/bootstrap-table-select2-filter.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/songyz-xlsx-master/xlsx.js"></script>

    <%--曲线--%>
    <script src="https://cdn.jsdelivr.net/npm/jsplumb@2.8.0/dist/js/jsplumb.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/js/bootstraptable-treeview.js"></script>


    <style>
        .importFrame {
            border-top-right-radius: 5px;
            border-top-left-radius: 5px;
            border-bottom-right-radius: 5px;
            border-bottom-left-radius: 5px;
        }

        .importFrame::-webkit-input-placeholder {
            color: #888888;
            font-size: 14px;
            text-align: center;
        }
    </style>

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <!-- Main Header -->
    <header class="main-header">
        <!-- Logo -->
        <a href="#" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>  <img src="${pageContext.request.contextPath}/static/dist/img/beaver.jpg"
                                              class="img-circle" alt="User Image"></b></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>Beaver ERP System</b></span>
        </a>
        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">
                <!--<ul class="nav navbar-nav">-->
                <!--&lt;!&ndash; Messages: style can be found in dropdown.less&ndash;&gt;-->
                <!--&lt;!&ndash; User Account Menu &ndash;&gt;-->
                <!--<li class="dropdown user user-menu">-->
                <!--&lt;!&ndash; Menu Toggle Button &ndash;&gt;-->
                <!--<a href="#" class="dropdown-toggle" data-toggle="dropdown">-->
                <!--&lt;!&ndash; The user image in the navbar&ndash;&gt;-->
                <!--<img  th:src="@{/dist/img/user2-160x160.jpg}" src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">-->
                <!--&lt;!&ndash; hidden-xs hides the username on small devices so only the image appears. &ndash;&gt;-->
                <!--<span class="hidden-xs">root</span>-->
                <!--</a>-->
                <!--<ul class="dropdown-menu">-->
                <!--&lt;!&ndash; Menu Footer&ndash;&gt;-->
                <!--<li class="user-footer">-->
                <!--<div class="pull-right">-->
                <!--<a href="#" class="btn btn-default btn-flat">退出</a>-->
                <!--</div>-->
                <!--</li>-->
                <!--</ul>-->
                <!--</li>-->
                <!--</ul>-->
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="${pageContext.request.contextPath}/static/dist/img/beaver.jpg" class="img-circle"
                         alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>采购管理员</p>
                    <!-- Status -->
                    <a href="#"><i class="fa fa-circle text-success"></i>在线</a>
                </div>
            </div>
            <!--左侧菜单 -->
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">HEADER</li>
                <!-- Optionally, you can add icons to the links -->
                <li class="treeview">
                    <a href="#"><i class="fa fa-link"></i> <span>人事</span>
                        <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#"
                               onclick="toRealPage('${pageContext.request.contextPath}/personnel/simple-check')">简单的功能先做一下，为了采购模块的功能</a>
                        </li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#"><i class="fa fa-link"></i> <span>档案</span>
                        <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#" onclick="toRealPage('')">在建中</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#"><i class="fa fa-link"></i> <span>财务</span>
                        <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#" onclick="toRealPage('')">在建中</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#"><i class="fa fa-link"></i> <span>订餐</span>
                        <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#" onclick="toRealPage('')">在建中</a></li>
                    </ul>
                </li>
                <%--安全--%>
                <li class="treeview">
                    <a href="#"><i class="fa fa-link"></i> <span>安全</span>
                        <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#" onclick="toRealPage('')">在建中</a></li>
                    </ul>
                </li>
                <!--采购-->
                <li class="treeview">
                    <a href="#"><i class="fa fa-link"></i> <span>采购</span>
                        <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#"
                               onclick="toRealPage('${pageContext.request.contextPath}/purchase/project-purchasing')">项目采购</a>
                        </li>
                        <li><a href="#" onclick="toRealPage('/')">备库采购</a></li>
                        <li><a href="#" onclick="toRealPage('/')">研发采购</a></li>
                        <li><a href="#" onclick="toRealPage('/')">日常采购</a></li>
                        <li><a href="#" onclick="toRealPage('/')">资产采购</a></li>
                        <%--物料编码管理--%>

                        <li><a href="#"
                               onclick="toRealPage('${pageContext.request.contextPath}/purchase/material-code')">物料编码管理</a>
                        </li>
                    </ul>
                </li>
                <%--外协--%>
                <li class="treeview">
                    <a href="#"><i class="fa fa-link"></i> <span>外协</span>
                        <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#" onclick="toRealPage('')">在建中</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#"><i class="fa fa-link"></i> <span>资产</span>
                        <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#" onclick="toRealPage('')">在建中</a></li>
                    </ul>
                </li>

                <li class="treeview">
                    <a href="#"><i class="fa fa-link"></i> <span>生产</span>
                        <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#" onclick="toRealPage('')">在建中</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#"><i class="fa fa-link"></i> <span>跟单</span>
                        <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#" onclick="toRealPage('')">在建中</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#"><i class="fa fa-link"></i> <span>售后</span>
                        <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#" onclick="toRealPage('')">在建中</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#"><i class="fa fa-link"></i> <span>市场</span>
                        <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#" onclick="toRealPage('')">在建中</a></li>
                    </ul>
                </li>
                <%--客户--%>
                <li class="treeview">
                    <a href="#"
                       onclick="toRealPage('${pageContext.request.contextPath}/customer/customer-index')"><i class="fa fa-link"></i> <span>客户</span>
                        <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#"
                               onclick="toRealPage('${pageContext.request.contextPath}/customer/new-customer')">新建客户</a>
                        </li>
                        <li><a href="#"
                               onclick="toRealPage('${pageContext.request.contextPath}/customer/edit-customer')">编辑</a>
                        </li>
                        <li><a href="#"
                               onclick="toRealPage('${pageContext.request.contextPath}/customer/query-customer')">查询</a>
                        </li>
                    </ul>
                </li>
                <%--产品--%>
                <li class="treeview">
                    <a href="#"
                       onclick="toRealPage('${pageContext.request.contextPath}/product/intoProductIndex')"
                    ><i class="fa fa-link"></i> <span>产品</span>
                        <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#" onclick="toRealPage('${pageContext.request.contextPath}/product/new-product')">新建产品</a>
                        </li>
                        <li><a href="#"
                               onclick="toRealPage('${pageContext.request.contextPath}/product/modify-product')">修改</a>
                        </li>
                        <li><a href="#"
                               onclick="toRealPage('${pageContext.request.contextPath}/product/query-product')">查询</a>
                        </li>
                    </ul>
                </li>
                <%--仓库--%>
                <li class="treeview">
                    <a href="#"><i class="fa fa-link"></i> <span>仓库</span>
                        <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#"
                               onclick="toRealPage('${pageContext.request.contextPath}/ware/complete-warehouse')">齐套入库</a>
                        </li>
                        <li><a href="#"
                               onclick="toRealPage('${pageContext.request.contextPath}/ware/warehourse-manage')">库位管理</a>
                        </li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#"><i class="fa fa-link"></i> <span>日志</span>
                        <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="#" onclick="toRealPage('')">在建中</a></li>
                    </ul>
                </li>
            </ul>
            <!-- /.左侧菜单 -->
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header" id="content-header">
            <%--<h1 class="primaryTitle">--%>
            <%--###--%>
            <%--&lt;%&ndash;<small class="secondaryTitle"></small>&ndash;%&gt;--%>
            <%--<h3  class="secondaryTitle"></h3>--%>
            <%--</h1>--%>

            <h2 style=" display:inline;" class="primaryTitle"></h2>
            <h3 style=" display:inline;" class="secondaryTitle"></h3>


            <!--<ol class="breadcrumb">-->
            <!--<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>-->
            <!--<li class="active">Here</li>-->
            <!--</ol>-->
        </section>
        <section class="content container-fluid" id="ourPage"></section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!-- Main Footer -->
    <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">
            <!--Anything you want-->
        </div>
        <!-- Default to the left -->
        <strong>Copyright &copy; 2021 <a href="#">Beaver</a>.</strong> All rights reserved.
    </footer>
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->


<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/static/dist/js/adminlte.min.js"></script>
<script type="text/javascript">
    function toRealPage(url) {
        $("#ourPage").empty();
        $("#ourPage").load(url);
    }
</script>
</body>
</html>