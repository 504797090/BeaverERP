<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
    $(".primaryTitle").text("客户")
    $(".secondaryTitle").text("->新建客户")
</script>
<script>
    $("#tradeId").empty();
    var data;
    var htmls = '<option value="0">请选择行业,如果没有请先设置</option>'; //全局变量
    $.ajax({
        url: "${pageContext.request.contextPath}/trade/getAllSecondIdTrade",
        dataType: "json",
        async: false,
        cache: false,
        traditional: true,
        success: function (data) {
            for (var x in data) {
                // var option =  $("<option></option>").attr("value", data[x].key).append(data[x].value );
                htmls += '<option value = "' + data[x].key + '">' + data[x].value + '</option>'
            }
            $("#tradeId").html(htmls);
        }
    });
</script>

<a class="btn btn-info" target="_blank" href="${pageContext.request.contextPath}/trade/trade-manage">行业管理</a>

<div class="container">
    <div class="row">
        <div class="col-md-12 ">
            <form class="form-horizontal" method="post"  id="customerForm"
                  action="##">
                <!-- 表单区域-->
                <fieldset>
                    <!--表单主题-->
                    <%--<legend>用户注册</legend>--%>
                    <!-- 每一个form-group都可以自定义布局-->
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="companyName">客户名称</label>
                        <div class="col-md-4">
                            <input class="form-control" id="companyName" name="companyName" type="text"    placeholder="请输入客户名称"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="tradeId">选择行业</label>
                        <div class="col-md-4">
                            <select name="tradeId" class="form-control" id="tradeId"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <!-- label表示文字提示标签,可以通过表单的组建的id提示-->
                        <label class="col-md-2 control-label" for="companyAttributes">客户属性</label>
                        <div class="col-md-4">
                            <select name="companyAttributes" id="companyAttributes" class="form-control">
                                <option value="">请选择客户属性</option>
                                <option value="国营企业">国营企业</option>
                                <option value="上市公司">上市公司</option>
                                <option value="特殊公司">特殊企业</option>
                                <option value="民营企业">民营企业</option>
                                <option value="政府机关">政府机关</option>
                                <option value="高等学校">高等学校</option>
                                <option value="其他机构">其他机构</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-2 control-label" for="companyAddress">地址</label>
                        <div class="col-md-4">
                            <input class="form-control" name="companyAddress" id="companyAddress" type="text"
                                   placeholder="请输入地址"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="companyResponsible">负责人</label>
                        <div class="col-md-4">
                            <input class="form-control" name="companyResponsible" id="companyResponsible" type="text"
                                   placeholder="请输入负责人"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="responsiblePhone">负责人电话</label>
                        <div class="col-md-4">
                            <input class="form-control" name="responsiblePhone" id="responsiblePhone" type="text"
                                   placeholder="请输入负责人电话"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="responsibleWechat">负责人微信号</label>
                        <div class="col-md-4">
                            <input class="form-control" name="responsibleWechat" id="responsibleWechat" type="text"
                                   placeholder="请输入负责人微信号"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="responsibleMail">负责人电子邮件</label>
                        <div class="col-md-4">
                            <input class="form-control" name="responsibleMail" id="responsibleMail" type="text"
                                   placeholder="请输入负责人电子邮件"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="linkmanName">联系人</label>
                        <div class="col-md-4">
                            <input class="form-control" name="linkmanName" id="linkmanName" type="text"
                                   placeholder="请输入联系人姓名"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="linkmanPhone">联系人电话</label>
                        <div class="col-md-4">
                            <input class="form-control" name="linkmanPhone" id="linkmanPhone" type="text"
                                   placeholder="请输入联系人电话"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="linkmanWechat">联系人微信号</label>
                        <div class="col-md-4">
                            <input class="form-control" name="linkmanWechat" id="linkmanWechat" type="text"
                                   placeholder="请输入联系人微信号"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="linkmanMail">联系人电子邮件</label>
                        <div class="col-md-4">
                            <input class="form-control" name="linkmanMail" id="linkmanMail" type="text"
                                   placeholder="请输入联系人电子邮件"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="operatorName">操作人</label>
                        <div class="col-md-4">
                            <input class="form-control" name="operatorName" id="operatorName" type="text"
                                   placeholder="请输入操作人姓名"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="operatorPhone">操作人电话</label>
                        <div class="col-md-4">
                            <input class="form-control" name="operatorPhone" id="operatorPhone" type="text"
                                   placeholder="请输入操作人电话"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="operatorWechat">操作人微信号</label>
                        <div class="col-md-4">
                            <input class="form-control" name="operatorWechat" id="operatorWechat" type="text"
                                   placeholder="请输入操作人微信号"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="operatorMail">操作人电子邮件</label>
                        <div class="col-md-4">
                            <input class="form-control" name="operatorMail" id="operatorMail" type="text"
                                   placeholder="请输入操作人电子邮件"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                            <input class="btn btn-primary" type="button" value="提交"  onclick="ajaxSubmit()"/>
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
function ajaxSubmit() {
    $.ajax({
        url:"${pageContext.request.contextPath}/customer/addOneCustomer",
        type: "POST",
        dataType: "json",
        data: $('#customerForm').serialize(),
        success: function (result) {
            if(result==1){
                var r=confirm("添加成功，是否继续添加");
                if (r==true){

                    $(':input','#customerForm')
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







