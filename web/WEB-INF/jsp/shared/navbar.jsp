<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kalvinwei
  Date: 9/06/20
  Time: 16:43
  To change this template use File | Settings | File Templates.

    --from indexPage
  user(nickname,avatar)                                     [for navbar]
  # => userProfileSummary
  # => isUserLoggedIn (boolean)
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>navbar</title>
    <%@include file="libraries.jsp"%>
</head>
<body>
<!-- left: LOGO-->


<!-- right: nav -->
<div id="navElements" class="navbar-nav">
    <a class="navbar-brand" href="./indexPage">KeyPoint</a>
    <!--basic: show avatar and nickname -->
    <div id="avatarAndName" class="navbar-nav">
        <c:if test="${!isUserLoggedIn}">
            <div class="nav-item">
                <a class="nav-link" href="./signInPage">Sign In</a>
            </div>
            <div>
                <a class="nac-link" href="./signInPage">Sign Up</a>
            </div>
        </c:if>
        <c:if test="${isUserLoggedIn}">
            <div class="nav-item">
                <a class="nav-link" href="./articlesPage?user=${userProfileSummary.userName}">
                        ${userProfileSummary.nickname}test
                </a>
            </div>
            <div class="nav-item">
                <img src="./images/avatar/${userProfileSummary.avatar}" onclick="//toggleNavList()">
            </div>

            <!--if signed-in, click avatar, show navlist -->
            <div id="navList">
                <ul>
                    <li><a href="./articlesPage">My Space</a></li>
                    <li><a href="./editArticlePage">New Article</a></li>
                    <li><a href="./editProfilePage">Edit Profile</a></li>
                    <li><a href="./signOut">Sign Out</a></li>
                </ul>
            </div>
        </c:if>
    </div>
</div>

</body>
</html>
