<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP - Hello World</title>
    </head>
    <body>
        <form action="UserLoginCheck"method="post">
            <br/>
            <div align="center" bgcolor="ffffff" border="2" cellpadding="0" cellspacing="0">
                <tr>
                    <td>帐号 ：</td>
                    <td><input type="text" name="UserName" size="25"></td>
                </tr>
                <h1>

                </h1>
                <tr>
                    <td>密码 ：</td>
                    <td><input type="password" name="Password" size="25"></td>
                </tr>
            </div>
            <h1>


            </h1>
            <div align="center">
                <input type="submit" name="login" value="登录" />
                <input type="submit" name="reg" value="注册" />

            </div>
            <div align="center">
                <h1>
                    <%
                        String statu= (String) session.getAttribute("loginCheck");
                        System.out.println("status="+statu);
                        if(statu==null);
                        else if(statu.equals("登录成功"))request.getRequestDispatcher("2nd.jsp").forward(request,response);
                        else{
                    %>
                    <font color="red" size=5 face="Arial"><%=statu%></font>
                    <%;}%>
            </h1>
        </div>
    </form>
</body>
    <html>
