<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="profile">
    <div id="nameAndSignature">
        <img src="./images/avatar/${userProfile.avatar}">
        <span id="nickname">${userProfile.nickname}</span>
        <span id="signature">${userProfile.signature}</span>
    </div>
    <div id="otherInfo">
        <table>
            <tr><td>date of birth:</td><td>${userProfile.dateOfBirth.toString()}</td></tr>
            <tr><td>email:</td><td>${userProfile.email}</td></tr>
            <tr><td>description:</td><td>${userProfile.description}</td></tr>
        </table>
    </div>
</div>
