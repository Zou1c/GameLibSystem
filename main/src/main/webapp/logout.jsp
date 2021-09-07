
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注销</title>
</head>
<body>

<%
    session.invalidate();
    System.out.println("账号已注销");
%>
<jsp:forward page="login.jsp"></jsp:forward>
</body>
</html>
