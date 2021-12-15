<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

    <%-- 引入JQ和Bootstrap --%>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>学生管理页面 - 首页</title>
</head>

<body>
<div style="width:600px;height: 600px;position: absolute;left:50%;top:50%;margin-left:-300px;margin-top:-300px;">
    <h3 style="text-align: center">SSM整合实例 —— CRUD基本操作</h3>
    <div class="listDIV" >
        <table class="table table-striped table-bordered table-hover">
            <thead>
            <tr class="success">
                <th>学号</th>
                <th>姓名</th>
                <th>年龄</th>
                <th>性别</th>
                <th>出生日期</th>

                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${students}" var="s" varStatus="status">
                <tr>
                    <td>${s.student_id}</td>
                    <td>${s.name}</td>
                    <td>${s.age}</td>
                    <td>${s.sex}</td>
                    <td>${s.birthday}</td>
                        <%--修改学生信息--%>
                    <td><a href="/editStudent?id=${s.id}"><span class="glyphicon glyphicon-edit"></span> </a></td>
                        <%--删除学生信息--%>
                    <td><a href="/deleteStudent?id=${s.id}"><span class="glyphicon glyphicon-trash"></span> </a></td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>

    <nav class="pageDIV" style="text-align: center;">
        <ul class="pagination">
            <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
                <a href="?page.start=0">
                    <span>«</span>
                </a>
            </li>

            <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
                <a href="?page.start=${page.start-page.count}">
                    <span>‹</span>
                </a>
            </li>

            <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">

                <c:if test="${status.count*page.count-page.start<=30 && status.count*page.count-page.start>=-10}">
                    <li <c:if test="${status.index*page.count==page.start}">class="disabled"</c:if>>
                        <a
                                href="?page.start=${status.index*page.count}"
                                <c:if test="${status.index*page.count==page.start}">class="current"</c:if>
                        >${status.count}</a>
                    </li>
                </c:if>
            </c:forEach>

            <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
                <a href="?page.start=${page.start+page.count}">
                    <span>›</span>
                </a>
            </li>
            <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
                <a href="?page.start=${page.last}">
                    <span>»</span>
                </a>
            </li>
        </ul>
    </nav>

    <div class="addDIV" style="width: 300px;margin: 0 auto;">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">增加学生</h3>
            </div>
            <div class="panel-body">

                <form method="post" action="/addStudent" role="form">
                    <table class="addTable">
                        <tr>
                            <td>学号：</td>
                            <td><input type="text" name="student_id" id="student_id" placeholder="请在这里输入学号"></td>
                        </tr>
                        <tr>
                            <td>姓名：</td>
                            <td><input type="text" name="name" id="name" placeholder="请在这里输入名字"></td>
                        </tr>
                        <tr>
                            <td>年龄：</td>
                            <td><input type="text" name="age" id="age" placeholder="请在这里输入年龄"></td>
                        </tr>
                        <tr>
                            <td>性别：</td>
                            <td><input type="radio" class="radio radio-inline" name="sex" value="男"> 男
                                <input type="radio" class="radio radio-inline" name="sex" value="女"> 女
                            </td>
                        </tr>
                        <tr>
                            <td>出生日期：</td>
                            <td><input type="date" name="birthday" id="birthday" placeholder="请在这里输入出生日期"></td>
                        </tr>
                        <tr class="submitTR">
                            <td colspan="2" align="center">
                                <button type="submit" class="btn btn-success">提 交</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
