<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kalvinwei
  Date: 9/06/20
  Time: 16:46
  To change this template use File | Settings | File Templates.

  --from ~/editProfilePage                          [to edit, to create]
  user(* except passwordHash,salt,interation)

  # => userProfile

  --to ~/saveProfile
  id,signature,firstName,lastName,nickname,email,password,avatar

  --to ~/deleteAccount
  id
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Profile</title>
    <script type="javascript">
        const avatarInputBox = document.querySelector("input[name='avatar']");
        const avatarDisplay = document.querySelector("img.avatar");

        avatarInputBox.onchange = function () {
            const imgFile = avatarInputBox.file[0];
            const reader = new FileReader();

            reader.onload = function(e) {
                avatarDisplay.src = e.target.result;
            }
            reader.readAsDataURL(imgFile);
        }

        function useDefaultAvatar(){
            avatarDisplay.src = "./images/defaultAvatar1.jpg";
            avatarInputBox.value = avatarDisplay.src;
        }
    </script>
</head>
<body>
<%@include file="shared/navbar.jsp"%>

<div id="wrapper">
    <h3>${userProfile.nickName}</h3>

    <form action="./saveProfile" method="post" enctype="multipart/form-data">

    <div id="leftBlock">
        <input id="signature" type="text" name="signature" value="${userProfile.signature}" placeholder="signature">
        <input id="firstName" type="text" name="firstName" value="${userProfile.firstName}" placeholder="firstName">
        <input id="lastName" type="text" name="lastName" value="${userProfile.lastName}" placeholder="lastName">
        <input id="userName" type="text" name="userName" value="${userProfile.userName}" placeholder="userName">
        <input id="nickname" type="text" name="nickname" value="${userProfile.nickname}" placeholder="nickname">
        <input id="dateOfBirth" type="text" name="dateOfBirth" value="${userProfile.dateOfBirth}" placeholder="dateOfBirth">
        <input id="email" type="text" name="email" ${userProfile.email} placeholder="email">
        <textarea name="description" placeholder="description">${userProfile.description}</textarea>
        <button type="submit">save</button>
        <button formaction="./deleteAccount">delete account</button>
    </div>

    <div id="rightBlock">
        <c:if test="${empty userProfile.avatar}">
            <img class="avatar" src="./images/guest.png" alt="guest avatar">
        </c:if>
        <c:if test="${not empty userProfile.avatar}">
            <img class="avatar" src="./images/avatar/${userProfile.avatar}">
        </c:if>
        <input type="file" name="avatar" value="${userProfile.avatar}" accept="image/jpeg, image/png">
        <button onclick="useDefaultAvatar()">delete avatar</button>
    </div>

    </form>
</div>
</body>
</html>
