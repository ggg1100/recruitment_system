<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2022/11/29
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>管理员登录页</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/static/css/common.css">
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/static/css/myCssForAdminLogin.css">
    <meta charset="utf-8">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
</head>
<body>
<div class="form">
    <form method="post" action="<c:url value="/admin/login.do"/>">
        <div style="width: 100%;height: 50px;line-height: 50px;text-align: center;font-size: 40px">管理员登录页</div>
        <h4 style="color:red;">${msg}</h4>
        <div class="mb-3">
            <label for="username" class="form-label">管理员邮箱</label>
            <input type="email" id="username" class="form-control" name="email" placeholder="管理者邮箱">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">管理员密码</label>
            <input type="password" id="password" class="form-control" name="password" placeholder="管理员密码">
        </div>
        <button type="submit" class="btn btn-primary">登录</button>
    </form>
</div>
<div class="bigLabel">
    <p>翱翔招聘平台</p>
</div>

</body>
</html>

