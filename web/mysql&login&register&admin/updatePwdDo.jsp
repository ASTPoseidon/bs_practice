<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: AST
  Date: 2023/3/29
  Time: 19:47
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
    String pwd = request.getParameter("password");

    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/bs_login";
    String user = "root";
    String password = "guo2086443";
    Connection con = DriverManager.getConnection(url, user, password);

    String sql = "update login set Password = ? where userName = ?";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1, pwd);
    pstmt.setString(2, name);
    int flag = pstmt.executeUpdate();

    if (flag == 1) {
        session.setAttribute("name", name);
        response.sendRedirect("updatePwdSuccess.jsp");
    } else {
        session.setAttribute("name", name);
        response.sendRedirect("updatePwdFailed.jsp");
    }
%>
</body>
</html>
