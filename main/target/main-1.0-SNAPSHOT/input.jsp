<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>input</title>
</head>
<body>

<br/>
<%
    int loginCheck= (int) session.getAttribute("loginCheck");
String loginInformation;
switch (loginCheck){
    case -1:loginInformation="没有此用户!";break;
    case 0:loginInformation="密码错误！";break;
    case 1:loginInformation="登录成功！";break;
    default:loginInformation="";

}
%>
<font size="3" color="red"><%=loginInformation%></font>
</body>
</html>