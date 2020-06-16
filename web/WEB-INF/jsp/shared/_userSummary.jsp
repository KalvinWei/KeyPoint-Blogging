<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<span>
    <a href="./articlesPage?userName=${userSummary.userName}"
    data-toggle="tooltip"
    title="${userSummary.userName}: ${userSummary.signature}">
        <img src="./images/avatar/${userSummary.avatar}" class="avatar-sm">
        ${userSummary.nickname}
    </a>
    <a href="./followeesPage?followee=${userSummary.id}">
        ${userSummary.followers}&nbsp;follower${userSummary.followers == 1 ? "" : "s"}
    </a>
</span>