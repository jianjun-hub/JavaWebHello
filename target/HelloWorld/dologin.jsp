<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: DARKW
  Date: 2021/3/15
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String userName = request.getParameter("username");
    String password = request.getParameter("password");
//加载驱动
    Class.forName("com.mysql.cj.jdbc.Driver");
//获得连接实例
    try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?serverTimezone=UTC&characterEncoding=utf-8",
            "root",
            "123568")) {
        //预编译sql语句
        String sql = "select * from borrow_card where username = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, userName);
            //执行查询
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                //遍历results
                while (resultSet.next()) {
                    if (password.equals(resultSet.getString("password"))) {
                        //执行跳转
                        response.sendRedirect("./main.jsp");
                        session.setAttribute("userName",userName);
                    } else {
                        //返回首页
                        response.sendRedirect("./index.jsp");
                    }
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
</body>
</html>
