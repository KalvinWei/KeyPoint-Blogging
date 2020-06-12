<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kalvinwei
  Date: 9/06/20
  Time: 16:52
  To change this template use File | Settings | File Templates.

  --from  ~/articlesPage
  user (* except passwordHash,salt,iteration)         [display current user's profile]
  articles[]                                          [show all articles of current user]
    article(id,title,time)

  # => userProfile
  # => articleSummaries
  # => isUserLoggedIn (boolean)

  --to ~/editArticlePage
  id

  --to ~/deleteArticle
  id


--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${userProfile.nickname}'s Blog</title>
    <%@include file="shared/_libraries.jsp"%>
</head>
<body>
<%@include file="shared/_navbar.jsp"%>
<div>
    <%@include file="_userProfile.jsp"%>
    <%@include file="shared/_articleSummaries.jsp"%>
</div>

</body>
</html>
