<%@ page import="com.database.DatabaseBean" %>
<!DOCTYPE html>
<html>
<head>
  <title>Login</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
  <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
  <link href="data/styles.css" type="text/css" rel="stylesheet"/>
  <link href="files/login/styles.css" type="text/css" rel="stylesheet"/>
  <script src="data/document.js"></script>
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
<form action="checkUserLogin2"method="post">
  <img id="base" class="">
    <img onclick="location='register.jsp'" style="position: absolute;width: 105px;height: 20px;"src="images/login/regi.png">
<%!String statu="";%>
    <!-- Unnamed (文本框) -->
    <div id="u0" class="ax_default text_field">
      <div id="u0_div" class=""></div>
      <input id="u0_input" type="text" name="UserName" class="u0_input"
      value=<%=(String)session.getAttribute("name")==null?"":(String)session.getAttribute("name")%>>
      </input>
      ><!--账户-->
    </div>

    <!-- Unnamed (矩形) -->
    <div id="u1" class="ax_default _一级标题">
      <div id="u1_div" class=""></div>
      <div id="u1_text" class="text ">
        <p><span>登录</span></p>
      </div>
    </div>

    <!-- Unnamed (文本框) -->
    <div id="u2" class="ax_default text_field">
      <div id="u2_div" class=""></div>
      <input id="u2_input" type="password" value="" name="Password" class="u2_input"/><!--密码-->
    </div>

    <!-- Unnamed (矩形) -->
    <div id="u3" class="ax_default label">
      <div id="u3_div" class=""></div>
      <div id="u3_text" class="text ">
        <p><span>账户名称</span></p>
      </div>
    </div>

    <!-- Unnamed (矩形) -->
    <div id="u4" class="ax_default label">
      <div id="u4_div" class=""></div>
      <div id="u4_text" class="text ">
        <p><span>密码</span></p>
      </div>
    </div>

    <script>
      function loginWarm(){
        <%System.out.println("loginWarm:"+(String) session.getAttribute("loginCheck"));%>
        alert("<%=(String) session.getAttribute("loginCheck")%>");
      }
    </script>

    <!-- Unnamed (复选框) -->
    <div id="u5" class="ax_default checkbox">
      <label id="u5_input_label" for="u5_input" style="position: absolute; left: 0px;">
        <img id="u5_img" class="img " src="images/login/u5.svg"/>
        <div id="u5_text" class="text ">
          <p><span>在这台电脑上记住</span></p>
        </div>
      </label>
      <input id="u5_input" type="checkbox" value="checkbox"/>
    </div>


    <!-- Unnamed (矩形) -->
    <div id="u6" class="ax_default primary_button" align="center">
      <!--<img id="u6_img" class="img " src="images/login/u6.svg"/>-->
      <input style="background: url(images/login/u6.svg);width:100%;height:100%;border:0;font-family:'华文细黑';color:#FFFFFF"
             type="submit" name="login"  value="登录" />
      <div id="u6_text" class="text ">
      </div>
    </div>
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
      <!--<font color="red" size=1 face="Arial"><%=statu%></font>-->
      <%;}%>
    </h1>
  </div>

    <!-- Unnamed (SVG) -->
    <div id="u7" class="ax_default _图片_">
      <img id="u7_img" class="img " src="images/login/u7.svg"/>
      <div id="u7_text" class="text " style="display:none; visibility: hidden">
        <p></p>
      </div>
    </div>
  </div>
  <script src="resources/scripts/axure/ios.js"></script>
</form>>
</body>
</html>