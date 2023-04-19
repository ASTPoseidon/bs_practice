<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
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

    Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://localhost:3306/bs_login";
    String user="root";
    String password="guo2086443";
    Connection con= DriverManager.getConnection(url,user,password);

    Statement stmt=con.createStatement();
    String sql="select * from login";
    ResultSet rs=stmt.executeQuery(sql);
    int flag=0;

    //连接sql
    while(rs.next())
    {
        if(name.equals(rs.getString("userName"))&&pwd.equals(rs.getString("Password")))
        {
            flag=1;
            session.setAttribute("userName", name);
            String strNum = (String) application.getAttribute("count");
            int num = 0;
            if (strNum != null) {
                num = Integer.parseInt(strNum);
            }
            num++;
            application.setAttribute("count", String.valueOf(num));

            response.sendRedirect("welcome.jsp");
            break;
        }
    }

    if(flag==0)
    {
        session.setAttribute("userName", name);
        response.sendRedirect("error.jsp");
    }


//    未连接sql
//    if (name.equals("tom") && pwd.equals("123456")) {
//        session.setAttribute("userName", name);
//        String strNum = (String) application.getAttribute("count");
//        int num = 0;
//        if (strNum != null) {
//            num = Integer.parseInt(strNum);
//        }
//        num++;
//        application.setAttribute("count", String.valueOf(num));
//
//        response.sendRedirect("welcome.jsp");
//    } else {
//        session.setAttribute("userName", name);
//        response.sendRedirect("error.jsp");
//    }

%>
</body>
</html>
