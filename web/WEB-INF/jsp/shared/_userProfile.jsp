<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="profile">
    <div id="nameAndSignature">
        <img src="./images/avatar/${author.avatar}" style="width: 20px">
        <a href="./articlesPage?userName=${author.userName}" data-toggle="tooltip" title="${author.signature}">
            <span id="nickname">${author.nickname}</span>
        </a>
        <span id="signature">${author.signature}</span>
    </div>
    <div id="otherInfo">
        <table>
            <tr><td>date of birth:</td><td>${author.dateOfBirth.toString()}</td></tr>
            <tr><td>email:</td><td>${author.email}</td></tr>
            <tr><td>description:</td><td>${author.description}</td></tr>
        </table>
    </div>
    <c:if test="${author.userName.equals(user.userName)}">
        <a href="./editProfilePage?userName=${author.userName}">Edit</a>
    </c:if>

</div>
