<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: AST
  Date: 2023/4/1
  Time: 23:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <%
    Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://localhost:3306/bs_login";
    String user="root";
    String password="guo2086443";
    Connection con= DriverManager.getConnection(url,user,password);

    String userName=request.getParameter("userName");
    int change=Integer.valueOf(request.getParameter("change"));
    if(change==1)
    {
      String sql="update login set ifAdmin = 0 where userName = ?";
      PreparedStatement pstmt =con.prepareStatement(sql);
      pstmt.setString(1,userName);
      int rs=pstmt.executeUpdate();
    }
    else
    {
      String sql="update login set ifAdmin = 1 where userName = ?";
      PreparedStatement pstmt =con.prepareStatement(sql);
      pstmt.setString(1,userName);
      int rs=pstmt.executeUpdate();
    }
    response.sendRedirect("adminPage.jsp");
  %>
</body>
</html>
