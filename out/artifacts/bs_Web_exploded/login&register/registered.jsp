<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  <meta charset="UTF-8">
  <title>新用户注册</title>
</head>
<body>
<div class="w-25 p-3" style="position: absolute;left: 20%;top: 20%">
  <div class="shadow-lg p-3 mb-5 bg-white rounded">
    <form class="form-group" action="registeredDo.jsp" method="post" name="fm">
      <table cellspacing="100px">
        <h2 style="text-align: center">新用户注册</h2>
        <tr>
          <td>请输入用户名:</td>
          <td><input class="form-control" type="text" name=name autofocus="autofocus"></td>
        </tr>
        <tr>
          <td>请输入密码:</td>
          <td><input class="form-control" type="password" name=password></td>
        </tr>
        <tr>
          <td>请输入确认密码:</td>
          <td><input class="form-control" type="password" name=refill></td>
        </tr>
        <tr>
          <td>请输入联系电话:</td>
          <td><input class="form-control" type="text" name=phone></td>
        </tr>
        <tr>
          <td>请输入电子邮箱:</td>
          <td><input class="form-control" type="text" name=mail></td>
        </tr>
        <br>
      </table>
      <div style="text-align: center">
        <br>
        <input class="btn btn-primary" type="button" name=register value="注册" onclick="run()">
        <input class="btn btn-secondary" type="reset" name=refill value="重填">
      </div>
    </form>
  </div>
</div>

<script>
  function run()
  {
    const pwd=document.getElementsByName("password")[0].value;
    const pwdd=document.getElementsByName("refill")[0].value;
    if(pwd!=pwdd)
    {
      alert("两次输入的密码不同！")
      document.fm.reset();
    }
    else
    {
      document.fm.submit();
    }
  }
</script>

</body>
</html>