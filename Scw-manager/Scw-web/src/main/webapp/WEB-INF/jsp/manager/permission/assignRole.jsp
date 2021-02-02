<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/31
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/doc.min.css">
    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
    </style>
</head>

<body>

<%pageContext.setAttribute("navInfo","分配角色");%>

<%@include file="/WEB-INF/includePage/nav-bar.jsp"%>

<div class="container-fluid">
    <div class="row">

        <%@include file="/WEB-INF/includePage/menu.jsp"%>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li><a href="#">数据列表</a></li>
                <li class="active">分配角色</li>
            </ol>
            <div class="panel panel-default">
                <div class="panel-body">
                    <form id="roleForm" role="form" class="form-inline">

                        <%-- 创建一个隐藏域，用来存当前用户的用户ID --%>
                        <input type="hidden" name="hidUserId" value="${userid}">

                        <div class="form-group">
                            <label>未分配角色列表</label><br>
                            <select id="unAllotRoleList" name="unAllotRoleIds" class="form-control" multiple size="10" style="width:100px;overflow-y:auto;">

                                <c:forEach items="${unAllotRole}" var="unRole">
                                    <option value="${unRole.id}">${unRole.name}</option>
                                </c:forEach>

                            </select>
                        </div>
                        <div class="form-group">
                            <ul>
                                <li id="allotRole" class="btn btn-default glyphicon glyphicon-chevron-right"></li>
                                <br>
                                <li id="unAllotRole" class="btn btn-default glyphicon glyphicon-chevron-left" style="margin-top:20px;"></li>

                            </ul>
                        </div>

                        <div class="form-group" style="margin-left:40px;">
                            <label>已分配角色列表</label><br>
                            <select id="allotedRoleList" name="allotedRoleIds" class="form-control" multiple size="10" style="width:100px;overflow-y:auto;">

                                <c:forEach items="${userRoles}" var="role">
                                    <option value="${role.id}">${role.name}</option>
                                </c:forEach>

                            </select>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">帮助</h4>
            </div>
            <div class="modal-body">
                <div class="bs-callout bs-callout-info">
                    <h4>测试标题1</h4>
                    <p>测试内容1，测试内容1，测试内容1，测试内容1，测试内容1，测试内容1</p>
                </div>
                <div class="bs-callout bs-callout-info">
                    <h4>测试标题2</h4>
                    <p>测试内容2，测试内容2，测试内容2，测试内容2，测试内容2，测试内容2</p>
                </div>
            </div>
            <!--
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Save changes</button>
            </div>
            -->
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/jquery/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/script/docs.min.js"></script>
<script src="${pageContext.request.contextPath}/plugin/layer/layer.js"></script>
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

        // 分配角色
        $("#allotRole").click(function () {
            // 先判断左边的框有没有选中元素
            var unRoleList = $("#unAllotRoleList :selected");
            if (unRoleList.length == 0) {
                layer.msg("请至少选择一条数据", {time:2000, icon:2}, function () {
                    //
                });
            }else {

                $.ajax({
                   type : "post",
                   url : "${pageContext.request.contextPath}/permission/user/allotRoles",
                   data : $("#roleForm").serialize(),
                   success : function (result) {
                       if (result.succ) {
                           layer.msg("分配角色成功", {time:2000, icon:6}, function () {
                               //
                           });
                       }else {
                           layer.msg("分配角色失败", {time:2000, icon:5}, function () {
                               //
                           });
                       }
                   }
                });

                $("#allotedRoleList").append(unRoleList);
            }

        });


        // 取消角色
        $("#unAllotRole").click(function () {
            // 先判断右边的框有没有选中元素
            var roleList = $("#allotedRoleList :selected");
            if (roleList.length == 0) {
                layer.msg("请至少选择一条数据", {time:2000, icon:2}, function () {
                    //
                });
            }else {

                $.ajax({
                    type : "post",
                    url : "${pageContext.request.contextPath}/permission/user/unAllotRoles",
                    data : $("#roleForm").serialize(),
                    success : function (result) {
                        if (result.succ) {
                            layer.msg("取消角色成功", {time:2000, icon:6}, function () {
                                //
                            });
                        }else {
                            layer.msg("取消角色失败", {time:2000, icon:5}, function () {
                                //
                            });
                        }
                    }
                });

                $("#unAllotRoleList").append(roleList);
            }

        });


        $("a[href='${pageContext.request.contextPath}/permission/user/toUserMain']").css("color","red");

        $("a[href='${pageContext.request.contextPath}/permission/user/toUserMain']").parents("li.list-group-item").removeClass("tree-closed");

        $("a[href='${pageContext.request.contextPath}/permission/user/toUserMain']").parent().parent("ul").show(100);
    });
</script>
</body>
</html>

