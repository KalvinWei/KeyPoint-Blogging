<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <img src="./images/cover/${article.cover}">
    <h3>${article.title}</h3>
    <c:set var="userSummary" value="${article.user}"/>
    <%@include file="shared/_userSummary.jsp"%>
    <p>${article.time}</p>
    <p>${article.content}</p>
</div>