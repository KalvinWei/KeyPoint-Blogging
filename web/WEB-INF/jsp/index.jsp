<%--
  Created by IntelliJ IDEA.
  User: kalvinwei
  Date: 10/06/20
  Time: 09:51
  To change this template use File | Settings | File Templates.

  --from indexPage
  articleSummaries[]                                        [recent articles list]
    articleSummary(title,content,time,cover,author)

  # => articleSummaries

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>KeyPoint</title>
    <%@include file="shared/_libraries.jsp"%>
</head>
<body>
<%@include file="shared/_navbar.jsp"%>
<div>
    <%@include file="shared/_articleSummaries.jsp"%>
</div>
</body>
</html>
