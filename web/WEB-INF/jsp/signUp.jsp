<%--
  Created by IntelliJ IDEA.
  User: yihao
  Date: 2020/6/11
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign up</title>
    <%@include file="shared/libraries.jsp"%>
</head>
<body>
<div id="contentBox" class="m-auto container">
    <h2 class="m-auto text-center">Sign Up</h2>
    <p class="m-auto text-center">Welcome to KeyPoint, please sign up :)</p>
    <form action="./signUp" method="post" class="m-auto">
        <div class="form-group was-validated">
            <label for="userName">Username:</label>
            <input class="form-control" type="text" name="userName" id="userName" placeholder="username" required>
            <div class="invalid-feedback">* Please input your username</div>
        </div>
        <div class="form-group was-validated">
            <label for="password">Password:</label>
            <input class="form-control" type="password" name="password" id="password" placeholder="password" required>
            <div class="invalid-feedback">* Please input your password</div>
        </div>
        <div class="form-group">
            <label for="nickname">Nickname:</label>
            <input class="form-control" type="text" name="nickname" id="nickname" placeholder="nickname">
        </div>
        <button type="submit" class="btn btn-dark btn-block">Sign Up</button>
    </form>
</div>

</body>
</html>
