<html>
<head>
    <link rel="stylesheet" href="./layui/css/layui.css" media="all">
    <style>
        body{
            margin: 250px auto;
        }
        .loginForm {
            text-align: center;
        }
    </style>
</head>
<body>
<%@include file="window.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="loginForm">
    <form class="layui-form" method="post" action="/login" >
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                    <input type="text" name="username" placeholder="用户名" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input type="text" name="password" placeholder="密码" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-input-block" >
            <input type="radio" name="role" value="0"
                   title="管理员">
            <input type="radio" name="role" value="1"
                   title="用户" checked>
        </div>
        <div class="layui-form-item">
            <button class="layui-btn" lay-submit="" >登录</button>
            <button type="button" class="layui-btn layui-btn-primary">注册</button>
        </div>
    </form>
</div>
<script src="./layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(`form`,function(){
        var form = layui.form, $ = layui.$;

        form.on('radio',function (data){
            if(data.value === 0){
                console.log("admin");
                <% request.getSession().setAttribute("role","admin"); %>
            }else {
                <% request.getSession().setAttribute("role","user");%>
            }
        })
    })
</script>
</body>
</html>
