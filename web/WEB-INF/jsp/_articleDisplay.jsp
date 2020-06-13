<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <img src="./images/cover/${article.cover}">
    <h3>${article.title}</h3>
    <%@include file="shared/_userProfileSummary.jsp"%>
    <p>${article.time}</p>
    <p>${article.content}</p>
</div>