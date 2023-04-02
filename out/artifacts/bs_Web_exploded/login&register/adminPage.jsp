<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: AST
  Date: 2023/4/1
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <style>
        .jumbotron {
            padding: 1rem 1rem;
            margin-bottom: 2rem;
            background-color: #e9ecef;
            border-radius: 0.3rem;
        }
    </style>
</head>
<body>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-4">欢迎管理员<%=session.getAttribute("userName")%>登录！</h1>
            <p class="lead">您可以在此对其它用户做出更改。</p>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col col-lg-2">
                <div class="list-group">
                    <a href="#list-updateAdmin" class="list-group-item list-group-item-action active" id="list-updateAdmin-list" data-toggle="list" role="tab" aria-controls="updateAdmin">用户概览</a>
                    <a href="#list-update" class="list-group-item list-group-item-action" id="list-update-list" data-toggle="list" role="tab" aria-controls="update">修改用户信息</a>
                    <a href="#" class="list-group-item list-group-item-action">修改密码</a>
                    <a class="list-group-item list-group-item-action">退出登录</a>
                </div>
            </div>
            <div class="col">
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="list-updateAdmin" role="tabpanel" aria-labelledby="list-updateAdmin-list">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">用户ID</th>
                                <th scope="col">用户名</th>
                                <th scope="col">联系电话</th>
                                <th scope="col">电子邮箱</th>
                                <th scope="col">管理员权限</th>
                                <th scope="col" style="position: relative;left: 60px">#</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                String url="jdbc:mysql://localhost:3306/bs_login";
                                String user="root";
                                String password="guo2086443";
                                Connection con= DriverManager.getConnection(url,user,password);

                                Statement stmt=con.createStatement();
                                String sql="select * from login";
                                ResultSet rs=stmt.executeQuery(sql);

                                if(!rs.next())
                                    out.print("数据库无内容！");
                                else
                                {
                                    int cb_index=-1;
                                    do
                                    {
                                        cb_index++;
                                        String status=rs.getInt("ifAdmin")==1?"true":"False";
                                        String str=status=="true"?"checked=true":"";
                            %>          <tr>
                                            <th scope="row"><%=rs.getString("userID")%></th>
                                            <td><%=rs.getString("userName")%></td>
                                            <td><%=rs.getString("Phone")%></td>
                                            <td><%=rs.getString("Mail")%></td>
                                            <td style="position: relative;left: 35px"><input name="checkbox" type="checkbox" <%=str%> onclick=changeAdmin(<%=cb_index%>,"<%=rs.getString("userName")%>")> </td>
                                            <td><a href="update.jsp?userName=<%=rs.getString("userName")%>">修改信息</a> <a href="updatePwd.jsp?userName=<%=rs.getString("userName")%>">修改密码</a></td>
                                        </tr>
                            <%
                                    }while(rs.next());
                                }
                            %>
                        </table>
                    </div>
                    <div class="tab-pane fade show" id="list-update" role="tabpanel" aria-labelledby="list-update-list">

                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script>
        function changeAdmin(i,userName)
        {
            if(document.getElementsByName("checkbox")[i].checked)
            {
                window.location.href="changeAdmin.jsp?change=0&userName="+userName;
            }
            else
            {
                window.location.href="changeAdmin.jsp?change=1&userName="+userName;
            }
        }
    </script>
</body>
</html>
