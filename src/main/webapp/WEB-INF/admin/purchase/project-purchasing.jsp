<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
    $(".primaryTitle").text("采购")
    $(".secondaryTitle").text("项目采购")
</script>

<button class="btn btn-info" style="margin-right: 20px" id="buildPurease">任务建立</button>
<button class="btn btn-info" style="margin-right: 20px">任务审核</button>
<button class="btn btn-info">采购员指派</button>

<table id="purchase"></table>

<script>
    $('#purchase').bootstrapTable('destroy').bootstrapTable({
        url: "/purchase/getAllPurchase",
        height: 200,
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
                            url: "/purchase/deletePurchase",
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
                url: "/purchase/updatePurchase",
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

    $("#buildPurease").click(function () {
        window.open("/purchase/task-creation")
    })
</script>

<style>
    .text-with-hr {
        text-align: center;
        position: relative;
        z-index: 2;
    }

    /*
    横线，并通过z-index：-1将or附近的横线遮盖住
    */
    .text-with-hr:before {
        position: absolute;
        content: '';
        top: 20px;
        left: 0px;
        width: 100%;
        border-bottom: 1px solid #d4d4d4;
        z-index: -1;
    }

    .text-with-hr span {
        display: inline-block;
        background: white;
        padding: 10px;
    }
</style>
<div class="text-with-hr">
    <span>调试流程框</span>
</div>

<style>
    #diagramContainer {
        padding: 20px;
        width: 80%;
        height: 200px;
        border: 1px solid gray;
    }

    .item {
        height: 120px;
        width: 120px;
        border: 1px solid blue;
        float: left;
        margin-bottom: 20px;
        margin-left: 50px;
        background-color: #feeebd;
        cursor: pointer;
    }
</style>


<%--1 (1).	采购任务建立--%>
<div id="taskCreation" class="item" div_data="1">一、采购任务建立</div>
<%--2 (2).	采购任务审核--%>
<div id="taskReview" class="item danger" div_data="2">二、采购任务审核</div>
<%--3 (3).	采购员指派--%>
<div id="designate" class="item bg-danger" div_data="3">三、采购员指派</div>
<%--4 (4).	采购信息整理提交--%>
<div id="arrangeTosSubmit" class="item" style="margin-left:50px;" div_data="4">四、采购信息整理提交</div>
<%--5 (5).	供应商、价格、货期等采购信息审核--%>
<div id="auditOtherPurchasingInformation " class="item" style="margin-left:50px;" div_data="5">五、供应商、价格、货期等采购信息审核</div>
<%--6 (6).	采购申请单生成；--%>
<div id="applicationGeneration" class="item" style="margin-left:50px;" div_data="5">六、采购申请单生成</div>

<div style="clear:both"></div>
<%--(12).	付款回单下载；--%>
<div id="paymentSlipDownload" class="item" style="margin-left:50px;" div_data="12">十二、付款回单下载</div>
<%--(11).	网银付款指令授权；--%>
<div id="athorizationOnlineInstruction" class="item" style="margin-left:50px;" div_data="11">十一、网银付款指令授权</div>
<%--10(10).	付款审核；--%>
<div id="paymentReview" class="item" style="margin-left:50px;" div_data="10">十、付款审核</div>
<%--9(9).	网银付款指令提交；--%>
<div id="onlineBankingInstructionSubmission" class="item" style="margin-left:50px;" div_data="9">九、网银付款指令提交</div>
<%--8(8).	付款申请单生成；--%>
<div id="paymentRequisitionGenerated" class="item" style="margin-left:50px;" div_data="8">八、付款申请单生成</div>
<%--7S(7).	签订并上传合同--%>
<div id="signUploadContract" class="item" style="margin-left:50px; " div_data="7">七、签订并上传合同</div>


<div style="clear:both">
    <%--(13).	到货单生成；--%>
    <div id="InvoiceGeneration" class="item" style="margin-left:50px;" div_data="13">十三、到货单生成</div>
    <%--(14).	物料收货确认（对版、对数、对外购）；--%>
    <div id="materialReceiptConfirmation" class="item" style="margin-left:50px;" div_data="14">十四、物料收货确认（对版、对数、对外购）
    </div>
    <%--(15).	物料质检（由采购发起人负责质检）；；--%>
    <div id="materialQuality" class="item" style="margin-left:50px;" div_data="15">十五、物料质检（由采购发起人负责质检）</div>
    <%--(16).	物料入库，入库单生成--%>
    <div id="putMaterialsListGeneration" class="item" style="margin-left:50px;" div_data="16">十六、物料入库，入库单生成</div>
    <%--(17).	采购员追回发票；--%>
    <div id="purchaserRetrievesInvoice" class="item" style="margin-left:50px;" div_data="17">十七、采购员追回发票</div>
    <%--(18).	采购员打印整理相关表格、文档和票据，提交资料给会计--%>
    <div id="printOrganizeRelatedForms" class="item" style="margin-left:50px; " div_data="18">
        十八、采购员打印整理相关表格、文档和票据，提交资料给会计
    </div>

    <div style="clear:both">
        <div class="item" style="margin-left:50px;visibility: hidden "></div>
        <div class="item" style="margin-left:50px;visibility: hidden "></div>
        <%--(22).	采购流程结束--%>
        <div id="endProcurement" class="item" style="margin-left:50px;" div_data="22">二十二、采购流程结束</div>
        <%--(21).	关闭采购流程后，数据存档，不能再更改；--%>
        <div id="dataArchived" class="item" style="margin-left:50px;" div_data="21">二十一、关闭采购流程后，数据存档，不能再更改</div>
        <%--(20).	采购部长发布采购结论信息，关闭采购流程。--%>
        <div id="ministerProcurementReleasesInformation" class="item" style="margin-left:50px;" div_data="20">
            二十、采购部长发布采购结论信息，关闭采购流程
        </div>
        <%--19(19).	会计审核票据；--%>
        <div id="accountingAuditBill" class="item" style="margin-left:50px;" div_data="19">十九、会计审核票据</div>
        <%--连接线 的样式 --%>

        <%--用js 实现点击 div 出现  操作、修改或补充信息  --%>

        <script>
            $(".item").click(function () {
                var em = $(this).attr('div_data');
                console.log(em);
                alert(em)
            })
        </script>