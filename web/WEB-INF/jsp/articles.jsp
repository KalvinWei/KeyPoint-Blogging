<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kalvinwei
  Date: 9/06/20
  Time: 16:52
  To change this template use File | Settings | File Templates.

  --from  ~/articlesPage
  user (* except passwordHash,salt,iteration)         [display current user's profile]
  articles[]                                          [show all articles of current user]
    article(id,title,time)

  # => userProfile
  # => articleSummaries
  # => isUserLoggedIn (boolean)

  --to ~/editArticlePage
  id

  --to ~/deleteArticle
  id


--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${userProfile.nickname}'s Blog</title>
</head>
<body>
<%@include file="shared/navbar.jsp"%>

<div id="profile">
    <div id="nameAndSignature">
        <img src="./images/avatar/${userProfile.avatar}">
        <span id="nickname">${userProfile.nickname}</span>
        <span id="signature">${userProfile.signature}</span>
    </div>
    <div id="otherInfo">
        <table>
            <tr><td>date of birth:</td><td>${userProfile.dateOfBirth}</td></tr>
            <tr><td>email:</td><td>${userProfile.email}</td></tr>
            <tr><td>description:</td><td>${userProfile.description}</td></tr>
        </table>
    </div>
</div>

<div id="articleList">
    <h3><span>all articles</span></h3>
    <c:forEach items="${articleSummaries}" var="article">
        <h4><a href="./articlePage?id=${article.id}">${article.title}</a></h4>
        <p>
            <span>${article.time}</span>
            <c:if test="${isOwner}">
                <a href="./editArticlePage?id=${article.id}">edit</a>
                <form action="./deleteArticle?id=${article.id}">
                    <button type="submit">Delete</button>
                </form>
            </c:if>
        </p>
        <img src="./images/avatar/${article.userAvatar}">

    </c:forEach>
</div>

</body>
</html>
