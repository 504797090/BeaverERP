<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>采购信息管理模块</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static//bootstrap-datepicker-master/dist/css/bootstrap-datepicker.min.css">
    <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-table-master/dist/bootstrap-table.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap-select-1.13.0-dev/dist/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/x-editable-develop/dist/bootstrap3-editable/css/bootstrap-editable.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/multiselect-master/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/select2-develop/dist/css/select2.min.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <%--<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>--%>
    <!--所有的js资源-->
    <script type="application/javascript" src="${pageContext.request.contextPath}/static//bootstrapvalidator-master/dist/js/bootstrapValidator.min.js"></script>
    <!--bootstrap-->
    <script type="application/javascript" src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/static/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
    <script type="application/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap-table-master/dist/locale/bootstrap-table-zh-CN.min.js"></script>
    <script type="application/javascript"
            src="${pageContext.request.contextPath}/static/x-editable-develop/dist/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
    <script type="application/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap-table-master/dist/extensions/editable/bootstrap-table-editable.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap-select-1.13.0-dev/dist/js/bootstrap-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-datepicker-master/dist/js/bootstrap-datepicker.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-datepicker-master/dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jQuery.Form.js"></script>
    <script src="${pageContext.request.contextPath}/static/multiselect-master/dist/js/multiselect.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/select2-develop/dist/js/select2.min.js"></script>
    <script src="https://unpkg.com/bootstrap-table@1.13.4/dist/extensions/select2-filter/bootstrap-table-select2-filter.min.js"></script>

    <script src="${pageContext.request.contextPath}/static/songyz-xlsx-master/xlsx.js"></script>

    <script>
        checkIsLogin()
        function checkIsLogin(){
            $.ajax({
                url:"<%=basePath%>/account/userIsLogin",
                type: "post",
                async: false,
                success:function (data) {
                    if(data==0){
                        console.log("非登录状态");
                        window.location.href='/beaver/old';
                        return
                    }
                }
            })
        }

    </script>
</head>
<body>

<ul class="nav nav-pills">
    <li class="active" role="presentation"><a href="#home" role="tab" data-toggle="pill">采购订单详情</a></li>
    <!--供应商-->
    <li role="presentation"><a href="#sport" role="tab" data-toggle="pill">供应商信息</a></li>
    <!--<li  role="presentation"><a href="#messages" role="tab" data-toggle="pill"></a></li>-->
</ul>


