<%--
  Created by IntelliJ IDEA.
  User: AST
  Date: 2023/3/30
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户信息失败</title>
</head>
<body>
    尊敬的<%=session.getAttribute("userName")%>，您的信息修改失败，<a href="update.jsp">点此跳转修改界面</a>
</body>
</html>
