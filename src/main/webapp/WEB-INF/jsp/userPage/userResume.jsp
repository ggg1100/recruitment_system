<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LonelyWolf
  Date: 2022/12/4
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>招聘信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/navigation.css">
    <meta charset="utf-8">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
</head>
<body>
<c:import url="../component/userBanner.jsp"/>
<div class="wrapper">
    <div class="sidebar">
        <div class="title">用户菜单</div>
        <ul class="nav">
            <li>
                <a href="/job">
                    <i class="glyphicon glyphicon-list-alt" aria-hidden="true"></i>
                    招聘信息
                </a>
            </li>
            <li>
                <a href="/application">
                    <i class="glyphicon glyphicon-user" aria-hidden="true"></i>
                    我的申请
                </a>
            </li>
            <li>
                <a class="active">
                    <i class="glyphicon glyphicon-tasks" aria-hidden="true"></i>
                    我的简历
                </a>
            </li>
            <li>
                <a href="/login">
                    <i class="glyphicon glyphicon-remove" aria-hidden="true"></i>
                    退出
                </a>
            </li>
        </ul>
    </div>
    <div class="content content-is-open">
        <div class="resume-body">
            <p class="resume-item">
                姓名：${resume.name}
            </p>
            <p class="resume-item">
                年龄：${resume.age}
            </p>
            <p class="resume-item">
                性别：${resume.sex eq 0 ? '女': '男'}
            </p>
            <p class="resume-item">
                民族：${resume.nation}
            </p>
            <p class="resume-item">
                专业：${resume.profession}
            </p>
            <p class="resume-item">
                求职意向：${resume.intention}
            </p>
            <p class="resume-item">
                毕业院校：${resume.school}
            </p>
            <p class="resume-item">
                手机号：${resume.phone}
            </p>
            <p class="resume-item">
                邮箱：${resume.email}
            </p>
            <p class="resume-item">
                技能：${resume.skill}
            </p>
            <p class="resume-item">
                奖项：${resume.award}
            </p>
            <p class="resume-item">
                社会实践：${resume.practice}
            </p>
            <p class="resume-item">
                自我描述：${resume.description}
            </p>
        </div>
        <div style="margin: 10px">
            <a href="/resume/edit">
                <button class="btn" style="color: white;background: #5bc0de;margin: auto">编辑资料</button>
            </a>
        </div>
    </div>
</div>
<c:import url="../component/staticFooter.jsp"/>
</body>
<style>
    .resume-body{
        color: black;
        font:15px arial,sans-serif;
    }
    .resume-item{
        margin: 10px;
    }
    p{
        text-align: left;
    }
</style>
</html>
