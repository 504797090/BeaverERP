<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<!DOCTYPE html>
<html xmlns:th="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <title>beaverERP系统-登录</title>
    <!--用百度的静态资源库的cdn安装bootstrap环境-->
    <!-- Bootstrap 核心 CSS 文件 -->
    <link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!--font-awesome 核心我CSS 文件-->
    <link href="//cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- 在bootstrap.min.js 之前引入 -->
    <script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
    <!-- Bootstrap 核心 JavaScript 文件 -->
    <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <!--jquery.validate-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/message.js"></script>

    <!--引入BOOTSTRAP-css 生成部门选择-->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/bootstrap-select-1.13.0-dev/dist/css/bootstrap-select.css">
    <script src="${pageContext.request.contextPath}/static/bootstrap-select-1.13.0-dev/dist/js/bootstrap-select.js"></script>
    <style type="text/css">
        body {
            background: url(img/4.jpg) no-repeat;
            background-size: cover;
            font-size: 16px;
        }

        .form {
            background: rgba(255, 255, 255, 0.2);
            width: 400px;
            margin: 100px auto;
        }

        #login_form {
            display: block;
        }

        #register_form {
            display: none;
        }

        .fa {
            display: inline-block;
            top: 27px;
            left: 6px;
            position: relative;
            color: #ccc;
        }

        input[type="text"], input[type="password"] {
            padding-left: 26px;
        }

        .checkbox {
            padding-left: 21px;
        }
    </style>
    <style>
        img {
            cursor: pointer;
        }
    </style>
</head>
<body>
<!-- 注册模态框 -->
<div id="registerModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- 模态内容 -->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">注册账号</h4>
            </div>
            <div class="modal-body" style="height: 280px">
                <div action="" class="form-inline" method="post" role="form">
                    <div class="form-group" style="padding-bottom: 8px;">
                        <label class="col-md-6 text-center">
                            姓      名 :
                        </label>
                        <div class="col-md-6">
                            <input class="form-control" id="bv_name" type="text" name="bv_name"/>
                            <p id="telephoneError" style="margin-bottom: -2px;color: red;">
                            </p>
                        </div>
                    </div>
                    <div class="form-group" style="padding-bottom: 8px;">
                        <label class="col-md-6 text-center" for="password">
                            密      码 :
                        </label>
                        <div class="col-md-6">
                            <input class="form-control" id="password" name="password" type="password"/>
                            <p id="passwordError" style="margin-bottom: -2px;color: red;">
                            </p>
                        </div>
                    </div>
                    <!--<div class="form-group" style="padding-bottom: 8px;">-->
                    <!--<label class="col-md-6 text-center" for="rePassword">-->
                    <!--重复密码:-->
                    <!--</label>-->
                    <!--<div class="col-md-6">-->
                    <!--<input class="form-control" id="rePassword" name="rePassword"  type="password"/>-->
                    <!--<p id="rePasswordError" style="margin-bottom: -2px;color: red;">-->
                    <!--</p>-->
                    <!--</div>-->
                    <!--</div>-->
                    <div class="form-group" style="padding-bottom: 8px;">
                        <label class="col-md-6 text-center" for="name">
                            所属部门:
                        </label>
                        <div class="col-md-6">
                            <select class="selectpicker " title="请选择部门" style="position: relative; left: 50px"
                                    id="bv_department" name="bv_department">
                                <option value="产品部">产品部</option>
                                <option value="综合部">综合部</option>
                                <option value="装配部">装配部</option>
                                <option value="机械部">机械部</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" style="padding-bottom: 8px;">
                        <label class="col-md-6 text-center" for="email">
                            邮      箱 :
                        </label>
                        <div class="col-md-6">
                            <input class="form-control" id="email" name="email" required="true" type="text"/>
                            <p id="emailError" style="margin-bottom: -2px;color: red;">
                            </p>
                        </div>
                    </div>
                    <!--<div class="form-group" style="padding-bottom: 18px;">-->
                    <!--<label class="col-md-6 text-center" for="qq">-->
                    <!--Q       Q :-->
                    <!--</label>-->
                    <!--<div class="col-md-6">-->
                    <!--<input class="form-control" id="qq" name="qq" οnblur="checkQQ()" required="true" type="text"/>-->
                    <!--<p id="qqError" style="margin-bottom: -2px;color: red;">-->
                    <!--</p>-->
                    <!--</div>-->
                    <!--</div>-->
                    <div class="col-lg-6" style="margin-bottom: 8px">
                        <input class="btn btn-primary btn-block" type="submit" value="注册" onclick="register()"/>
                    </div>
                    <div class="col-lg-6" style="margin-bottom: 18px">
                        <a class="btn btn-primary btn-block" href="/beaver/login">
                            已有账号
                        </a>
                    </div>
                </div>
                <script>
                    function register() {
                        if ($("#bv_department").val() == "" || $("#password").val() == "" || $("#bv_name").val() == "") {
                            alert("信息未填写全")
                            return;
                        } else {
                            $.ajax({
                                url: "/account/addOneAccount",
                                type: "post",
                                async: false,
                                data: {
                                    bvName: $("#bv_name").val(),
                                    bvPassword: $("#password").val(),
                                    bvDepartment: $("#bv_department").val(),
                                    mail:$("#email").val(),
                                },
                                success: function (obj) {
                                    alert("注册成功,请等待审核");
                                    window.location.reload();
                                },
                            })
                        }

                    }
                </script>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>


