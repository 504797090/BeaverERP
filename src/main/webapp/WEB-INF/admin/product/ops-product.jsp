<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>维护产品类型</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/bootstrap-table-master/dist/bootstrap-table.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/bootstrap-select-1.13.0-dev/dist/css/bootstrap-select.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/x-editable-develop/dist/bootstrap3-editable/css/bootstrap-editable.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/css/bootstrap-treeview.css">
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
    <%--隐藏图标更改了358行--%>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/js/bootstraptable-treeview.js"></script>

</head>
<body>

<div class="container">

    <div class="page-header">
        <h1 style=" display:inline;">产品</h1>
        <h2 style=" display:inline;">->新建产品</h2>
        <h3 style=" display:inline;">->维护产品类型</h3>
    </div>

    <%--添加根节点模态框--%>
    <div class="modal fade" id="addRootNodeTree">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" id="treeHeader"><h3>新增根节点</h3> </div>
                <form class="form-horizontal">
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="rootName" class="col-sm-2 control-label">节点名称</label>
                            <div class="col-sm-10">
                                <input id="rootName" type="text" class="form-control list-inline"
                                       placeholder="请输入需要添加的节点名称"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="rootDsc" class="col-sm-2 control-label">节点描述</label>
                            <div class="col-sm-10">
                                <input id="rootDsc" type="text" class="form-control list-inline"
                                       placeholder="请输入节点组件的描述"/>
                            </div>
                        </div>

                        <input type="hidden" id="rootIdIFIsChild"/>
                    </div>
                </form>
                <div class="modal-footer">
                    <button class="btn btn-success" id="rootSumbit" type="submit">提交</button>
                    <button class="btn btn-danger" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>


    </div>


    <div style="margin:20px">
        <input type="button" id="expandAllTree" value="展开所有" class="btn btn-defaul"/>
        <input type="button" id="collapseAllTree" value="折叠所有" class="btn btn-defaul"/>
        <input type="button" value="添加根节点" data-toggle="modal" data-target="#addRootNodeTree" class="btn btn-defaul"/>

        <table id="tree_table"></table>
    </div>
    <%--根节点--%>
    <script>
        $("#rootSumbit").click(function () {

            if ($("#rootName").val() == "" || $("#rootDsc").val() == "") {
                alert("请填写组件名称或组件描述!")
                return
            } else {
                var data = {
                    number :0,
                    id: "0",
                    name: $("#rootName").val(),
                    description: $("#rootDsc").val(),
                }
                var parentId = $("#rootIdIFIsChild").val();

                if (parentId != "") {
                    data = {
                        number :0,
                        id: parentId,
                        name: $("#rootName").val(),
                        description: $("#rootDsc").val(),
                        parentId: parentId
                    }

                }
                $.ajax({
                    url: "${pageContext.request.contextPath}/customer/addOneNode",
                    dataType: "json",
                    async: false,
                    cache: false,
                    data: data,
                    success: function (data) {
                        if (data == 1) {
                            alert("创建成功!")
                            $("#addRootNodeTree").modal("hide");
                            $("#tree_table").bootstrapTable('refresh');
                        } else {
                            alert("创建失败!")
                        }
                        $("#rootIdIFIsChild").val("");
                        $("#treeHeader").text("新增根节点")
                        $('#tree_table').bootstrapTable("expandAllTree")
                    }
                })
            }

        })

    </script>

    <script>
        $(function () {
            $('#tree_table').bootstrapTable({
                class: 'table table-hover table-bordered',
                url: '${pageContext.request.contextPath}/customer/returnTreeFramework',
                contentType: 'application/x-www-form-urlencoded; charset=utf-8',
                // data: data,
                sidePagination: 'server',
                pagination: false,
                treeView: true,
                treeId: "id",
                treeField: "name",
                rowAttributes: function (row, index) {
                    return {
                        xx: index
                    };
                },
                queryParams: function (params) {
                    var param = {
                        roleId: 'xx'
                    };
                    return param;
                },
                columns: [
                    //     {
                    //     checkbox:true
                    // },
                    {
                        field: 'name',
                        title: '名称',
                    },
                    {
                        field: 'description',
                        title: '组件详细信息',
                    },
                    {
                        field: 'operate',
                        title: '操作',
                        align: 'center',
                        events: operateEvents,
                        formatter: 'operateFormatter'
                    },

                ]
            });
            //展开所有
            $("#expandAllTree").on('click', function () {
                $('#tree_table').bootstrapTable("expandAllTree")
            })
            //关闭所有
            $("#collapseAllTree").on('click', function () {
                $('#tree_table').bootstrapTable("collapseAllTree")
            })

        });


        // 格式化按钮
        function operateFormatter(value, row, index) {
            return [
                '<button type="button" class=" btn btn-sm      RoleOfadd btn-defaul" style="margin-right:15px;"   data-toggle="modal" data-target="#addRootNodeTree"><i class="fa fa-plus" ></i>&nbsp;新增</button>',
                // '<button type="button" class=" btn btn-sm   btn-primary" style="margin-right:15px;"><i class="fa fa-pencil-square-o" ></i>&nbsp;修改</button>',
                '<button type="button" class=" btn btn-sm  RoleOfdelete  btn-defaul" style="margin-right:15px;"><i class="fa fa-trash-o" ></i>&nbsp;删除</button>'
            ].join('');

        }

        //初始化操作按钮的方法
        window.operateEvents = {
            'click .RoleOfadd': function (e, value, row, index) {

                add(row.id, row.name);

            },
            'click .RoleOfdelete': function (e, value, row, index) {
                del(row.id);
            },
            // 'click .RoleOfedit': function (e, value, row, index) {
            //     update(row.id);
            // }
        };

        function add(id, name) {
            $("#rootIdIFIsChild").val(id)
            $("#treeHeader").text("在<" + name + ">目录下添加:")
        }

        function del(id) {
            var flag = confirm("确认要删除吗?");
            if (flag) {
                //删除根节点
                $.ajax({
                    url: "${pageContext.request.contextPath}/customer/deleteNode",
                    dataType: "json",
                    async: false,
                    cache: false,
                    data: {
                        id: id
                    },
                    success: function (data) {
                        console.log(data)
                        $("#tree_table").bootstrapTable('refresh');
                    }

                })
            }
        }


        // function update(id) {
        //     alert("update 方法 , id = " + id);
        // }

    </script>


</div>


</body>
</html>
