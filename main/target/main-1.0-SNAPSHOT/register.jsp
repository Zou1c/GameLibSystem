﻿<!DOCTYPE html>
<html>
  <head>
    <title>Register</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="files/register/styles.css" type="text/css" rel="stylesheet"/>
    <script src="data/document.js"></script>
    <script src="files/register/data.js"></script>
    <script type="text/javascript">
      $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
    </script>
  </head>
  <body>
  <form action="registerServlet" method="post">
    <div id="base" class="">
      <!-- Unnamed (文本框) -->
      <div id="u9" class="ax_default text_field">
        <div id="u9_div" class=""></div>
        <input id="u9_input" name="regiName" type="" value="" class="u9_input"/>
      </div>

      <!-- Unnamed (文本框) -->
      <div id="u10" class="ax_default text_field">
        <div id="u10_div" class=""></div>
        <input id="u10_input" name="regiPassword" type="password" value="" class="u10_input"/>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u11" class="ax_default label">
        <div id="u11_div" class=""></div>
        <div id="u11_text" class="text ">
          <p><span>账户名称</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u12" class="ax_default label">
        <div id="u12_div" class=""></div>
        <div id="u12_text" class="text ">
          <p><span>密码</span></p>
        </div>
      </div>

      <!-- Unnamed (复选框) -->
      <div id="u13" class="ax_default checkbox">
        <label id="u13_input_label" for="u13_input" style="position: absolute; left: 0px;">
          <img id="u13_img" class="img " src="images/register/u13.svg"/>
          <div id="u13_text" class="text ">
            <p><span>在这台电脑上记住</span></p>
          </div>
        </label>
        <input id="u13_input" type="checkbox" value="checkbox"/>
      </div>

      <!-- Unnamed (SVG) -->
      <div id="u14" class="ax_default _图片_">
        <img id="u14_img" class="img " src="images/register/regen/u5.svg"/><%--"images/login/regen/u5.svg"--%>
        <div id="u14_text" class="text " style="display:none; visibility: hidden">
          <p></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u15" class="ax_default _一级标题">
        <div id="u15_div" class=""></div>
        <div id="u15_text" class="text ">
          <p><span>注册</span></p>
        </div>
      </div>

      <!-- Unnamed (文本框) -->
      <div id="u16" class="ax_default text_field">
        <div id="u16_div" class=""></div>
        <input id="u16_input" name="reCheck" type="password" value="" class="u16_input"/>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u17" class="ax_default label">
        <div id="u17_div" class=""></div>
        <div id="u17_text" class="text ">
          <p><span>确认密码</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u18" class="ax_default primary_button">
        <input  name="check" type="submit" value="true" id="u18_img" class="img "style="color: transparent;border: transparent 0px;background-color: transparent;background-image: url(images/register/regen/u9.svg)"/><%--"images/login/regen/u9.svg"--%>
        <div id="u18_text" class="text ">
          <p><span>注册</span></p>
        </div>
      </div>
      <%String statu= (String) session.getAttribute("alret");
      System.out.println("statu"+statu);
      if (statu!=null){
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
      <%}}%>
      <!-- Unnamed (矩形) -->
      <div onclick="location='login.jsp'" id="u19" class="ax_default primary_button">
        <div id="u19_div" class=""></div>
        <div id="u19_text" class="text ">
          <p><span >返回登录</span></p>
        </div>
      </div>
    </div>
  </br>
    </br>
    <script src="resources/scripts/axure/ios.js"></script>
  </form>
  </body>
</html>
