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
<nav id="navElements" class="navbar navbar-expand-lg bg-dark navbar-dark justify-content-between">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="navbar-brand nav-link" href="./indexPage">KeyPoint</a>
        </li>
    </ul>

    <ul class="navbar-nav">
        <c:if test="${!isUserLoggedIn}">
            <li class="nav-item">
                <a class="nav-link" href="./signInPage">Sign In</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="./signUpPage">Sign Up</a>
            </li>
        </c:if>
        <c:if test="${isUserLoggedIn}">
            <li class="nav-item">
                <a class="nav-link" href="./articlesPage?user=${userProfileSummary.nickname}">
                        ${userProfileSummary.nickname}
                </a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" >
                    <img src="./images/avatar/${userProfileSummary.avatar}">
                </a>
                <div id="navList" class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="./articlesPage?userName=${userProfileSummary.userName}">My Space</a>
                    <a class="dropdown-item" href="./editArticlePage?userName=${userProfileSummary.userName}">New Article</a>
                    <a class="dropdown-item" href="./editProfilePage?userName=${userProfileSummary.userName}">Edit Profile</a>
                    <a class="dropdown-item" href="./signOut">Sign Out</a>
                </div>
            </li>
        </c:if>
    </ul>
</nav>
