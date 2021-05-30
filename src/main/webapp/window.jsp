<%--
  Created by IntelliJ IDEA.
  User: DARKW
  Date: 2021/3/29
  Time: 8:23
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String message = request.getParameter("message");

    if (message != null && !message.equals("")) {
%>
<script src="./layui/layui.all.js"></script>
<script>
    layer.msg("<%=message%>");
</script>
<%
    }
%>
</body>

</html>

