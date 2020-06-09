<%--
  Created by IntelliJ IDEA.
  User: kalvinwei
  Date: 9/06/20
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
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
    <form id="signIn" action="/signIn" method="post">
        <input type="text" name="username" placeholder="username">
        <input type="password" name="password" placeholder="password">
        <label style="display: none; color:red">* non-existent user or wrong password!</label>
        <input type="submit" value="sign in">
    </form>
    <form style="display: none" id="signUp" action="/editProfile" method="post">
        <input type="text" name="username" placeholder="username">
        <label style="display:none;color:red;">* username has been taken</label>
        <input type="text" name="nickname" placeholder="nickname">
        <input type="password" name="password" placeholder="password">
        <input type="password" name="pswConfirmation" placeholder="confirm your password here">
        <label style="display:none;color:red;">* passwords don't match</label>
        <input type="submit" value="sign up">
    </form>

</div>

</body>
</html>
