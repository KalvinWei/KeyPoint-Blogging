<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>
        <c:if test="${article.id == null}">
            Create New Article
        </c:if>
        <c:if test="${article.id != null}">
            ${article.title} - ${user.nickname}
        </c:if>
    </title>
    <%@include file="shared/_libraries.jsp"%>
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
            coverImg.src = "./images/cover/1.jpg";
            fileInput.value = coverImg.src;
        }
    </script>
</head>
<body>
<%@include file="shared/_navbar.jsp" %>
<div id="wrapper">
    <form action="./postArticle" method="post" enctype="multipart/form-data" class="form">
        <img src="./images/cover/${article.cover}">
        <div>
            <label for="cover">Cover:</label>
            <input type="file" id="cover" name="cover">
        </div>
        <input type="hidden" name="id" value="${article.id}">
        <input type="hidden" name="userName" value="${article.user.userName}">
        <input type="hidden" name="originalCover" value="${article.cover}">
        <div class="form-group">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value="${article.title}" placeholder="title" class="form-control">
        </div>
        <div class="form-group">
            <label for="tags">Tags:</label>
            <input type="text" id="tags" name="tags" value="${String.join(", ", article.tags)}" placeholder="tags, separated by ','" class="form-control">
        </div>
        <div class="form-group">
            <label for="content">Content</label>
            <textarea id="content" name="content" class="form-control">${article.content}</textarea>
        </div>
        <button id="resetCover" onclick="resetCover();">reset cover</button>
        <button type="submit" class="form-control btn btn-dark">Post</button>
    </form>
    <c:if test="${article.id != null}">
        <form action="./deleteArticle" method="post" class="form">
            <input type="hidden" name="id" value="${article.id}">
            <button type="submit" class="form-control btn btn-danger">Delete</button>
        </form>
    </c:if>
</div>
</body>
</html>
