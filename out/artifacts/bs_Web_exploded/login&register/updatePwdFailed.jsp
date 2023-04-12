<%--
  Created by IntelliJ IDEA.
  User: AST
  Date: 2023/3/29
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户信息失败</title>
</head>
<body>
抱歉，不存在用户名为<%=session.getAttribute("name")%>的用户，请检查用户名后<a href="updatePwd.jsp">重试</a>！
</body>
</html>
