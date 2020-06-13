<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="profile">
    <div id="nameAndSignature">
        <img src="./images/avatar/${user.avatar}" style="width: 20px">
        <span id="nickname">${user.nickname}</span>
        <span id="signature">${user.signature}</span>
    </div>
    <div id="otherInfo">
        <table>
            <tr><td>date of birth:</td><td>${user.dateOfBirth.toString()}</td></tr>
            <tr><td>email:</td><td>${user.email}</td></tr>
            <tr><td>description:</td><td>${user.description}</td></tr>
        </table>
    </div>
    <a href="./editProfilePage?userName=${user.userName}">Edit Profile</a>
</div>
