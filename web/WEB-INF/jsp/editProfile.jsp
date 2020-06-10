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

    <form action="./editProfile" method="post">

    <div id="leftBlock">
        <input id="signature" type="text" name="signature" placeholder="signature">
        <input id="firstName" type="text" name="signature" placeholder="first name">
        <input id="lastName" type="text" name="signature" placeholder="last name">
        <input id="userName" type="text" name="signature" placeholder="username">
        <input id="nickname" type="text" name="signature" placeholder="nickname">
        <input id="email" type="text" name="signature" placeholder="E-mail: anonymous@server.com">
        <input id="password" type="text" name="signature" placeholder="password">
        <input id="pswConfirmation" type="text"  placeholder="password confirmation">
        <textarea name="description" placeholder="description"></textarea>
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
        <input type="hidden" name="avatar">
        <button onclick="//uploadPhoto();">upload a new photo</button>
        <button onclick="//deletePhoto();">delete current photo</button>
    </div>

    </form>
</div>
</body>
</html>
