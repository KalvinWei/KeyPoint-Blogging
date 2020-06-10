<%--
  Created by IntelliJ IDEA.
  User: kalvinwei
  Date: 9/06/20
  Time: 16:52
  To change this template use File | Settings | File Templates.

  --from ~/articlePage
  user (id,nickname,avatar)                                        [check article belonging]
  article (id,title,user,time,content,cover,comments[])            [display article, check article belonging]

  # => userProfile
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
    <title>Title</title>
</head>
<body>
<%@include file="shared/navbar.jsp"%>
</body>
</html>
