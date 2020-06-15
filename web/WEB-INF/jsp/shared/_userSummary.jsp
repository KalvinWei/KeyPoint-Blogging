<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<a href="./articlesPage?userName=${userSummary.userName}" title="${userSummary.signature}">
    <img src="./images/avatar/default/${userSummary.avatar}" style="width: 20px; border-radius: 50%;">
    ${userSummary.nickname}
</a>
