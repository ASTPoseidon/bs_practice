<%--
  Created by IntelliJ IDEA.
  User: AST
  Date: 2023/3/8
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆成功</title>
</head>
<body>
<p>用户登陆成功界面</p>
<p>欢迎登陆，<%=session.getAttribute("userName")%>!</p>
<a href="update.jsp" ">您可点此修改用户信息</a>
<%
    //session.setAttribute("name",session.getAttribute("userName"));
%>
</body>
</html>
