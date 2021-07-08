<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
    $(".primaryTitle").text("产品")
    $(".secondaryTitle").text("->新建产品")
</script>


<a class="btn btn-info" target="_blank" href="${pageContext.request.contextPath}/product/ops-product">维护产品类型</a>


<script>
    $("#cId").empty();
    var data;
    var htmls = '<option value="0">请选择客户</option>'; //全局变量
    $.ajax({
        url:"${pageContext.request.contextPath}/customer/allIdCustomer",
        dataType: "json",
        async: false,
        cache: false,
        traditional: true,
        success: function (data) {
            for (var x in data) {
                htmls += '<option value = "' + data[x].key + '">' + data[x].value + '</option>'
            }
            $("#cId").html(htmls);
        }
    });
</script>

<div class="container">
    <div class="row">
        <div class="col-md-12 ">
            <form class="form-horizontal" method="post"  id="productForm"
                  action="##">
                <!-- 表单区域-->
                <fieldset>
                    <!--表单主题-->
                    <%--<legend>用户注册</legend>--%>
                    <!-- 每一个form-group都可以自定义布局-->
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="cId">选择客户</label>
                        <div class="col-md-4">
                            <select name="cId" class="form-control" id="cId">
                                <option value="">请选择客户</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-2 control-label" for="countryCode">国家代码</label>
                        <div class="col-md-4">
                            <input class="form-control" name="countryCode" id="countryCode" type="text"
                                   placeholder="请输入国家代码"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="postalCode">邮政编码</label>
                        <div class="col-md-4">
                            <input class="form-control" name="postalCode" id="postalCode" type="text"
                                   placeholder="请输入邮政编码"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="postalCode">产品序号</label>
                        <div class="col-md-4">
                            <input class="form-control" name="productSerialNumber" id="productSerialNumber" type="text"
                                   placeholder="请输入产品序号"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <%--productType 产品类型  --%>
                        <label class="col-md-2 control-label" for="">产品类型</label>
                        <div class="col-md-4">
                            <input type="hidden" name="productType"  id="productTypeHidden">
                            <table  id="productType"></table>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="state">状态</label>
                        <div class="col-md-4">
                            <select name="state" id="state" class="form-control" >
                                <option value="">请选择产品状态</option>
                                <option value="设计">设计</option>
                                <option value="投产">投产</option>
                                <option value="安装">安装</option>
                                <option value="调试">调试</option>
                                <option value="待验收">待验收</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                            <input class="btn btn-primary" type="button" value="提交"  onclick="productAjaxSubmit()"/>
                            <input class="btn btn-warning" type="reset" value="重置"/>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
    <div>
    </div>
</div>

<script>
    $('#productType').bootstrapTable({
        class: 'table table-hover table-bordered',
        url: '${pageContext.request.contextPath}/customer/returnTreeFramework',
        contentType: 'application/x-www-form-urlencoded; charset=utf-8',
        // data: data,
        sidePagination: 'server',
        pagination: false,
        treeView: true,
        height:300,
        treeId: "id",
        singleSelect : true,
        treeField: "name",
        clickToSelect: true,                //是否启用点击选中行
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
                {
                checkbox:true
            },
            {
                field: 'name',
                title: '名称',
            },
            {
                field: 'description',
                title: '组件详细信息',
            },

        ]
    });

function productAjaxSubmit() {
    var a= $('#productType').bootstrapTable('getSelections');
    // console.log(a)
    $("#productTypeHidden").val(a[0].number)
// console.log(a[0].number)

    $.ajax({
        url:"${pageContext.request.contextPath}/product/addOneProduct",
        type: "POST",
        dataType: "json",
        data: $('#productForm').serialize(),
        success: function (result) {
            if(result==1){
                var r=confirm("添加成功，是否继续添加");
                if (r==true){
                    $(':input','#productForm')
                        .not(':button, :submit, :reset, :hidden')
                        .val('')
                        .removeAttr('checked')
                        .removeAttr('selected');
                }
                else{
                    toRealPage('${pageContext.request.contextPath}/customer/customer-index');
                }
            }else{
                alert("添加失败")
            }
        },
    })


}

</script>