<div class="container">
    <div class="form row">
        <div class="form-horizontal col-sm-offset-3 col-md-offset-3">
            <h3 class="form-title">beaverERP系统-登录</h3>
            <div class="col-sm-9 col-md-9">
                <div class="form-group">
                    <i class="fa fa-user fa-lg"></i>
                    <input class="form-control required" type="text" placeholder="请填写姓名" name="username"
                           autofocus="autofocus" maxlength="20" id="1"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i>
                    <input style="" class="form-control required" type="password" placeholder="请填写密码" name="password"
                           maxlength="8" id="2"/>
                </div>
                <div class="form-group">
                    <!--<label class="checkbox">-->
                    <!--<input type="checkbox" name="remember" value="1"/> Remember me-->
                    <!--</label>-->
                    <hr/>
                    <a href="javascript:;" id="register_btn" class="" data-toggle="modal" data-target="#registerModal">用户注册</a>
                </div>


                <div class="form-group">
                    <!--col-sm-10-->
                    <!--<div class=" col-sm-2">-->
                    <%--<img src="<%=basePath%>/account/getCode" id="codeImg" onclick="refresh()" alt="">--%>
                    <!--</div>-->

                    <%--<div class="form-group col-sm-9 col-md-9" style="margin-bottom: 0">--%>
                        <%--<!--<label class=" control-label" >-->--%>
                        <%--<!--验证码 :-->--%>
                        <%--<!--</label>-->--%>
                        <%--<input type="text" class="form-control col-sm-6" id="imgText" name="imgText"--%>
                               <%--placeholder="请输入验证码">--%>
                    <%--</div>--%>
                </div>

                <!--<div class="form-group">-->
                <!--&lt;!&ndash;<label for="password" class="col-sm-2 control-label">验证码</label>&ndash;&gt;-->
                <!--</div>-->

                <div class="form-group">
                    <input type="submit" class="btn btn-success pull-right" value="Login " id="login_form"/>
                </div>
            </div>
        </div>
    </div>

    <div class="form row">
        <form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="register_form">
            <h3 class="form-title">Login to your account</h3>
            <div class="col-sm-9 col-md-9">
                <div class="form-group">
                    <i class="fa fa-user fa-lg"></i>
                    <input class="form-control required" type="text" placeholder="Username" name="username"
                           autofocus="autofocus"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i>
                    <input class="form-control required" type="password" placeholder="Password" id="register_password"
                           name="password"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-check fa-lg"></i>
                    <input class="form-control required" type="password" placeholder="Re-type Your Password"
                           name="rpassword"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-envelope fa-lg"></i>
                    <input class="form-control eamil" type="text" placeholder="Email" name="email"/>
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-success pull-right" value="Sign Up "/>
                    <input type="submit" class="btn btn-info pull-left" id="back_btn" value="Back"/>
                </div>
            </div>
        </form>
    </div>
</div>
<script>

    // /* 刷新验证码 */
    // function refresh() {
    //     document.getElementById("codeImg").src = "/account/getCode?time=" + new Date().getTime();
    // }

    $("#login_form").click(function () {
        if ($("#1").val() == "" || $("#2").val() == "") {
            alert("请输入账号密码!")
            return
        }

        $.ajax({
            url: "/account/userLogin",
            type: "post",
            async: false,
            dataType: "json",
            data: {
                bvName: $("#1").val(),
                bvPassword: $("#2").val(),
                imgText: $("#imgText").val(),
            },
            success: function (obj) {
                // alert(obj)
                // if (obj == 3) {
                //     alert("您输入的的验证码有误")
                //
                // }
                if (obj == 1) {
                    window.location.href = '/account/loginSuccess'
                } else {
                    alert("登录失败，请重新登录!")
                    // window.location.reload();
                }


            },

        })

    })


</script>
</body>
</html>
