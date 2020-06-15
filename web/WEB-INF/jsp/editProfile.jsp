<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Profile</title>
    <%@include file="shared/_libraries.jsp"%>
    <script src="./assets/js/validateUserName.js"></script>
</head>
<body>
<%@include file="shared/_navbar.jsp"%>

<div id="wrapper" class="container">
    <h3>${user.nickname}</h3>

    <form action="./saveProfile" method="post" enctype="multipart/form-data">

    <div id="leftBlock">
        <input id="id" type="hidden" name="id" value="${user.id}">
        <div class="form-group">
            <label for="userName">Username:</label>
            <input id="userName" type="text" name="userName" value="${user.userName}" placeholder="user name" class="form-control">
            <div id="takenName" class="d-none text-danger">* This username is already taken</div>
        </div>
        <div class="form-group">
            <label for="nickname">Nickname:</label>
            <input id="nickname" type="text" name="nickname" value="${user.nickname}" placeholder="nickname" class="form-control">
        </div>
        <div class="form-group">
            <label for="signature">Signature:</label>
            <input id="signature" type="text" name="signature" value="${user.signature}" placeholder="signature" class="form-control">
        </div>
        <div class="form-group">
            <label for="firstName">First name:</label>
            <input id="firstName" type="text" name="firstName" value="${user.firstName}" placeholder="first name" class="form-control">
        </div>
        <div class="form-group">
            <label for="lastName">Last name:</label>
            <input id="lastName" type="text" name="lastName" value="${user.lastName}" placeholder="last name" class="form-control">
        </div>
        <div class="form-group">
            <label for="dateOfBirth">Date of birth:</label>
            <input id="dateOfBirth" type="date" name="dateOfBirth" value="${user.dateOfBirth.toString()}" placeholder="date of birth" class="form-control">
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input id="email" type="email" name="email" value="${user.email}" placeholder="email" class="form-control">
        </div>
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea id="description" name="description" placeholder="description" class="form-control">${user.description}</textarea>
        </div>
    </div>

    <div id="rightBlock">
        <label for="defaultAvatarCustomer">
            <img src="./images/avatar/${user.avatar}">
        </label>
        <input type="radio" id="defaultAvatarCustomer" name="defaultAvatar" value="0">
        <input type="hidden" name="originalAvatar" value="${user.avatar}">
        <input type="file" name="avatar" accept="image/jpeg, image/png">
        <c:forEach var="avatar" items="${defaultAvatars}" varStatus="loop">
            <label for="defaultAvatar${loop.count}">
                <img src="./images/avatar/${avatar}">
            </label>
            <input type="radio" id="defaultAvatar${loop.count}" name="defaultAvatar" value="${avatar}">
        </c:forEach>
        <button onclick="useDefaultAvatar()">delete avatar</button>
    </div>

    <button type="submit" class="btn btn-dark btn-block" id="save">Save</button>

    </form>

    <form action="./deleteAccount" method="post">
        <input type="hidden" name="userName" value="${user.userName}">
        <button type="submit" class="btn btn-danger form-control">Delete account</button>
    </form>
</div>
<script>
    const avatarInputBox = document.querySelector("input[name='avatar']");
    const avatarDisplay = document.querySelector("img.avatar");

    avatarInputBox.onchange = function () {
        const imgFile = avatarInputBox.file[0];
        const reader = new FileReader();

        reader.onload = function(e) {
            avatarDisplay.src = e.target.result;
        };
        reader.readAsDataURL(imgFile);
    };

    function useDefaultAvatar(){
        avatarDisplay.src = "./images/avatar/guest.jpg";
        avatarInputBox.value = avatarDisplay.src;
    }


    const originalUserName = document.getElementById("userName").value;
    document.getElementById("userName").addEventListener("input", async () => {
        const userName = document.getElementById("userName").value;
        const result = await validateUserName(userName, originalUserName);
        if (!result) {
            document.getElementById("takenName").classList.remove("d-none");
            document.getElementById("save").disabled = true;
        } else {
            document.getElementById("takenName").classList.add("d-none");
            document.getElementById("save").disabled=false;
        }
    });
</script>
</body>
</html>