<div class="tab-content">
    <div class="tab-pane active" id="home">

        <div style="padding-top: 50px">
            <div style="float: left">
                <button class="btn btn-info" style="margin-left: 20px;margin-top:5px;" data-toggle="modal"
                        data-target="#addPurchaseModal" id="checkIsLoginPurchase">添加订单
                </button>
            </div>
            <div style="float: left;margin-left: 100px;width: 400px ; padding-bottom: 10px ;">
                <div style="width: 300px;border:1px solid #C09853;height: 65px ;">
                    <div style="float: left ;margin-left: 5px ">
                        <label style="font-size: 15px">从excel表上传：</label>
                        <br/>
                            <form method="post" action="/purchase/addPurchaseList" enctype="multipart/form-data">
                                <div style="float: left;width: 200px">
                                    <input name="file" type="file" id="checkIsLoginPurchase2"/>
                                </div>
                                <button class="btn btn-info" style=" margin-right: 5px ;float: right" type="submit">上传
                                </button>
                            </form>
                    </div>
                    <!--<button class="btn btn-info" style="margin-top:5px;margin-right: 5px ;float: right" onclick="addPurchaseList()">开始添加-->
                    <!--</button>-->
                </div>
            </div>


            <div id="addPurchaseModal" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- 模态内容 -->
                    <div class="modal-content">
                        <!-- 模态框头部 -->
                        <div class="modal-header">
                            <h4 class="modal-title">添加采购订单</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <label>请输入采购项目名称：</label>
                                <br>
                                <input id="purchaseName" class="form-control" type="text" placeholder="请输入采购项目名称">
                            </div>
                            <div class="form-group">
                                <label>请选择供应商名称：</label>
                                <br>
                                <select id="supplierSelect" class="form-control">
                                </select>
                            </div>
                            <div class="form-group">
                                <label>请输入本次采购的物料称：</label>
                                <input class="form-control" type="text" placeholder="请输入本次采购的物料名称" id="material"
                                       name="">
                            </div>
                            <div class="form-group">
                                <label>请输入本次采购的物料数量：</label>
                                <input class="form-control" type="text" placeholder="请输入本次采购的物料数量" id="amount" name=""
                                       onkeypress="if((event.keyCode<48 || event.keyCode>57) && event.keyCode!=46 || /\.\d\d{2}$/.test(value))event.returnValue=false">
                            </div>
                            <div class="form-group">
                                <label>请输入物料种类：</label>
                                <input class="form-control" type="text" placeholder="请输入物料种类" id="type" name="" ">
                            </div>
                            <div class="form-group">
                                <label>请输入本次采购的物料的单价：</label>
                                <input class="form-control" type="text" placeholder="请输入本次采购的物料的单价" id="price" name=""
                                       onkeypress="if((event.keyCode<48 || event.keyCode>57) && event.keyCode!=46 || /\.\d\d{2}$/.test(value))event.returnValue=false">
                            </div>
                            <div class="form-group">
                                <label>请选择本次采购料接收部门：</label>
                                <select class="form-control" id="receptionDepartment" name="">
                                    <option value="">请选择本次采购料接收部门</option>
                                    <option value="产品部">产品部</option>
                                    <option value="综合部">综合部</option>
                                    <option value="装配部">装配部</option>
                                    <option value="机械部">机械部</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>请输入物料接收人员：</label>
                                <input class="form-control" type="text" placeholder="请输入物料接收人员" id="receptionName"
                                       name="">
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="addPurchase">提交</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>

            <table id="purchase"></table>
        </div>
        <!--前段 上传表格-->

        <script type="text/javascript">
            $("#checkIsLoginPurchase").click(function () {
                checkIsLogin()
            })
            $("#checkIsLoginPurchase2").click(function () {
                checkIsLogin()
            })
            function addPurchaseList() {               //批量上传
                jQuery.ajaxFileUpload({
                    url: "<%=basePath%>/user/addPurchaseList",
                    type: "post",
                    fileElementId: 'file',
                    data: {},
                    dataType: "json",
                    success: function (data) {
                        alert(data.msg);
                    }, error: function (data) {
                        alert("网络异常");
                    }
                });

            }

            $.ajax({
                url: "/purchase/getAllPurchase",
                type: "post",
                async: false,
                success: function (res) {
                    console.log(res)
                }
            })
            $('#purchase').bootstrapTable('destroy').bootstrapTable({
                url: "/purchase/getAllPurchase",
                method: 'POST',
                uniqueId: 'id',                        // 绑定ID，不显示
                striped: false,                         //是否显示行间隔色
                cache: false,                          //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                sortable: true,                        //是否启用排序
                sortOrder: "asc",                      //排序方式
                sidePagination: "client",              //分页方式：client客户端分页，server服务端分页（*）
                undefinedText: '--',
                // showRefresh: true,                  // 显示刷新按钮
                showColumns: true,                  // 选择显示的列
                toolbar: '#item_info_toolbar',         // 搜索框位置
                search: true,                          // 搜索开启,
                strictSearch: true,
                clickToSelect: true,                   // 点击选中行
                pagination: true,                      //是否显示分页
                pageNumber: 1,                          //初始化加载第一页，默认第一页,并记录
                pageSize: 10,//每页显示的数量
                pageList: [5, 10, 20, 50, 100],//设置每页显示的数量
                paginationPreText: "上一页",
                paginationNextText: "下一页",
                paginationLoop: false,
                //得到查询的参数
                columns: [[
                    {
                        title: '序号',
                        "halign": "center",
                        "align": "center",
                        width: '15%',
                        formatter: function (value, row, index) {
                            return index + 1;
                        }
                    },
                    {
                        field: 'purchaseName',
                        "halign": "center",
                        "align": "center",
                        title: '采购项目名称',
                        width: '21%',
                        sortable: true,
                    },
                    {
                        field: 'material',
                        "halign": "center",
                        "align": "center",
                        title: '物料名称',
                        width: '21%',
                        sortable: true,
                    },
                    {
                        field: 'amount',
                        "halign": "center",
                        "align": "center",
                        title: '数量',
                        width: '21%',
                        sortable: true,
                    },
                    {
                        field: 'type',
                        "halign": "center",
                        "align": "center",
                        title: '种类',
                        width: '21%',
                        sortable: true,
                    },
                    {
                        field: 'price',
                        "halign": "center",
                        "align": "center",
                        title: '价格',
                        width: '21%',
                        sortable: true,
                    },
                    {
                        field: 'receptionName',
                        "halign": "center",
                        "align": "center",
                        title: '接受对象',
                        width: '21%',
                        sortable: true,
                    },
                    {
                        field: 'remark',
                        "halign": "center",
                        "align": "center",
                        title: '订单备注',
                        width: '21%',
                        sortable: true,
                        editable: {
                            type: 'text',
                            title: '请修改订单备注',
                            emptytext: '请修改订单备注',
                        }
                    },
                    {
                        field: 'payTime1',
                        "halign": "center",
                        "align": "center",
                        title: '第一次付款时间',
                        width: '21%',
                        sortable: true,
                        editable: {
                            // type: 'date',
                            // title: '第一次付款时间',
                            // emptytext: '第一次付款时间',
                            type: 'text',
                            title: '第一次付款时间',
                            emptytext: '第一次付款时间',
                        },
                    },
                    {
                        field: 'payTime2',
                        "halign": "center",
                        "align": "center",
                        title: '第二次付款时间',
                        width: '21%',
                        sortable: true,
                        editable: {
                            // type: 'date',
                            // title: '第二次付款时间',
                            // emptytext: '请选择第二次付款时间',
                        type: 'text',
                        title: '第二次付款时间',
                        emptytext: '第二次付款时间',
                        },
                    },
                    {
                        field: 'sponsorUsername',
                        "halign": "center",
                        "align": "center",
                        title: '采购提请人',
                        width: '21%',
                        sortable: true,
                    },
                    {
                        field: 'sponsorDepartment',
                        "halign": "center",
                        "align": "center",
                        title: '采购提请部门',
                        width: '21%',
                        sortable: true,
                    },
                    {
                        field: 'operate',
                        title: '操作',
                        "halign": "center",
                        "align": "center",
                        width: '27%',
                        formatter: function (value, row, index) {//row代表此行数据,index代表此行索引
                            return '<button id="deletePurchase" class="btn btn-danger btn-xs" style="margin-left:10px"><i class="glyphicon glyphicon-trash"></i>删除</button>';
                        },
                        events: {
                            'click #deletePurchase': function (value, row, index) {
                                $.ajax({
                                    url: "<%=basePath%>/purchase/deletePurchase",
                                    type: "post",
                                    async: false,
                                    dataType: "json",
                                    traditional: true,
                                    data:
                                        {
                                            pid: index.pid,
                                        },
                                    success: function (obj) {
                                        if (obj == 1) {
                                            alert("删除成功！");
                                            $("#purchase").bootstrapTable('refresh');
                                        } else {
                                            alert("删除失败");
                                        }
                                    },
                                    error: function (obj) {
                                        alert("删除成功");
                                        $("#purchase").bootstrapTable('refresh');
                                    }

                                })
                            },

                        }
                    }

                ]
                ],
                onEditableSave: function (field, row, oldValue, $el) {

                    $.ajax({
                        type: "post",
                        url: "<%=basePath%>/purchase/updatePurchase",
                        data: {
                            pId: row.pid,
                            remark: row.remark,
                            payTime1: row.payTime1,
                            payTime2: row.payTime2,
                        },
                        dataType: 'JSON',
                        success: function (res) {
                            alert(res);
                        },
                        error: function () {
                            alert('编辑失败');
                        },
                        complete: function () {

                        }
                    });
                }
            });

            $(document).ready(function () {
                $("#supplierSelect").empty();
                var data;
                var htmls = '<option value="">请选择供应商,如果没有请先添加供应商</option>'; //全局变量
                $.ajax({
                    url: "<%=basePath%>/supplier/getAllSupplierIdName",
                    dataType: "json",
                    async: false,
                    cache: false,
                    traditional: true,
                    success: function (data) {
                        for (var x in data) {
                            // var option =  $("<option></option>").attr("value", data[x].key).append(data[x].value );
                            htmls += '<option value = "' + data[x].key + '">' + data[x].value + '</option>'
                        }
                        $("#supplierSelect").html(htmls);
                    }
                });
            });


            $("#addPurchase").click(function () {
                console.log($("#material").val() + $("#amount").val() + $("#type").val())
                if ($("#material").val() == "" || $("#amount").val() == "" || $("#type").val() == "" || $("#supplierSelect").val() == "" || $("#price").val() == "") {
                    alert("信息未填写全，请补全信息");
                    return;
                } else {
                    //先保存进入 ****物料表 *****
                    $.ajax({
                        url: "<%=basePath%>/material/addOneMaterial",
                        type: "post",
                        async: false,
                        data: {
                            "material": $("#material").val(),
                            "amount": $("#amount").val(),
                            "type": $("#type").val(),
                            "sId": $("#supplierSelect").val(),
                            "price": $("#price").val(),
                        },
                        success: function (obj) {
                            $.ajax({
                                url: "<%=basePath%>/purchase/addtOnePurchase",
                                type: "post",
                                async: false,
                                data: {
                                    "receptionDepartment": $("#receptionDepartment").val(),
                                    "sId": $("#supplierSelect").val(),//供应商id
                                    "receptionName": $("#receptionName").val(),  //接收 接收人员
                                    "purchaseName": $("#purchaseName").val(),  //接收部门
                                },
                                success: function (obj) {
                                    alert("提交成功")
                                    $("#addPurchaseModal").modal("hide");
                                    $('#purchase').bootstrapTable('refresh');
                                }
                            })
                        }
                    })
                }
            })


        </script>


    </div>


    <!-- 供应商############################供应商-->
    <!-- 供应商############################供应商-->
    <!-- 供应商############################供应商-->
    <!-- 供应商############################供应商-->
    <!-- 供应商############################供应商-->
    <!-- 供应商############################供应商-->
    <!-- 供应商############################供应商-->
    <div class="tab-pane" id="sport">

        <button class="btn btn-info" style="margin-left: 20px;margin-top:5px;" data-toggle="modal"
                data-target="#arrangeSupplier"> 新增供应商
        </button>

        <div id="arrangeSupplier" class="modal fade" role="dialog">
            <form action="#" id="myform">
                <div class="modal-dialog">
                    <!-- 模态内容 -->
                    <div class="modal-content">
                        <!-- 模态框头部 -->
                        <div class="modal-header">
                            <h4 class="modal-title">新增供应商</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form id="roundForm">
                                <div class="form-group">
                                    <label>供应商名称：</label>
                                    <br>
                                    <input class="form-control" type="text" placeholder="供应商名称" id="supplierName"
                                           name="supplierName">
                                    <!-- onchange="validateName(this)"-->
                                </div>
                                <div id="chongfu" style="color: red;display: none">此部门已存在</div>
                                <div class="form-group">
                                    <label>联系人：</label>
                                    <br>
                                    <input class="form-control" type="text" placeholder="联系人"
                                           id="supplierLinkman" name="supplierLinkman">
                                </div>
                                <div class="form-group">
                                    <label>联系人手机号：</label>
                                    <br>
                                    <input class="form-control" type="text" placeholder="联系人手机号"
                                           id="supplierTelphone" name="supplierTelphone">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" onclick="addSupplier()">提交</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>


        <table id="supplier"></table>
        <button id="test1">测试</button>
        <script>
            $("#test1").click(function () {
                // alert(11)
                $.ajax({
                    url: "/supplier/getAllSupplier",
                    async:false,
                    type: "post",
                    // contentType:'application/json',
                    // dataType:'json',
                    success:function (obj) {
                        console.log(1)
                        <%--console.log("<%=basePath%>/supplier/getAllSupplier")--%>
                        // alert(11)
                        console.log(obj)
                    },
                    error: function(){
                        alert("error")
                    }
                })
            })


            $('#supplier').bootstrapTable('destroy').bootstrapTable({
                url: "/supplier/getAllSupplier",
                method: 'POST',
                uniqueId: 'id',                        // 绑定ID，不显示
                striped: false,                         //是否显示行间隔色
                cache: false,                          //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                sortable: true,                        //是否启用排序
                sortOrder: "asc",                      //排序方式
                sidePagination: "client",              //分页方式：client客户端分页，server服务端分页（*）
                undefinedText: '--',
                // showRefresh: true,                  // 显示刷新按钮
                showColumns: true,                  // 选择显示的列
                toolbar: '#item_info_toolbar',         // 搜索框位置
                search: true,                          // 搜索开启,
                strictSearch: true,
                clickToSelect: true,                   // 点击选中行
                pagination: true,                      //是否显示分页
                pageNumber: 1,                          //初始化加载第一页，默认第一页,并记录
                pageSize: 10,//每页显示的数量
                pageList: [5, 10, 20, 50, 100],//设置每页显示的数量
                paginationPreText: "上一页",
                paginationNextText: "下一页",
                paginationLoop: false,
                //得到查询的参数
                columns: [[
                    {
                        title: '序号',
                        "halign": "center",
                        "align": "center",
                        width: '15%',
                        formatter: function (value, row, index) {
                            return index + 1;
                        }
                    },
                    {
                        field: 'companyName',
                        "halign": "center",
                        "align": "center",
                        title: '供应商名称',
                        width: '21%',
                        sortable: true,
                    },
                    {
                        field: 'linkman',
                        "halign": "center",
                        "align": "center",
                        title: '联系人',
                        width: '21%',
                        sortable: true,
                        // formatter:function(value,row,index){
                        //     // return changeDateFormat(value);
                        // }
                    },
                    {
                        field: 'telphone',
                        "halign": "center",
                        "align": "center",
                        title: '联系人手机号',
                        width: '21%',
                        sortable: true,
                        // formatter:function(value,row,index){
                        //     // return changeDateFormat(value);
                        // }
                    },
                    {
                        field: 'operate',
                        title: '操作',
                        "halign": "center",
                        "align": "center",
                        width: '27%',
                        formatter: function (value, row, index) {//row代表此行数据,index代表此行索引
                            return '<button id="updateDep" class="btn btn-info btn-xs" style="margin-left:10px" ><i class="glyphicon glyphicon-edit"></i> 编辑</button>' +
                                '<button id="deleteSupplier" class="btn btn-danger btn-xs" style="margin-left:10px"><i class="glyphicon glyphicon-trash"></i>删除</button>';
                        },
                        events: {
                            'click #deleteSupplier': function (value, row, index) {
                                $.ajax({
                                    url: "<%=basePath%>/supplier/deleteSupplier",
                                    type: "get",
                                    async: false,
                                    data:
                                        {
                                            sid: index.sid,
                                        },
                                    success: function (obj) {
                                        if (obj == 1) {
                                            alert("删除成功！");
                                            $("#supplier").bootstrapTable('refresh');
                                        } else {
                                            alert("删除失败")
                                        }
                                    },
                                    error: function (obj) {
                                        alert("删除成功");
                                        $("#supplier").bootstrapTable('refresh');
                                    }

                                })

                            },
                            'click #updateDep': function (value, row, index) {
                                toRealPage("${pageContext.request.contextPath}/department/getOneDepByDepId/" + index.departmentId);
                            }
                        }
                    }
                ]
                ],

            });

            function addSupplier() {
                if ($("#supplierLinkman").val() == "" || $("#supplierName").val() == "" || $("#supplierTelphone").val() == "") {
                    alert("信息未填写全")
                    return;
                }
                // else if ($("#chongfu").data("flag") == 1) {
                //     alert("部门名称重复~!")
                //     return;
                // }
                else {
                    $.ajax({
                        url: "/supplier/addSupplier",
                        type: "post",
                        async: false,
                        traditional: true,
                        data:
                            {
                                companyName: $("#supplierName").val(),
                                linkman: $("#supplierLinkman").val(),
                                telphone: $("#supplierTelphone").val(),
                            },
                        success: function (data) {
                            if (data == 1) {
                                $("#arrangeSupplier").modal("hide");
                                alert("添加成功!")
                                $('#supplier').bootstrapTable('refresh');
                            } else {
                                alert("添加失败!")
                                $('#supplier').bootstrapTable('refresh');
                            }
                        },
                        error: function (data) {
                            alert(data)
                            $('#supplier').bootstrapTable('refresh');
                        }
                    });
                }

            }
        </script>


    </div>
    <!--<div class="tab-pane" id="messages">信息</div>-->
</div>


</body>
</html>