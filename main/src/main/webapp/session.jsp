<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>run了</title>
</head>
<body>
<%
    session.invalidate();
%>
<jsp:forward page="login.jsp"></jsp:forward>
</body>
</html>
