<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>行业管理</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/bootstrap-table-master/dist/bootstrap-table.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/bootstrap-select-1.13.0-dev/dist/css/bootstrap-select.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/x-editable-develop/dist/bootstrap3-editable/css/bootstrap-editable.css">
    <script type="application/javascript"
            src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <script type="application/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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

</head>
<body>
<div class="container">
    <div class="page-header">
        <h1 style=" display:inline;">客户</h1>
        <h2 style=" display:inline;">->新建客户</h2>
        <h3 style=" display:inline;">->行业管理</h3>
    </div>

    <button id="register_btn" class="btn btn-info" data-toggle="modal" data-target="#newModal">新增</button>

    <div class="modal fade" id="newModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"> 新增行业</div>
                <form class="form-horizontal">
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="trade_name" class="col-sm-2 control-label">行业名称</label>
                            <div class="col-sm-10">
                                <input id="trade_name" type="text" class="form-control list-inline"
                                       placeholder="请输入需要添加的行业名称"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="trade_level" class="col-sm-2 control-label">行业级别</label>
                            <div class="col-sm-10">
                                <select name="" id="trade_level" class="form-control" onchange="func()">
                                    <option value="0">请选择行业级别</option>
                                    <option value="1">一级行业</option>
                                    <option value="2">二级行业</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group" style="display: none" id="hiddenDiv">
                            <label for="firstTradeName" class="col-sm-2 control-label">一级行业</label>
                            <div class="col-sm-10">
                                <select name="" id="firstTradeName" class="form-control"></select>
                            </div>
                        </div>

                    </div>
                </form>
                <div class="modal-footer">
                    <button class="btn btn-success" id="tredeSumbit" type="submit">提交</button>
                    <button class="btn btn-danger" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>




    </div>

    <script>
        function func() {
            var option = $('#trade_level option:selected').val();
            if (option == 2) {

                $("#firstTradeName").empty();
                var data;
                var htmls = '<option value="">请选择</option>'; //全局变量
                $.ajax({
                    url: "${pageContext.request.contextPath}/trade/getAllFirstIdTrade",
                    dataType: "json",
                    async: false,
                    cache: false,
                    traditional: true,
                    success: function (data) {
                        for (var x in data) {
                            // var option =  $("<option></option>").attr("value", data[x].key).append(data[x].value );
                            htmls += '<option value = "' + data[x].key + '">' + data[x].value + '</option>'
                        }
                        $("#firstTradeName").html(htmls);
                    }
                });

                $("#hiddenDiv").show()
            }
            if (option == 1) {
                $("#hiddenDiv").hide();
                $("#trade_level").val(1);
            }
        }
        $("#tredeSumbit").click(function () {
            if ($("#trade_name").val() == "") {
                alert("请输入行业名称！")
                return;
            } else if ($("#trade_level").val() != 1 && $("#trade_level").val() != 2) {
                alert("请选择行业级别！")
                return;
            } else if ($("#trade_level").val() == 2 && $("#firstTradeName").val() == "") {
                alert("请选择该行业所属的一级行业")
                return;
            } else {
// alert($("#firstTradeName").find("option:selected").text())
                $.ajax({
                    url: "${pageContext.request.contextPath}/trade/saveTrade",
                    type: "post",
                    async: false,
                    data: {
                        tradeLevel: $("#trade_level").val(),
                        tradeName: $("#trade_name").val(),
                        belongId: $("#firstTradeName").val(),
                        belongName: $("#firstTradeName").find("option:selected").text(),
                    },
                    success: function (obj) {
                        if (obj == 3) {
                            alert("输入的行业名称已经存在!")
                            return
                        }else {
                            alert("创建成功!")
                            $("#newModal").modal("hide");
                        }

                    }


                })


            }
        })
    </script>


    <table id="tradeTable"></table>
    <%--<script>--%>
        <%--$.ajax({--%>
            <%--url: "${pageContext.request.contextPath}/trade/allTrade",--%>
            <%--success:function (res) {--%>
                <%--console.log(res)--%>
            <%--}--%>
        <%--})--%>
    <%--</script>--%>
    <script>
        $('#tradeTable').bootstrapTable('destroy').bootstrapTable({
            url: "${pageContext.request.contextPath}/trade/allTrade",
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
                    field: 'tradeName',
                    "halign": "center",
                    "align": "center",
                    title: '行业名称',
                    width: '21%',
                    sortable: true,
                },
                {
                    field: 'tid',
                    "halign": "center",
                    "align": "center",
                    title: '行',
                    width: '21%',
                    sortable: true,
                },
                {
                    field: 'tradeLevel',
                    "halign": "center",
                    "align": "center",
                    title: '行业级别',
                    width: '21%',
                    sortable: true,
                    // formatter:function(value,row,index){
                    //     // return changeDateFormat(value);
                    // }
                },
                {
                    field: 'belongName',
                    "halign": "center",
                    "align": "center",
                    title: '所属类别',
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
                        return  '<button id="deleteTrade" class="btn btn-danger btn-xs" style="margin-left:10px"><i class="glyphicon glyphicon-trash"></i>删除</button>';
                        // '<button id="updateTrade" class="btn btn-info btn-xs" style="margin-left:10px" ><i class="glyphicon glyphicon-edit"></i> 编辑</button>'

                    },
                    events: {
                        'click #deleteTrade': function (value, row, index) {
                            alert(index.tid)
                            $.ajax({
                                url: "${pageContext.request.contextPath}/trade/deleteTrade",
                                type: "get",
                                async: false,
                                data:
                                    {
                                        tId: index.tid,
                                    },
                                success: function (obj) {
                                    if (obj == 1) {
                                        alert("删除成功！");
                                        $("#tradeTable").bootstrapTable('refresh');
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
                            <%--toRealPage("${pageContext.request.contextPath}/department/getOneDepByDepId/" + index.departmentId);--%>
                        }
                    }
                }
            ]
            ],

        });

    </script>



</div>
</body>
</html>
