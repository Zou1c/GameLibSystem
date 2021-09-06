<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP - Hello World</title>
    </head>
    <body>
    <jsp:forward page="login.jsp"></jsp:forward>
    <div id="u6" class="ax_default primary_button" align="center">
        <!--<img id="u6_img" class="img " src="images/login/u6.svg"/>-->
        <input style="background: url(images/login/u6.svg);width:100%;height:100%;border:0" type="submit" name="login" value="登录" />
        <div id="u6_text" class="text ">
        </div>

    </div>
    <div align="center">
        <h1>
            <%
                String statu= (String) session.getAttribute("loginCheck");
                System.out.println("status="+statu);
                //System.out.println("UserName in index.jsp is "+(String)session.getAttribute("name"));
                if(statu==null);
                else if(statu.equals("登录成功"))request.getRequestDispatcher("library.jsp").forward(request,response);
                else{
                    if (statu.equals("用户名和密码为空")){
            %>
            <!--Because of unexpected bug-->
            <script type="text/javascript">
                alert("用户名和密码为空");
            </script>
            <%}%>
            <%
                if (statu.equals("用户名为空")){
            %>
            <script type="text/javascript">
                alert("用户名为空");</script>
            <%}%>
            <%
                if (statu.equals("密码为空")){
            %>
            <script type="text/javascript">
                alert("密码为空");</script>
            <%}%>
            <%
                if (statu.equals("用户名错误")){
            %>
            <script type="text/javascript">
                alert("用户名错误");</script>
            <%}%>
            <%
                if (statu.equals("密码错误")){
            %>
            <script type="text/javascript">
                alert("密码错误");</script>
            <%}%>
            <!--<font color="red" size=1 face="Arial"><%=statu%></font>-->
            <%;}%>
        </h1>
    </div>