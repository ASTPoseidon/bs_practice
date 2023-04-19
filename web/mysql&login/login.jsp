<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
            crossorigin="anonymous"></script>
</head>
<script>
    function cleartext() {
        document.getElementById("name").value = "";
        document.getElementById("pwd").value = "";
    }
</script>
<body>
<div class="w-25 p-3" style="position: absolute;left: 20%;top: 20%">
    <div class="shadow-lg p-3 mb-5 bg-white rounded">
        <form action="loginDo.jsp" method="post" name="fm">
            <label>用户名</label>
            <input class="form-control" aria-describedby="nameHelp" type="text" name="name" id="name"
                   placeholder="默认为tom">
            <label>密码</label>
            <input class="form-control" aria-describedby="nameHelp" type="password" name="pwd" id="pwd"
                   placeholder="默认为123456">
            <br>
            <button type="submit" class="btn btn-primary">提交</button>
            <button type="button" class="btn btn-secondary" onclick="cleartext()">清空</button>
        </form>
    </div>
</div>
</body>
</html>
