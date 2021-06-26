<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--方法1的模态框--%>
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