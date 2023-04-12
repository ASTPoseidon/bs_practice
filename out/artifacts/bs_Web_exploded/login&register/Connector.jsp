<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: AST
  Date: 2023/3/15
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    public void close(ResultSet rs, Statement stmt, Connection con) {
        try {
            rs.close();
            stmt.close();
            con.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/bs_login";
    String user = "root";
    String password = "guo2086443";
    Connection con = DriverManager.getConnection(url, user, password);

    Statement stmt = con.createStatement();
    String sql = "select * from login";
    ResultSet rs = stmt.executeQuery(sql);
    if (!rs.next())
        out.print("数据库无内容！");
    else {
        out.print("一共有" + rs.getRow() + "行内容<br>");
        do {
            out.print("您的第一个字段内容为：" + rs.getString(1) + "，您的第二个字段内容为：" + rs.getString(2) + "<br>");
        } while (rs.next());
    }

    close(rs, stmt, con);
%>
</body>
</html>
