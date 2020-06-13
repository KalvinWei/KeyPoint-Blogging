<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Profile</title>
    <%@include file="shared/_libraries.jsp"%>
    <script type="javascript">
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
    </script>
</head>
<body>
<%@include file="shared/_navbar.jsp"%>

<div id="wrapper" class="container">
    <h3>${userProfile.nickname}</h3>

    <form action="./saveProfile" method="post" enctype="multipart/form-data">

    <div id="leftBlock">
        <input id="userName" type="hidden" name="userName" value="${userProfile.userName}">
        <div class="form-group">
            <label for="nickname">Nickname:</label>
            <input id="nickname" type="text" name="nickname" value="${userProfile.nickname}" placeholder="nickname" class="form-control">
        </div>
        <div class="form-group">
            <label for="signature">Signature:</label>
            <input id="signature" type="text" name="signature" value="${userProfile.signature}" placeholder="signature" class="form-control">
        </div>
        <div class="form-group">
            <label for="firstName">First name:</label>
            <input id="firstName" type="text" name="firstName" value="${userProfile.firstName}" placeholder="first name" class="form-control">
        </div>
        <div class="form-group">
            <label for="lastName">Last name:</label>
            <input id="lastName" type="text" name="lastName" value="${userProfile.lastName}" placeholder="last name" class="form-control">
        </div>
        <div class="form-group">
            <label for="dateOfBirth">Date of birth:</label>
            <input id="dateOfBirth" type="date" name="dateOfBirth" value="${userProfile.dateOfBirth.toString()}" placeholder="date of birth" class="form-control">
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input id="email" type="email" name="email" value="${userProfile.email}" placeholder="email" class="form-control">
        </div>
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea id="description" name="description" placeholder="description" class="form-control">${userProfile.description}</textarea>
        </div>
    </div>

    <div id="rightBlock">
        <img class="avatar" src="./images/avatar/${userProfile.avatar}">
        <input type="file" name="avatar" accept="image/jpeg, image/png">
        <button onclick="useDefaultAvatar()">delete avatar</button>
    </div>

    <button type="submit" class="btn btn-dark btn-block">Save</button>

    </form>

    <form action="./deleteAccount" method="post">
        <input type="hidden" name="userName" value="${userProfile.userName}">
        <button type="submit" class="btn btn-danger form-control">Delete account</button>
    </form>
</div>
</body>
</html>
