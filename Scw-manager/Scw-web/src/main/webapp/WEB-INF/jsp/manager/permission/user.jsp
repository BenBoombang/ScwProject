<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/30
  Time: 11:52
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

<%pageContext.setAttribute("navInfo","用户维护");%>

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
                        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-search"></i> 过滤</button>
                    </form>
                    <button type="button" class="btn btn-danger" onclick="deleteUsers()" style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i> 删除</button>
                    <button type="button" class="btn btn-primary" style="float:right;" onclick="window.location.href='add.html'"><i class="glyphicon glyphicon-plus"></i> 新增</button>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <form id="userForm">
                            <table class="table  table-bordered">
                                <thead>
                                    <tr >
                                        <th width="30">#</th>
                                        <th width="30"><input type="checkbox" id="allSelBox"></th>
                                        <th>账号</th>
                                        <th>名称</th>
                                        <th>邮箱地址</th>
                                        <th width="100">操作</th>
                                    </tr>
                                </thead>
                                <tbody id="usersData">

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

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- 创建一个隐藏域 ，用来存放当前是第几页 --%>
    <input type="hidden" id="hiddenPageNo">


    <%-- 创建一个模态框 --%>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">查询条件</h4>
                </div>
                <div class="modal-body">
                    <table class="table table-striped table-bordered table-hover table-condensed table-responsive">
                        <tr>
                            <td>
                                <div class="input-group">
                                    <div class="input-group-addon">用户账户</div>
                                    <input type="text" class="form-control" name="loginacct" id="loginacct_input" placeholder="用户账户">
                                    <div class="input-group-addon"> <span class="glyphicon glyphicon-user"></span> </div>
                                </div>
                            </td>
                            <td>
                                <div class="input-group">
                                    <div class="input-group-addon">用户邮箱</div>
                                    <input type="text" class="form-control" name="email" id="email_input" placeholder="用户邮箱">
                                    <div class="input-group-addon"> <span class="glyphicon glyphicon-envelope"></span> </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button onclick="queryUsersByCondition(1)" type="button" data-dismiss="modal" class="btn btn-primary">Search</button>
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

        queryUsers(1);

        $("a[href='${pageContext.request.contextPath}/permission/user/toUserMain']").css("color","red");

        $("a[href='${pageContext.request.contextPath}/permission/user/toUserMain']").parents("li.list-group-item").removeClass("tree-closed");

        $("a[href='${pageContext.request.contextPath}/permission/user/toUserMain']").parent().parent("ul").show(100);

        $("#myModal").modal({
            backdrop : 'static',
            show : false
        });

        $("#allSelBox").click(function () {

            // 先获取当前这个复选框的选中状态
            var flag = this.checked;

            // 获取数据列表中的复选框情况
            // 中间必须空开一个空格
            $("#usersData :checkbox").each(function () {
                this.checked = flag;
            })
        })


    });
    // $("tbody .btn-success").click(function(){
    //     window.location.href = "assignRole.html";
    // });
    // $("tbody .btn-primary").click(function(){
    //     window.location.href = "edit.html";
    // });

    // 给用户分配角色
    function allotRole(userid) {
        window.location.href = "${pageContext.request.contextPath}/permission/user/toRolePage/" + userid;
    }


    // 删除单个用户
    function deleteUser(id, loginacct) {
        layer.confirm("是否确定删除【" + loginacct + "】这个用户",  {icon: 3, title:'提示'}, function(cindex){

            $.ajax({
                type : "post",
                url : "${pageContext.request.contextPath}/permission/user/deleteUser/" + id,
                success : function (result) {
                    if (result.succ) {
                        // 删除成功就再次查询一遍
                        queryUsers(1);
                    }else {
                        layer.msg("删除失败", {time:2000, icon:2}, function () {
                            //
                        });
                    }
                }
            });


            layer.close(cindex);
        }, function(cindex){
            layer.close(cindex);
        });
    }


    // 删除多个用户
    function deleteUsers() {
        // 首先要判断选择了多少个，如果一个都没选，是不能删除的
        var boxs = $("#usersData :checkbox");
        if (boxs.length == 0){
            layer.msg("请至少选择一条数据", {time:2000, icon:2}, function () {
                //
            });
            return false;
        }else {
            layer.confirm("是否确定删除所选数据",  {icon: 3, title:'提示'}, function(cindex){

                $.ajax({
                    type : "post",
                    url : "${pageContext.request.contextPath}/permission/user/deleteUsers",
                    data : $("#userForm").serialize(),
                    success : function (result) {
                        if (result.succ) {
                            // 删除成功就再次查询一遍
                            queryUsers(1);
                        }else {
                            layer.msg("删除失败", {time:2000, icon:2}, function () {
                                //
                            });
                        }
                    }
                });


                layer.close(cindex);
            }, function(cindex){
                layer.close(cindex);
            });
        }
    }


    // 创建异步分页查询方法
    function queryUsers(pageno) {
        var queryUsersLoading = null;

        if (pageno == "") {
            pageno = 1;
        }

        // 构建基础查询参数
        var ajaxData = {
          "pageno" : pageno,
          "pagesize" : 10
        };

        var dataContent = "";

        $.ajax({
            type : "post",
            url : "${pageContext.request.contextPath}/permission/user/queryAllUser",
            data : ajaxData,
            beforeSend : function () {
                queryUsersLoading = layer.msg("数据加载中", {icon: 16});
            },
            success : function (result) {
                layer.close(queryUsersLoading);

                if (result.succ){

                    var pageInfo = result.data;

                    var users = pageInfo.list;

                    $.each(users,function (i, user) {
                        dataContent += '<tr>';
                        dataContent += '<td>'+ (i + 1) +'</td>';
                        dataContent += '<td><input type="checkbox" name="userid" value="'+ user.id +'"></td>';
                        dataContent += '<td>'+ user.loginacct +'</td>';
                        dataContent += '<td>'+ user.username +'</td>';
                        dataContent += '<td>'+ user.email +'</td>';
                        dataContent += '<td>';
                        dataContent += '   <button type="button" onclick="allotRole('+ user.id +')" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>';
                        dataContent += '   <button type="button" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>';
                        dataContent += '   <button type="button" onclick="deleteUser('+ user.id +',\''+ user.loginacct+'\')" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>';
                        dataContent += '</td>';
                        dataContent += '</tr>';
                    });

                    $.jqPaginator('.pagination', {
                        // totalPages: 100, //设置分页的总页数
                        totalCounts: pageInfo.total, //设置分页的总条目数
                        pageSize: pageInfo.pageSize,
                        visiblePages: 5, //设置最多显示的页码数（例如有100也，当前第1页，则显示1 - 7页）
                        currentPage: pageInfo.pageNum,//当前页
                        first: '<li class="first"><a href="javascript:;">首页</a></li>',
                        prev: '<li class="prev"><a href="javascript:;"><i class="arrow arrow2"></i>上一页</a></li>',
                        next: '<li class="next"><a href="javascript:;">下一页<i class="arrow arrow3"></i></a></li>',
                        last: '<li class="last"><a href="javascript:;">末页</a></li>',
                        page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
                        onPageChange: function (num, type) {
                            //页面变化回调函数
                            if (type == "change") {
                                queryUsers(num);//当前页码
                            }
                        }
                    });

                    // 向隐藏域中设置当前是第几页
                    $("#hiddenPageNo").val(pageInfo.pageNum);


                    $("#usersData").html(dataContent);
                }else {
                    layer.msg("没有相关数据", {time:2000, icon:2}, function () {
                        //
                    });
                }
            }
        })
    }


    // 模态框异步查询
    function queryUsersByCondition(pageno) {
        var searchLoading = null;

        // 先获取模态框中的内容
        var acct = $("#loginacct_input").val();
        var email = $("#email_input").val();

        var ajaxData = {
            "pageno" : pageno,
            "pagesize" : 10
        };

        if (acct != "") {
            ajaxData.loginacct = acct;
        }

        if (email != "") {
            ajaxData.email = email;
        }

        var dataContent = "";

        $.ajax({
            type : "post",
            url : "${pageContext.request.contextPath}/permission/user/queryUsersByCondition",
            data : ajaxData,
            beforeSend : function () {
                searchLoading = layer.msg("数据加载中", {icon: 16});
            },
            success : function (result) {
                layer.close(searchLoading);

                if (result.succ) {

                    var pageInfo = result.data;

                    var users = pageInfo.list;

                    $.each(users,function (i, user) {
                        dataContent += '<tr>';
                        dataContent += '<td>'+ (i + 1) +'</td>';
                        dataContent += '<td><input type="checkbox" value="'+ user.id +'"></td>';
                        dataContent += '<td>'+ user.loginacct +'</td>';
                        dataContent += '<td>'+ user.username +'</td>';
                        dataContent += '<td>'+ user.email +'</td>';
                        dataContent += '<td>';
                        dataContent += '   <button type="button" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>';
                        dataContent += '   <button type="button" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>';
                        dataContent += '   <button type="button" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>';
                        dataContent += '</td>';
                        dataContent += '</tr>';
                    });

                    $.jqPaginator('.pagination', {
                        // totalPages: 100, //设置分页的总页数
                        totalCounts: pageInfo.total, //设置分页的总条目数
                        pageSize: pageInfo.pageSize,
                        visiblePages: 5, //设置最多显示的页码数（例如有100也，当前第1页，则显示1 - 7页）
                        currentPage: pageInfo.pageNum,//当前页
                        first: '<li class="first"><a href="javascript:;">首页</a></li>',
                        prev: '<li class="prev"><a href="javascript:;"><i class="arrow arrow2"></i>上一页</a></li>',
                        next: '<li class="next"><a href="javascript:;">下一页<i class="arrow arrow3"></i></a></li>',
                        last: '<li class="last"><a href="javascript:;">末页</a></li>',
                        page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
                        onPageChange: function (num, type) {
                            //页面变化回调函数
                            if (type == "change") {
                                queryUsersByCondition(num);//当前页码
                            }
                        }
                    });


                    $("#usersData").html(dataContent);

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

