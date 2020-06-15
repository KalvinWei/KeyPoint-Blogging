<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign up</title>
    <%@include file="shared/_libraries.jsp"%>
    <script src="./assets/js/validateUserName.js"></script>

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
            <div  id="takenName" class="d-none">This username is already taken!</div>
        </div>
        <div class="form-group was-validated">
            <label for="password">Password:</label>
            <input class="form-control" type="password" name="password" id="password" placeholder="password" required>
            <div class="invalid-feedback">* Please input your password</div>
        </div>
        <div class="form-group was-validated">
            <label for="repeatPassword">Repeat password:</label>
            <input class="form-control" type="password" name="password" id="repeatPassword" placeholder="password" required>
            <div class="invalid-feedback">* Please repeat your password</div>
        </div>
        <button type="submit" class="btn btn-dark btn-block">Sign Up</button>
        <hr />
        <a class="btn btn-block btn-info" href="./signInPage">Go to sign in</a>
        <a class="btn btn-block btn-info" href="./indexPage">Go to landing page</a>
    </form>
</div>
<script type="javascript">
    document.getElementById("userName").addEventListener("input", async () => {
        const userName = document.getElementById("userName").value;
        const result = await validateUserName(userName, null);
        if (!result) {
            document.getElementById("takenName").classList.remove("d-none");
            document.getElementsByClassName("btn btn-dark btn-block").disabled="true";
        } else {
            document.getElementById("takenName").classList.add("d-none");
            document.getElementsByClassName("btn btn-dark btn-block").disabled="false";

        }
    });
</script>

</body>
</html>
