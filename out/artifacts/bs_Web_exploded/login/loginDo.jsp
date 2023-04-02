<%--
  Created by IntelliJ IDEA.
  User: AST
  Date: 2023/3/8
  Time: 18:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String name = request.getParameter("name");
    String pwd = request.getParameter("pwd");

    if (name.equals("tom") && pwd.equals("123456")) {
        session.setAttribute("userName", name);
        String strNum = (String) application.getAttribute("count");
        int num = 0;
        if (strNum != null) {
            num = Integer.parseInt(strNum);
        }
        num++;
        application.setAttribute("count", String.valueOf(num));

        response.sendRedirect("welcome.jsp");
    } else {
        session.setAttribute("userName", name);
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
