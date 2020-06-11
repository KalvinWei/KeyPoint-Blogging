<%--
  Created by IntelliJ IDEA.
  User: yihao
  Date: 2020/6/11
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign in / Sign up</title>
</head>
<body>
<h1>KeyPoint</h1>
<p>Welcome to visit Key Point blogging network</p>
<p>already a user? please sign in</p>
<p>fresh in here? you can sign up for an account right now</p>

<div id="contentBox">
    <p><a>Sign In</a> / <a>Sign Up</a></p>

    <div id="signUp">
        <form style="display: none"  action="./editProfilePage" method="post">
            <input type="text" name="userName" placeholder="username">
            <label style="display:none;color:red;">* username has been taken</label>
            <input type="text" name="nickname" placeholder="nickname">
            <input type="password" name="password" placeholder="password">
            <input type="password" placeholder="confirm your password here">
            <label style="display:none;color:red;">* passwords don't match</label>
            <input type="submit" value="sign up">
        </form>
    </div>

</div>

</body>
</html>
