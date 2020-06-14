<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav id="navElements" class="navbar navbar-expand-lg bg-dark navbar-dark justify-content-between">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="navbar-brand nav-link" href="./indexPage">KeyPoint</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="./indexPage">Articles</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="./authorsPage">Authors</a>
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
                <a class="nav-link" href="./articlesPage?userName=${user.userName}" data-toggle="tooltip" title="${user.signature}">
                        ${user.nickname}
                </a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" >
                    <img src="./images/avatar/${user.avatar}" style="width: 20px">
                </a>
                <div id="navList" class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="./articlesPage?userName=${user.userName}">My Blog</a>
                    <a class="dropdown-item" href="./editArticlePage?userName=${user.userName}">New Post</a>
                    <a class="dropdown-item" href="./editProfilePage?userName=${user.userName}">Edit Profile</a>
                    <a class="dropdown-item" href="./signOut">Sign Out</a>
                </div>
            </li>
        </c:if>
    </ul>
</nav>