<%--
  Created by IntelliJ IDEA.
  User: kalvinwei
  Date: 9/06/20
  Time: 16:51
  To change this template use File | Settings | File Templates.

  --from ~/editArticlePage                      [to edit. check if fields except userid in "article" are null, and populate textbox accordingly.]
  article(* expect isDeleted)
  # => article (this includes user information)

  --to ~/postArticle                            [when submitting, servlet detect if articleId is null, if so, it means to create, not modify]
  id,title,content,time,cover,user

  --to ~/deleteArticle
  id

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
