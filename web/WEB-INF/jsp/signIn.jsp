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
    <title>Sign in</title>
    <%@include file="shared/libraries.jsp"%>
</head>
<body>
<div id="contentBox" class="m-auto container">
    <h2 class="m-auto text-center">Sign In</h2>
    <p class="m-auto text-center">Welcome to KeyPoint, please sign in :)</p>
        <form action="./signIn" method="post" class="m-auto was-validated">
            <div class="form-group">
                <label for="userName">Username:</label>
                <input class="form-control" type="text" name="userName" id="userName" placeholder="username" required>
                <div class="invalid-feedback">* Please input your username</div>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input class="form-control" type="password" name="password" id="password" placeholder="password" required>
                <div class="invalid-feedback">* Please input your password</div>
                <c:if test="${hasLogInfail}" >
                    <label class="text-danger">* login failed. wrong username or password.</label>
                </c:if>
            </div>
            <button type="submit" class="btn btn-dark btn-block">Sign In</button>
        </form>
</div>

</body>
</html>
