<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>采购任务</title>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jQuery.Form.js"></script>
    <script src="${pageContext.request.contextPath}/static/multiselect-master/dist/js/multiselect.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/select2-develop/dist/js/select2.min.js"></script>
    <script src="https://unpkg.com/bootstrap-table@1.13.4/dist/extensions/select2-filter/bootstrap-table-select2-filter.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/songyz-xlsx-master/xlsx.js"></script>

    <script src="${pageContext.request.contextPath}/static/dist/js/adminlte.min.js"></script>
    <%--曲线--%>
    <script src="https://cdn.jsdelivr.net/npm/jsplumb@2.8.0/dist/js/jsplumb.min.js"></script>
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
            border-radius: 5%;
        }
    </style>
    <style>
        #tipDiv {
            width: 150px;
            height: 100px;
            background-color: papayawhip;
            border-color: wheat;
        }
    </style>

</head>
<body>
<div class="container">
    <div class="page-header">
        <h1>项目采购
            <small>任务建立</small>
        </h1>
    </div>
    <%@ include file="task-details/detail-html1.jsp"%>
    <%--添加的模态框--%>
    <%--1 (1).	采购任务建立--%>
    <div id="taskCreation" class="item " div_data="1">一、采购任务建立</div>
    <%--2 (2).	采购任务审核--%>
    <div id="taskReview" class="item danger" div_data="2">二、采购任务审核</div>
    <%--3 (3).	采购员指派--%>
    <div id="designate" class="item bg-danger" div_data="3">三、采购员指派</div>
    <%--4 (4).	采购信息整理提交--%>
    <div id="arrangeTosSubmit" class="item" style="margin-left:50px;" div_data="4">四、采购信息整理提交</div>
    <%--5 (5).	供应商、价格、货期等采购信息审核--%>
    <div id="auditOtherPurchasingInformation " class="item" style="margin-left:50px;" div_data="5">五、供应商、价格、货期等采购信息审核
    </div>
    <%--6 (6).	采购申请单生成；--%>
    <div id="applicationGeneration" class="item" style="margin-left:50px;" div_data="6">六、采购申请单生成</div>
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
    <div style="clear:both"></div>
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
    <div style="clear:both"></div>
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

    <%--这个div是弹出提示框的样式--%>
    <div id="tipDiv" style="display: none">
        <span style="float: right"  class=" fa fa-close" id="tipDivClose"></span>
        <div style="text-align: center;margin-top: 10px">
        <button class="btn btn-default sm" style="margin-bottom: 10px" id="operation">操作</button>
        <button class="btn btn-default sm">修改、补充信息</button>
        </div>
    </div>
    <%--调试，连接线的功能--%>

    <script>
        var common = {
            isSource: false, //是否可以拖动
            isTarget: false,   //是否可以放置（连线终点）
            // connector: ['Bezier'],
            // paintStyle: { stroke: '#d71345', strokeWidth: 3 },//空的锚点风格
            // endpointStyle: { fill: '#d71345', outlineStroke: 'darkgray', outlineWidth: 2 }
            connector: ['Straight'],    //好像 Straight 是 直线
            cornerRadius: 1,
            // Anchor:["Left","Right"],
            endpointStyle: {fill: '#d71345', outlineStroke: '#d71345', outlineWidth: 0.5, width: 2, height: 2}, //圆点的颜色
            paintStyle: {stroke: '#d71345', strokeWidth: 5, radius: 1},  //stroke设置颜色  strokeWidth: 设置 线条颜色样式
            overlays: [['Arrow', {width: 20, length: 20, location: 0.9}]]  // overlays箭头 location 箭头出现的位置
        }
        jsPlumb.connect({
            source: 'taskCreation',
            target: 'taskReview',
        }, common)
    </script>
    <%--用js 实现点击 div 出现  操作、修改或补充信息  --%>

    <script>
        var em = 0;
        <%--js 代码写在这里好了--%>
        $(".item").click(function () {
            em = $(this).attr('div_data');
            console.log(em)
            var tt = $(this);
            $("#tipDiv").css({position: "absolute", 'z-index': 80, left: tt.offset().left, top: tt.offset().top + 25});
            $("#tipDiv").show()
        })
        $("#tipDivClose").click(function () {
            $("#tipDiv").hide()
        })
        $("#operation").click(function () {
            alert("进入这个方法")
            alert(em)
            switch (em) {
                case "1":
                 one()
                    break;
                case 2:

                    break;
                case 3:

                    break;
                case 4:

                    break;
                case 5:

                    break;
                case 6:

                    break;
                case 7:

                    break;
                case 8:

                    break;
                case 9:

                    break;
                case 10:
                    break;
                case 11:

                    break;
                case 12:

                    break;
                case 13:

                    break;
                case 14:

                    break;

                case 15:

                    break;

                case 16:

                    break;

                case 17:

                    break;

                case 18:

                    break;

                case 19:

                    break;

                case 20:

                    break;

                case 21:

                    break;

                case 22:

                    break;

            }

        })
    </script>




    <%@ include file="task-details/detail-js1.jsp"%>
</div>
</body>
</html>
