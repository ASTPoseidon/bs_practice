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
  String name = session.getAttribute("userName").toString();
  String phone = request.getParameter("phone");
  String mail = request.getParameter("mail");

  Class.forName("com.mysql.jdbc.Driver");
  String url="jdbc:mysql://localhost:3306/bs_login";
  String user="root";
  String password="guo2086443";
  Connection con= DriverManager.getConnection(url,user,password);

  String sql="update login set Phone = ? , Mail = ?  where userName = ?";
  PreparedStatement pstmt=con.prepareStatement(sql);
  pstmt.setString(1,phone);
  pstmt.setString(2,mail);
  pstmt.setString(3,name);
  int flag=pstmt.executeUpdate();

  if(flag==1)
  {
    response.sendRedirect("updateSuccess.jsp");
  }
  else
  {
    response.sendRedirect("updateFailed.jsp");
  }
%>
</body>
</html>
