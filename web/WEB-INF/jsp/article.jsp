<%--
  Created by IntelliJ IDEA.
  User: kalvinwei
  Date: 9/06/20
  Time: 16:52
  To change this template use File | Settings | File Templates.

  --from ~/articlePage
  user (id,nickname,avatar)                                        [check article belonging]
  article (id,title,user,time,content,cover,comments[])            [display article, check article belonging]

  # => userProfileSummary !!
  # => article
  # => isUserLoggedIn (boolean)

  --to ~/postComment
  content,time,parent,user,article

  --to ~/deleteComment
  id

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${article.userNickname} - ${article.title}</title>
    <%@include file="shared/_libraries.jsp"%>
</head>
<body>
<%@include file="shared/_navbar.jsp" %>
<div>
    <%@include file="_articleDisplay.jsp"%>
    <%@include file="_articleCommentBox.jsp"%>
    <%@include file="_comments.jsp"%>
</div>
</body>
</html>
