<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav id="navElements" class="navbar navbar-expand-sm bg-primary navbar-dark justify-content-between"
     style="background-color: #007bff">
    <a class="navbar-brand" href="./indexPage"><h3>KeyPoint Blogging</h3></a>
    <!-- show when viewpoint is small, to toggle list items -->
    <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
            aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="./indexPage">Articles</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="./authorsPage">Authors</a>
            </li>

            <c:if test="${!isUserLoggedIn}">
                <li class="nav-item">
                    <a class="nav-link" href="./signInPage">Sign In</a>
                </li>
                <li clas="nav-item">
                    <a class="nav-link" href="./signUpPage">Sign
                    Up</a>
                </li>
            </c:if>
            <c:if test="${isUserLoggedIn}">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown"
                       href="#" role="button" id="navbarDropdown" aria-haspopup="true" aria-expanded="false">
                        <span>${user.nickname}</span>
                        <img src="./images/avatar/${user.avatar}" style="width: 20px; border-radius: 50%;">
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
    </div>
</nav>
