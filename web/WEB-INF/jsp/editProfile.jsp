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
    <title>editProfile</title>
</head>
<body>
<%@include file="shared/navbar.jsp"%>

<div id="wrapper">
    <h3>${userProfile.nickName}</h3>

    <form action="./saveProfile" method="post">

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
            <img src="./images/guest.png" alt="guest avatar">
        </c:if>
        <c:if test="${not empty userProfile.avatar}">
            <img src="./images/avatar/${userProfile.avatar}">
        </c:if>
        <input type="text" name="avatar" value="${userProfile.avatar}">
        <button onclick="//uploadPhoto();">upload a new photo</button>
        <button onclick="//deletePhoto();">delete current photo</button>
    </div>

    </form>
</div>
</body>
</html>
