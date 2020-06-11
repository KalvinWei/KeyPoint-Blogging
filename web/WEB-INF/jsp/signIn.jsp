<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kalvinwei
  Date: 9/06/20
  Time: 16:45
  To change this template use File | Settings | File Templates.

  --from MULTIPLE PAGES             [in order to redirect back to the previous page]
  lastPage
  # => lastPage (String)

  --from ~/signIn
  boolean hasLogInFail              [if true, show error msg]

  --from ~/checkUserName            [this value would be got through js code]
  boolean hasBeenTaken

  --to ~/signIn
  userName,password

  --to ~/checkUserName
  userName

  --to ~/signUp
  userName,password,nickname



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

    <div id="signIn">
        <form action="./signIn" method="post">
            <input type="text" name="userName" placeholder="username">
            <input type="password" name="password" placeholder="password">
            <c:if test="${!hasLogInfail}" >
                <label style="display: none; color:red">* login failed. wrong username or password.</label>
            </c:if>
            <input type="submit" value="sign in">
        </form>
    </div>

</div>

</body>
</html>
