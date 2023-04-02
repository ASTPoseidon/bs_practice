<%--
  Created by IntelliJ IDEA.
  User: AST
  Date: 2023/3/29
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册失败</title>
</head>
<body>
    已包含用户名为<%=session.getAttribute("name")%>的用户信息，请检查用户名后<a href="registered.jsp">重试</a> ！
</body>
</html>
