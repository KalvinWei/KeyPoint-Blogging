<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${article.user.nickname} - ${article.title}</title>
    <%@include file="shared/_libraries.jsp" %>
</head>
<body>
<%@include file="shared/_navbar.jsp" %>
<div class="container-lg">
    <%@include file="_articleDisplay.jsp" %>
    <div class="mx-lg-5">
        <h4 class="text-black-50">Comments</h4>
        <hr>
        <%@include file="shared/_commentBox.jsp" %>
        <%@include file="_comments.jsp" %>
    </div>
</div>
</body>
</html>
