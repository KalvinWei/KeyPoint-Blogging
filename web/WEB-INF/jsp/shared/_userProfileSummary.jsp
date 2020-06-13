<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<a href="./articlesPage?userName=${article.user.userName}">
    <img src="./images/avatar/${article.user.avatar}" style="width: 20px">
    ${article.user.nickname}
</a>
