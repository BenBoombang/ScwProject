<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/31
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
        table tbody tr:nth-child(odd){background:#F4F4F4;}
        table tbody td:nth-child(even){color:#C00;}
    </style>
</head>

<body>

<%pageContext.setAttribute("navInfo","角色维护");%>

<%@include file="/WEB-INF/includePage/nav-bar.jsp"%>

<div class="container-fluid">
    <div class="row">

        <%@include file="/WEB-INF/includePage/menu.jsp"%>


        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
                </div>
                <div class="panel-body">
                    <form class="form-inline" role="form" style="float:left;">
                        <div class="form-group has-feedback">
                            <div class="input-group">
                                <div class="input-group-addon">查询条件</div>
                                <input class="form-control has-success" type="text" placeholder="请输入查询条件">
                            </div>
                        </div>
                        <button type="button" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>
                    </form>
                    <button type="button" class="btn btn-danger" style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i> 删除</button>
                    <button type="button" class="btn btn-primary" style="float:right;" onclick="window.location.href='form.html'"><i class="glyphicon glyphicon-plus"></i> 新增</button>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <table class="table  table-bordered">
                            <thead>
                            <tr >
                                <th width="30">#</th>
                                <th width="30"><input type="checkbox"></th>
                                <th>名称</th>
                                <th width="100">操作</th>
                            </tr>
                            </thead>
                            <tbody id="roleData">

                            </tbody>
                            <tfoot>
                            <tr >
                                <td colspan="6" align="center">
                                    <ul class="pagination">

                                    </ul>
                                </td>
                            </tr>

                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/jquery/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/script/docs.min.js"></script>
<script src="${pageContext.request.contextPath}/plugin/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/plugin/jqPg/jqPaginator.js"></script>
<script type="text/javascript">
    $(function () {
        $(".list-group-item").click(function(){
            if ( $(this).find("ul") ) {
                $(this).toggleClass("tree-closed");
                if ( $(this).hasClass("tree-closed") ) {
                    $("ul", this).hide("fast");
                } else {
                    $("ul", this).show("fast");
                }
            }
        });

        queryRoles(1);

        $("a[href='${pageContext.request.contextPath}/permission/role/toRoleMain']").css("color","red");

        $("a[href='${pageContext.request.contextPath}/permission/role/toRoleMain']").parents("li.list-group-item").removeClass("tree-closed");

        $("a[href='${pageContext.request.contextPath}/permission/role/toRoleMain']").parent().parent("ul").show(100);

    });

    $("tbody .btn-success").click(function(){
        window.location.href = "assignPermission.html";
    });

    // 创建分页查询方法
    function queryRoles(pageno) {
        var roleLoading = null;

        var ajaxData = {
            "pageno" : pageno,
            "pagesize" : 5
        };

        var roleContent = "";

        $.ajax({
            type : "post",
            url : "${pageContext.request.contextPath}/permission/role/queryAll",
            data : ajaxData,
            beforeSend : function () {
                roleLoading = layer.msg("数据加载中", {icon: 16});
            },
            success : function (result) {
                layer.close(roleLoading);

                if (result.succ) {

                    var info = result.data;

                    $.each(info.list,function (i,role) {

                        roleContent += '<tr>';
                        roleContent += '<td>'+ (i + 1) +'</td>';
                        roleContent += '<td><input type="checkbox" value="'+ role.id +'"></td>';
                        roleContent += '<td>'+ role.name +'</td>';
                        roleContent += '<td>';
                        roleContent += '    <button type="button" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>';
                        roleContent += '    <button type="button" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>';
                        roleContent += '    <button type="button" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>';
                        roleContent += '</td>';
                        roleContent += '</tr>';

                    });

                    $.jqPaginator('.pagination', {
                        // totalPages: 100, //设置分页的总页数
                        totalCounts: info.total, //设置分页的总条目数
                        pageSize: info.pageSize,
                        visiblePages: 5, //设置最多显示的页码数（例如有100也，当前第1页，则显示1 - 7页）
                        currentPage: info.pageNum,//当前页
                        first: '<li class="first"><a href="javascript:;">首页</a></li>',
                        prev: '<li class="prev"><a href="javascript:;"><i class="arrow arrow2"></i>上一页</a></li>',
                        next: '<li class="next"><a href="javascript:;">下一页<i class="arrow arrow3"></i></a></li>',
                        last: '<li class="last"><a href="javascript:;">末页</a></li>',
                        page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
                        onPageChange: function (num, type) {
                            //页面变化回调函数
                            if (type == "change") {
                                queryRoles(num);//当前页码
                            }
                        }
                    });


                    $("#roleData").html(roleContent);
                }else {
                    layer.msg("没有相关数据", {time:2000, icon:2}, function () {
                        //
                    });
                }
            }
        })
    }
</script>
</body>
</html>

