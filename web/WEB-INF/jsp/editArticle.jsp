<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kalvinwei
  Date: 9/06/20
  Time: 16:51
  To change this template use File | Settings | File Templates.

  --from ~/editArticlePage                      [to edit. check if fields except userid in "article" are null, and populate textbox accordingly.]
  article(* expect isDeleted)
  # => article (this includes user information)

  --to ~/postArticle                            [when submitting, servlet detect if articleId is null, if so, it means to create, not modify]
  id,title,content,time,cover,user

  --to ~/deleteArticle
  id

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>
        <c:if test="${empty article.title}">
            Create New Article
        </c:if>
        <c:if test="${not empty article.title}">
            ${userProfile.nickname}: ${article.title}
        </c:if>
    </title>
    <script type="text/javascript">
        const coverImg = document.querySelector("img#coverImg");
        const fileInput = document.querySelector("input#fileInput");

        fileInput.onchange = function () {
            const newCover = fileInput.files[0];
            const reader = new FileReader();

            reader.onload = function (e) {
                coverImg.src = e.target.result;
            };
            reader.readAsDataURL(newCover);
        };

        function resetCover() {
            coverImg.src = "./images/cover/cover1.jpg";
            fileInput.value = coverImg.src;
        }
    </script>
</head>
<body>
<%@include file="shared/navbar.jsp" %>

<div id="wrapper">
    <!-- click image to upload or change cover image -->
    <div id="coverWrapper">
        <span>click this area to change cover</span>
        <!-- article.title is empty, signifies this page is to create a new article -->
        <c:if test="${empty article.title}">
            <img id="coverImg" src="./images/cover/defaultCover.jpg">
        </c:if>
        <!-- this is to edit an existent article -->
        <c:if test="${not empty article.title}">
            <img id="coverImg" src="./images/cover/${article.cover}">
        </c:if>
    </div>


    <form action="./postArticle" method="post">
        <input type="hidden" name="id" value="${article.id}">
        <input type="hidden" name="userName" value="${article.userName}">
        <input type="hidden" name="tags" value="tags">
        <input type="text" name="title" value="${article.title}" placeholder="title">
        <textarea name="content">${article.content}</textarea>
        <input id="fileInput" type="file" name="cover" value="./images/cover/${article.cover}">
        <button id="resetCover" onclick="resetCover();">reset cover</button>
        <button type="submit">post</button>
    </form>

    <form action=".deleteArticle" method="post">
        <button>delete</button>
    </form>
</div>
</body>
</html>
