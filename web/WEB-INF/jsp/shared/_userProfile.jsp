<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="my-3 border-0 p-5 media profile">
    <img src="./images/avatar/${author.avatar}" class="profile-avatar">
    <div class="col-sm-7 media-body profile-info">
        <p class="text-center my-0" style="font-size: small">
            <a href="./articlesPage?userName=${author.userName}" data-toggle="tooltip" title="${author.signature}">
                <span class="font-weight-light">${author.nickname}</span>
            </a>
        </p>
        <p class="text-center my-0" style="font-size: small">
            <span class="font-weight-light">${author.signature}</span>
        </p>
        <dl class="row">
            <dt class="col-md-3">Followers:</dt>
            <dd class="col-md-9" id="followers_${author.id}">${author.followers}</dd>
            <dt class="col-md-3">date of birth:</dt>
            <dd class="col-md-9">${author.dateOfBirth.toString()}</dd>
            <dt class="col-md-3">email:</dt>
            <dd class="col-md-9">${author.email == null || author.email.isEmpty() ? "secret" : author.email}</dd>
            <dt class="col-md-3">description:</dt>
            <dd class="col-md-9">${author.description == null || author.description.isEmpty() ? "secret" : author.description}</dd>
        </dl>
        <c:if test="${isUserLoggedIn && author.userName.equals(user.userName)}">
            <a href="./editProfilePage?userName=${author.userName}" role="button"
               class="btn btn-sm btn-info">Edit</a>
        </c:if>
        <c:if test="${isUserLoggedIn && !author.userName.equals(user.userName)}">
            <form id="followForm_${author.id}" action="./follow" method="post" class="d-none">
                <input type="hidden" name="followee" value="${author.id}">
                <input type="hidden" name="follower" value="${user.id}">
                <button id="followButton_${author.id}" type="submit" class="btn btn-sm btn-outline-info">Follow</button>
            </form>
            <form id="unfollowForm_${author.id}" action="./unfollow" method="post" class="d-none">
                <input type="hidden" name="followee" value="${author.id}">
                <input type="hidden" name="follower" value="${user.id}">
                <button id="unfollowButton_${author.id}" type="submit" class="btn btn-sm btn-info">Unfollow</button>
            </form>
            <script>
                enableFollow(${author.id});
                enableUnfollow(${author.id});
                checkFollow(${author.id}, ${user.id});
            </script>
        </c:if>
    </div>
</div>
