﻿<%@ page import="com.database.DatabaseBean" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
  <title>Login</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
  <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
  <link href="data/styles.css" type="text/css" rel="stylesheet"/>
  <link href="files/login/styles.css" type="text/css" rel="stylesheet"/>
  <script src="data/document.js"></script>a
  <script src="files/login/data.js"></script>
  <script type="text/javascript">
    $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
    $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
    $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
  </script>
</head>
<body>
<%
%>
<form action="checkUserLogin" method="post">
  <%!String statu="";%>

  <%
  %>
  <!-- Unnamed (文本框)  -->
  <div id="u0" class="ax_default text_field">
    <div id="u0_div" class=""></div>
    <input id="u0_input" type="text" name="UserName" class="u0_input"
           value=<%=(String)session.getAttribute("name")==null?"":(String)session.getAttribute("name")%>>
    </input>
    ><!--账户-->
  </div>

  <!-- Unnamed (矩形) -->
  <div id="u7" class="ax_default _一级标题">
    <div id="u7_div" class=""></div>
    <div id="u7_text" class="text ">
      <p><span>登录</span></p>
    </div>
  </div>

  <!-- Unnamed (文本框) -->
  <div id="u1" class="ax_default text_field">
    <div id="u1_div" class=""></div>
    <input id="u1_input" type="password" value="" name="Password" class="u2_input"/><!--密码-->
  </div>

  <!-- Unnamed (矩形) -->
  <div id="u2" class="ax_default label">
    <div id="u2_div" class=""></div>
    <div id="u2_text" class="text ">
      <p><span>账户名称</span></p>
    </div>
  </div>

  <!-- Unnamed (矩形) -->
  <div id="u3" class="ax_default label">
    <div id="u3_div" class=""></div>
    <div id="u3_text" class="text ">
      <p><span>密码</span></p>
    </div>
  </div>

  <!-- Unnamed (复选框) -->
  <div id="u4" class="ax_default checkbox">
    <label id="u4_input_label" for="u4_input" style="position: absolute; left: 0px;">
      <img id="u4_img" class="img " src="images/login/u4.svg"/>
      <div id="u4_text" class="text ">
        <p><span>在这台电脑上记住</span></p>
      </div>
    </label>
    <input id="u4_input" type="checkbox" value="checkbox"/>
  </div>


  <!-- Unnamed (矩形) -->

    <input style="
    background-size:cover;background-image: url(images/login/login.png);
    font-family: '华文细黑', sans-serif;font-size:18px;font-weight:400;color:transparent;
    left: 390px;top:573px;position: absolute;width: 134px;height: 40px;border-radius: 5px;"
           type="submit" name="login" value="登录" />

  </div>
  <div align="center">
    <h1>
      <%
        String statu= (String) session.getAttribute("loginCheck");
        System.out.println("status="+statu);
        //System.out.println("UserName in index.jsp is "+(String)session.getAttribute("name"));
        if(statu==null);
        else if(statu.equals("登录成功"))request.getRequestDispatcher("getGameStore").forward(request,response);
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

      <%;}%>
    </h1>
  </div>
</form>>

<div id="u6" class="ax_default _图片_">
  <img id="u6_img" class="img " src="images/login/u7.svg"/>
  <div id="u6_text" class="text " style="display:none; visibility: hidden">
    <p></p>
  </div>
</div>


<div id="u8" class="ax_default primary_button">
  <div id="u8_div" class=""></div>
  <div id="u8_text" class="text ">
    <p><span></span></p>
  </div>
</div>
<input type="button"  style="border-radius: 5px;background-size: cover;
background-image: url(images/login/regiLogin.png);
left: 555px;top:573px;position: absolute;width: 134px;height: 40px;" onclick="location='register.jsp'">
</div>
<script src="resources/scripts/axure/ios.js"></script>
</body>
</html>