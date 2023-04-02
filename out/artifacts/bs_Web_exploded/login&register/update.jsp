<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: AST
  Date: 2023/3/30
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户信息</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
            crossorigin="anonymous"></script>
</head>
<body>
    <%
        String name;
        if(request.getParameter("userName")!=null)
            name=request.getParameter("userName");
        else
            name=session.getAttribute("userName").toString();
    %>
    <div class="w-25 p-3" style="position: absolute;left: 20%;top: 20%">
        <div class="shadow-lg p-3 mb-5 bg-white rounded">
            <form action="updateDo.jsp" method="post" name="fm">
                    <h2 style="text-align: center">修改用户信息</h2>
                    <br>
                    <tr>
                        <td>用户名：</td>
                        <td><%=name%></td>
                    </tr>
                    <br>
                    <br>
                    <tr>
                        <td>联系电话：</td>
                        <td><input class="form-control" type="text" name="phone"></td>
                        <small class="form-text text-muted">
                            <%
                                String phone = request.getParameter("phone");
                                String mail = request.getParameter("mail");

                                Class.forName("com.mysql.jdbc.Driver");
                                String url="jdbc:mysql://localhost:3306/bs_login";
                                String user="root";
                                String password="guo2086443";
                                Connection con= DriverManager.getConnection(url,user,password);

                                String sql="select phone from login where userName = ?";
                                PreparedStatement pstmt=con.prepareStatement(sql);
                                pstmt.setString(1,name);

                                ResultSet rs=pstmt.executeQuery();
                                rs.next();
                                out.print("您当前的联系电话为："+rs.getString(1));
                            %>
                        </small>
                    </tr>
                    <br>
                    <tr>
                        <td>电子邮箱：</td>
                        <td><input class="form-control" type="text" name="mail"></td>
                        <small class="form-text text-muted">
                            <%
                                sql="select mail from login where userName = ?";
                                pstmt=con.prepareStatement(sql);
                                pstmt.setString(1,name);

                                rs=pstmt.executeQuery();
                                rs.next();
                                out.print("您当前的电子邮箱为："+rs.getString(1));
                            %>
                        </small>
                    </tr>
                    <br>
                    <td>
                        <input class="btn btn-primary" type="submit" value="确定修改">
                        <input class="btn btn-secondary" type="reset" value="重置">
                    </td>
            </form>
        </div>
    </div>
<%
    session.setAttribute("userName",name);
%>
</body>
</html>
