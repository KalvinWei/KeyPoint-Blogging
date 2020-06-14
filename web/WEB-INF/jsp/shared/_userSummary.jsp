<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<a href="./articlesPage?userName=${userSummary.userName}" data-toggle="tooltip" title="${userSummary.signature}">
    <img src="./images/avatar/${userSummary.avatar}" style="width: 20px">
    ${userSummary.nickname}
</a>
