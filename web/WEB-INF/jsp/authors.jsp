<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Authors</title>
    <%@include file="shared/_libraries.jsp"%>
</head>
<body>
<%@include file="shared/_navbar.jsp" %>
<div>
    <c:forEach var="author" items="${authors}">
        <%@include file="shared/_userProfile.jsp"%>
    </c:forEach>
</div>
</body>
</html>
