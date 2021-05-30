<%--
  Created by IntelliJ IDEA.
  User: DARKW
  Date: 2021/3/15
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cn.edu.niit.domain.Book" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="./layui/css/layui.css"  media="all">
</head>
<body>
<table class="layui-table" lay-skin="line">
    <thead>
    <tr>
        <th>书名</th>
        <th>作者</th>
        <th>分类</th>
        <th>描述</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="book" items="${sessionScope.books}" varStatus="status">
        <tr>
            <td>${book.name}</td>
            <td>${book.author}</td>
            <td>${book.sort}</td>
            <td class="wrap-td">
                <div class="wrap-div">${book.description}</div>
            </td>
            <td>
                <a class="layui-btn layui-btn-primary layui-btn"
                   lay-event="detail">查看</a>
                <a class="layui-btn layui-btn"
                   lay-event="edit">借阅</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div id="page" style="display: flex;justify-content: center"></div>
<script src="./layui/layui.js" charset="UTF-8"></script>
<script>
    layui.use(['laypage', 'layer'], function () {
            var laypage = layui.laypage
                ,layer = layui.layer;
            var $ = layui.$;
            var count = 0, page = 1, limit = 5;
            $(document).ready(function () {
                //进入页面先加载数据
                getContent(1, limit);
                //得到数量count后，渲染表格
                laypage.render({
                    elem: 'page',
                    count: count,
                    curr: page,
                    limits: [5, 10, 15, 20],
                    limit: limit,
                    layout: ['count', 'prev', 'page', 'next', 'limit'],
                    jump: function (obj, first) {
                        if (!first) {
                            getContent(obj.curr, obj.limit);
                            //更新当前页码和当前每页显示条数
                            page = obj.curr;
                            limit = obj.limit;
                        }
                    }
                });
            });

            function getContent(page, size) {
                $.ajax({
                    type: 'POST',
                    url: "/book/search",
                    async: false, //开启同步请求，为了保证先得到count再渲染表格
                    data: JSON.stringify({
                        pageNum: page,
                        pageSize: size
                    }),
                    contentType: "application/json;charset=utf-8",
                    success: function (data) {
                        $('#content').load(location.href + " #content");
                        //count从Servlet中得到
                        count = data;
                    }
                });
            }
        }
    );

</script>
</body>
</html>
