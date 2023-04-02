<%--
  Created by IntelliJ IDEA.
  User: AST
  Date: 2023/3/8
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录失败</title>
</head>
<body>
不存在<%=session.getAttribute("userName")%>的用户，用户登陆失败界面，用户名或密码错误，5秒钟后自动跳转
<%
    response.setHeader("Refresh", "5;URL=login.jsp");
%>
</body>
</html>
