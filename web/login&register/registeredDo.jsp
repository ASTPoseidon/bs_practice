<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: AST
  Date: 2023/3/29
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script>
    function Failed()
    {
        confirm("此用户名已存在！");
    }
</script>
<body>
    <%
        String name = request.getParameter("name");
        String pwd = request.getParameter("password");
        String phone = request.getParameter("phone");
        String mail = request.getParameter("mail");

        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/bs_login";
        String user="root";
        String password="guo2086443";
        Connection con= DriverManager.getConnection(url,user,password);

        String sql="select * from login where userName = ?";
        PreparedStatement pstmt=con.prepareStatement(sql);
        pstmt.setString(1,name);
        ResultSet rs=pstmt.executeQuery();
        int flag=-1;

        if(rs.next())
        {
            flag++;
        }
        else
        {
            String tmp="select max(userId) maxId from login";
            Statement stmt=con.createStatement();
            ResultSet tmprs=stmt.executeQuery(tmp);
            tmprs.next();
            int maxid=tmprs.getInt("maxId")+1;
            sql="insert into login (userId,userName,Password,Phone,Mail) value (?,?,?,?,?)";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1,maxid);
            pstmt.setString(2,name);
            pstmt.setString(3,pwd);
            pstmt.setString(4,phone);
            pstmt.setString(5,mail);
            flag=pstmt.executeUpdate();
        }

        if(flag==0)
        {
            session.setAttribute("name",name);
            response.sendRedirect("registeredFailed.jsp");
        }
        if(flag==1)
        {
            session.setAttribute("name",name);
            response.sendRedirect("registeredSuccess.jsp");
        }
    %>
</body>
</html>