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
        <span id="nickname">${userProfile.nickname}</span>
        <span id="signature">${userProfile.signature}</span>
    </div>
    <div id="otherInfo">
        <img src="./images/avatar/${userProfile.avatar}">
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
        <h4><a href="/articlePage"${article.title}</h4>
        <p>
            <span>${article.time}</span>
            <a href="./editArticlePage?id=${article.id}">edit</a>
            <a href="./deleteArticle?id=${article.id}">delete</a>
        </p>
    </c:forEach>
</div>

</body>
</html>
