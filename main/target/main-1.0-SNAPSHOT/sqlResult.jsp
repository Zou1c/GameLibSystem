<%@ page import="java.util.Vector" %>
<%@ page import="com.database.GameData" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/9/1
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Vector res=(Vector)session.getAttribute("res");
    %>
<table border="1">
    <tr>
        <td><%="AppID"%></td>
        <td><%="Name"%></td>
        <td><%="Size"%></td>
    </tr>
        <%
    for(Object i:res){
        GameData gb=(GameData) i;
%>
    <tr>
        <td><%=gb.getAppID()%></td>
        <td><%=gb.getName()%></td>
        <td><%=gb.getSize()%></td>
    </tr>

            <%
            }
    %>
    </table>
</body>
</html>