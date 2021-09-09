<!DOCTYPE html>
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
  <%
    String alret=(String)session.getAttribute("alret");
    System.out.println("alret is:"+alret);
    if (alret!=null){
      if (alret.equals("用户名已存在")||alret.equals("用户名为空")||alret.equals("用户名和密码为空")
              ||alret.equals("用户名和确认密码为空")||alret.equals("全为空")){%>
  <h1 style="color:#c3463a;font-size: 16px;position: relative;top: 369px;right: -710px"><%=alret%></h1><%}%>
  <%if (alret.equals("密码为空和确认密码为空")||alret.equals("密码为空")){%>
  <h1 style="color:#c3463a;font-size: 16px;position: relative;top: 484px;right: -710px"><%=alret%></h1><%}%>
  <%if (alret.equals("请确认密码")){%>
  <h1 style="color:#c3463a;font-size: 16px;position: relative;top: 600px;right: -710px"><%=alret%></h1><%}%>
  <%}%>
  <%session.removeAttribute("alret");%>
  <div id="base" class="">

    <div id="u9" class="ax_default text_field">
      <div id="u9_div" class=""></div>
      <input id="u9_input" name="regiName" type="" value="" class="u9_input"/>
    </div>


    <div id="u10" class="ax_default text_field">
      <div id="u10_div" class=""></div>
      <input id="u10_input" name="regiPassword" type="password" value="" class="u10_input"/>
    </div>


    <div id="u11" class="ax_default label">
      <div id="u11_div" class=""></div>
      <div id="u11_text" class="text ">
        <p><span>账户名称</span></p>
      </div>
    </div>


    <div id="u12" class="ax_default label">
      <div id="u12_div" class=""></div>
      <div id="u12_text" class="text ">
        <p><span>密码</span></p>
      </div>
    </div>
    <div id="u16" class="ax_default text_field">
      <div id="u16_div" class=""></div>
      <input id="u16_input" name="reCheck" type="password" value="" class="u16_input"/>
    </div>


    <div id="u17" class="ax_default label">
      <div id="u17_div" class=""></div>
      <div id="u17_text" class="text ">
        <p><span>确认密码</span></p>
      </div>
    </div>


    <div id="u13" class="ax_default checkbox">
      <label id="u13_input_label" for="u13_input" style="position: absolute; left: 0px;">
        <img id="u13_img" class="img " src="images/register/u13.svg"/>
        <div id="u13_text" class="text ">
          <p><span>在这台电脑上记住</span></p>
        </div>
      </label>
      <input id="u13_input" type="checkbox" value="checkbox"/>
    </div>


    <div id="u14" class="ax_default _图片_">
      <img id="u14_img" class="img " src="images/register/regen/u5.svg"/>
      <div id="u14_text" class="text " style="display:none; visibility: hidden">
        <p></p>
      </div>
    </div>


    <div id="u15" class="ax_default _一级标题">
      <div id="u15_div" class=""></div>
      <div id="u15_text" class="text ">
        <p><span>注册</span></p>
      </div>
    </div>


    <div id="u18" style="border: transparent 1px;">
      <div>

      </div>
    </div>


    </input>
  </div>
  <input name="check" type="submit" value="true" id="u18_text" class="text "style="color: transparent;
        background:url(images/register/regen/register.png);border-radius: 5px;background-size: cover;width:134px; height:40px;
        position:absolute;left:396px;top:690px;width:134px;">
  <input type="button" onclick="location='session.jsp'" id="u19"
         style="border-radius: 5px;background-size: cover;background-image: url(images/register/regen/backLogin.png);position:absolute;left:556px;top:690px;width:134px;
  height:40px;">
  </br>
  </br>
  <script src="resources/scripts/axure/ios.js"></script>
</form>
</body>
</html>
