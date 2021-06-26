<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
    $(".primaryTitle").text("人事")

</script>
<table id="getAllStaff"></table>

<div id="updatePowerModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- 模态内容 -->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="updateStaffName">账号</h4>
            </div>
            <div class="modal-body" style="height: 280px">
                <div class="form-group">
                    采购模块
                    <br>
                    <label class="checkbox-inline">
                        <input type="checkbox" value="purchase_taskReview">任务审核
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" value="option2">12
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" value="option3">213
                    </label>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>

<script>
    $('#getAllStaff').bootstrapTable('destroy').bootstrapTable({
        url: "/personnel/getAllStaff",
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
                field: 'bvName',
                "halign": "center",
                "align": "center",
                title: '姓名',
                width: '21%',
                sortable: true,
            },
            {
                field: 'bvDepartment',
                "halign": "center",
                "align": "center",
                title: '部门',
                width: '21%',
                sortable: true,
            },
            {
                field: 'bvQuanxian',
                "halign": "center",
                "align": "center",
                title: '权限',
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
                    return '<button id="updateStaffPower" class="btn btn-info btn-xs" style="margin-left:10px"><i class="fa fa-address-book-o"></i>修改权限</button>' +
                        '<button id="deleteOneStaff" class="btn btn-danger btn-xs" style="margin-left:10px"><i class="glyphicon glyphicon-trash"></i>删除</button>';
                },
                events: {
                    'click #deleteOneStaff': function (value, row, index) {
                        $.ajax({
                            url: "/personnel/deleteOneStaff",
                            type: "post",
                            async: false,
                            dataType: "json",
                            traditional: true,
                            data:
                                {
                                    id: index.id,
                                },
                            success: function (obj) {
                                if (obj == 1) {
                                    alert("删除成功！");
                                    $("#getAllStaff").bootstrapTable('refresh');
                                } else {
                                    alert("删除失败");
                                }
                            },
                            error: function (obj) {
                                alert("删除成功");
                                $("#getAllStaff").bootstrapTable('refresh');
                            }
                        })
                    },
                    'click #updateStaffPower': function (value, row, index) {
                        // alert(index.id)
                        $.ajax({
                            url: "/personnel/getOneStaffById",
                            async: false,
                            data: {"id": index.id},
                            success: function (data) {
                                console.log(data)
                                $("#updateStaffName").html(data.bvName);
                                $("#updatePowerModal").modal('show');
                            }
                        })

                    },

                }
            }
        ]
        ],

    });

</script>