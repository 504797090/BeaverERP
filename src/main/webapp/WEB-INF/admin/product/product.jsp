<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
    $(".primaryTitle").text("产品")
    $(".secondaryTitle").text("")
</script>


<table id="product"></table>

<script>
    $('#product').bootstrapTable('destroy').bootstrapTable({
        url: "${pageContext.request.contextPath}/product/findAllProduct",
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
        columns: [
            // [
            //     {
            //         "title": "产品列表",
            //         "halign":"center",
            //         "align":"center",
            //         "colspan": 10
            //     }
            // ],
            [
                {
                    title: '序号',
                    "halign": "center",
                    "align": "center",
                    width: '15%',
                    formatter: function (value, row, index) {
                        return index + 1;
                    }
                },
                {  field: 'companyName',
                    "halign": "center",
                    "align": "center",
                    title: '公司名称',
                    width: '21%',
                    sortable: true,},
                {  field: 'companyAttributes',
                    "halign": "center",
                    "align": "center",
                    title: '公司属性',
                    width: '21%',
                    sortable: true,},
                {  field: 'companyAddress',
                    "halign": "center",
                    "align": "center",
                    title: '公司地址',
                    width: '21%',
                    sortable: true,},
                {  field: 'companyResponsible',
                    "halign": "center",
                    "align": "center",
                    title: '公司负责人',
                    width: '21%',
                    sortable: true,},
                {  field: 'responsiblePhone',
                    "halign": "center",
                    "align": "center",
                    title: '负责人电话',
                    width: '21%',
                    sortable: true,},
                {  field: 'linkmanName',
                    "halign": "center",
                    "align": "center",
                    title: '公司联系人',
                    width: '21%',
                    sortable: true,},
                {  field: 'linkmanPhone',
                    "halign": "center",
                    "align": "center",
                    title: '联系人电话',
                    width: '21%',
                    sortable: true,},
                {  field: 'operatorName',
                    "halign": "center",
                    "align": "center",
                    title: '操作人姓名',
                    width: '21%',
                    sortable: true,},
                {  field: 'operatorPhone',
                    "halign": "center",
                    "align": "center",
                    title: '操作人手机号',
                    width: '21%',
                    sortable: true,},

            ]
        ],

    });


</script>