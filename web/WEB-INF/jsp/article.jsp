<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${article.user.nickname} - ${article.title}</title>
    <%@include file="shared/_libraries.jsp"%>
</head>
<body>
<%@include file="shared/_navbar.jsp" %>
<div>
    <%@include file="_articleDisplay.jsp"%>
    <%@include file="_articleCommentBox.jsp"%>
    <%@include file="_comments.jsp"%>
</div>
</body>
</html>
