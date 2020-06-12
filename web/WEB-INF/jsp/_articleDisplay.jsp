<%--
  Created by IntelliJ IDEA.
  User: yihao
  Date: 2020/6/13
  Time: 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <img id="coverImg" src="./images/cover/${article.cover}">
    <h3>${article.title}</h3>
    <%@include file="shared/_userProfileSummary.jsp"%>
    <p>${article.time}</p>
    <p>${article.content}</p>
</div>