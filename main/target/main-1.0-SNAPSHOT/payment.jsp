<%@ page import="java.util.Vector" %>
<%@ page import="com.database.UserData" %>
<%@ page import="com.database.DatabaseBean" %>
<%@ page import="com.database.Client" %>
<!DOCTYPE html>
<html>
<head>
  <title>Payment</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
  <link href="data/styles.css" type="text/css" rel="stylesheet"/>
  <link href="files/payment/styles.css" type="text/css" rel="stylesheet"/>
  <script src="data/document.js"></script>
  <script src="files/payment/data.js"></script>
  <script type="text/javascript">
    $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
    $axure.utilas.getOtherPath = function() { return 'resources/Other.html'; };
    $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
  </script>
</head>
<body>
<div id="base" class="">
  <form action="changeBalance" method="post">

    <div id="u75" class="ax_default box_1">
      <div id="u75_div" class=""></div>
      <div id="u75_text" class="text " style="display:none; visibility: hidden">
        <p></p>
      </div>
    </div>
<%!
Vector<UserData> ud;
Client client=new Client();
%>
    <%
      client.start();
      int UserID=(int)session.getAttribute("UserID");
      ud=client.sendBasicReqForUserData("select * from user where UserID="+UserID);
    %>

    <div id="u76" class="ax_default _一级标题">
      <div id="u76_div" class=""></div>
      <div style="top: -20px;" id="u76_text" class="text ">
        <p><span>为您的钱包充值</span></p>
      </div>
    </div>

    <div id="u77" class="ax_default _图片_">
      <img id="u77_img" class="img " onclick="location='https://store.steampowered.com/'" src="images/login/u7.svg"/>
      <div id="u77_text" class="text " style="display:none; visibility: hidden">
        <p></p>
      </div>
    </div>

    <div id="u78" class="ax_default label">
      <div id="u78_div" class=""></div>
      <div style="top: -20px;" id="u78_text" class="text ">
        <p onclick="location='session.jsp'"><span>注销</span></p>
      </div>
    </div>

    <div id="u79" class="ax_default icon">
      <img id="u79_img" onclick="location='session.jsp'" class="img " src="images/library/u38.svg"/>
      <div id="u79_text" class="text " style="display:none; visibility: hidden">
        <p></p>
      </div>
    </div>

    <div id="u80" class="ax_default label">
      <div id="u80_div" class=""></div>
      <div id="u80_text" class="text ">
        <p><span><%="钱包余额：￥"+ud.elementAt(0).getBalance()%></span></p>
      </div>
    </div>

    <div id="u81" class="ax_default _图片_">
      <img id="u81_img" onclick="location='https://baike.baidu.com/item/%E5%9B%BD%E5%AE%B6%E5%8F%8D%E8%AF%88%E4%B8%AD%E5%BF%83/55975989'" class="img " src="images/payment/QR.png"/>
      <div id="u81_text" class="text " style="display:none; visibility: hidden">
        <p></p>
      </div>
    </div>

    <div id="u82" class="ax_default">
      <div id="u82_state0" class="panel_state" data-label="State1" style="">
        <div id="u82_state0_content" class="panel_state_content">

          <div id="u83" class="ax_default box_2">
            <div id="u83_div" class=""></div>
            <div id="u83_text" class="text " style="display:none; visibility: hidden">
              <p></p>
            </div>
          </div>


          <div id="u84" class="ax_default _一级标题">
            <div id="u84_div" class=""></div>
            <div style="top: -11px;" id="u84_text" class="text ">
              <p>充值￥32</p>

            </div>
          </div>


          <div id="u85" class="ax_default box_2">
            <div id="u85_div" class=""></div>
            <div id="u85_text" class="text " style="display:none; visibility: hidden">
              <p></p>
            </div>
          </div>


          <div>
            <input type="submit" name="pay" value="32"style="color: transparent;
            background-image: url(images/payment/purchase.png);background-size: cover;border-radius: 5px;position:absolute;
  left:326px;color: transparent;
  top:35px;
  width:81px;
  height:31px;"></input>
            <div style="z-index: 10;top: -14px;right: 20px;">
            <p></p>
            </div>
          </div>

          <div id="u87" class="ax_default _一级标题">
            <div id="u87_div" class=""></div>
            <div style="top:-14px;" id="u87_text" class="text ">
              <p><span>￥32</span></p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Unnamed (动态面板) -->
    <div id="u88" class="ax_default">
      <div id="u88_state0" class="panel_state" data-label="State1" style="">
        <div id="u88_state0_content" class="panel_state_content">

          <!-- Unnamed (矩形) -->
          <div id="u89" class="ax_default box_2">
            <div id="u89_div" class=""></div>
            <div id="u89_text" class="text " style="display:none; visibility: hidden">
              <p></p>
            </div>
          </div>

          <!-- Unnamed (矩形) -->
          <div id="u90" class="ax_default _一级标题">
            <div id="u90_div" class=""></div>
            <div style="top: -11px;" id="u90_text" class="text ">
              <p><span>充值￥64</span></p>
            </div>
          </div>

          <!-- Unnamed (矩形) -->
          <div id="u91" class="ax_default box_2">
            <div id="u91_div" class=""></div>
            <div id="u91_text" class="text " style="display:none; visibility: hidden">
              <p></p>
            </div>
          </div>


          <div>
            <input type="submit" name="pay" value="64"style="color: transparent;color: transparent;
            background-image: url(images/payment/purchase.png);background-size: cover;border-radius: 5px;position:absolute;
  left:326px;color: transparent;
  top:35px;
  width:81px;
  height:31px;"></input>
            <p style="z-index: 10"></p>
          </div>

          <!-- Unnamed (矩形) -->
          <div id="u93" class="ax_default _一级标题">
            <div id="u93_div" class=""></div>
            <div style="top: -14px" id="u93_text" class="text ">
              <p><span>￥64</span></p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div id="u94" class="ax_default">
      <div id="u94_state0" class="panel_state" data-label="State1" style="">
        <div id="u94_state0_content" class="panel_state_content">

          <div id="u95" class="ax_default box_2">
            <div id="u95_div" class=""></div>
            <div id="u95_text" class="text " style="display:none; visibility: hidden">
              <p></p>
            </div>
          </div>

          <div id="u96" class="ax_default _一级标题">
            <div id="u96_div" class=""></div>
            <div style="top: -11px;" id="u96_text" class="text ">
              <p><span>充值￥128</span></p>
            </div>
          </div>

          <div id="u97" class="ax_default box_2">
            <div id="u97_div" class=""></div>
            <div id="u97_text" class="text " style="display:none; visibility: hidden">
              <p></p>
            </div>
          </div>

          <div>
            <input type="submit" name="pay" value="128"style="color: transparent;color: transparent;
            background-image: url(images/payment/purchase.png);background-size: cover;border-radius: 5px;position:absolute;
  left:326px;color: transparent;
  top:35px;
  width:81px;
  height:31px;" ></input>
            <p style="z-index: 10;"></p>
            </input>
          </div>

          <div id="u99" class="ax_default _一级标题">
            <div id="u99_div" class=""></div>
            <div style="top: -14px;" id="u99_text" class="text ">
              <p><span>￥128</span></p>
            </div>
          </div>
        </div>
      </div>
    </div>


    <div id="u100" class="ax_default">
      <div id="u100_state0" class="panel_state" data-label="State1" style="">
        <div id="u100_state0_content" class="panel_state_content">


          <div id="u101" class="ax_default box_2">
            <div id="u101_div" class=""></div>
            <div id="u101_text" class="text " style="display:none; visibility: hidden">
              <p></p>
            </div>
          </div>


          <div id="u102" class="ax_default _一级标题">
            <div id="u102_div" class=""></div>
            <div style="top: -11px;" id="u102_text" class="text ">
              <p><span>充值￥324</span></p>
            </div>
          </div>


          <div id="u103" class="ax_default box_2">
            <div id="u103_div" class=""></div>
            <div id="u103_text" class="text " style="display:none; visibility: hidden">
              <p></p>
            </div>
          </div>


          <div>
            <input type="submit" name="pay" value="324"  style="color: transparent;color: transparent;
            background-image: url(images/payment/purchase.png);background-size: cover;border-radius: 5px;position:absolute;
  left:326px;color: transparent;
  top:35px;
  width:81px;
  height:31px;"></input>
            <p style="z-index: 10"></p>
          </div>


          <div id="u105" class="ax_default _一级标题">
            <div id="u105_div" class=""></div>
            <div style="top: -14px;" id="u105_text" class="text ">
              <p><span>￥324</span></p>
            </div>
          </div>
        </div>
      </div>
    </div>


    <div id="u106" class="ax_default">
      <div id="u106_state0" class="panel_state" data-label="State1" style="">
        <div id="u106_state0_content" class="panel_state_content">


          <div id="u107" class="ax_default box_2">
            <div id="u107_div" class=""></div>
            <div id="u107_text" class="text " style="display:none; visibility: hidden">
              <p></p>
            </div>
          </div>

          <div id="u108" class="ax_default _一级标题">
            <div id="u108_div" class=""></div>
            <div style="top: -11px;" id="u108_text" class="text ">
              <p><span>充值￥648</span></p>
            </div>
          </div>

          <div id="u109" class="ax_default box_2">
            <div id="u109_div" class=""></div>
            <div id="u109_text" class="text " style="display:none; visibility: hidden">
              <p></p>
            </div>
          </div>

          <div>
            <input type="submit" name="pay" value="648" id="u110_div" class="" style="color: transparent;color: transparent;
            background-image: url(images/payment/purchase.png);background-size: cover;border-radius: 5px;position:absolute;
  left:326px;color: transparent;
  top:35px;
  width:81px;
  height:31px;"></input>
            <p style="z-index: 10"></p>
          </div>

          <div id="u111" class="ax_default _一级标题">
            <div id="u111_div" class=""></div>
            <div style="top: -14px;" id="u111_text" class="text ">
              <p><span>￥648</span></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </form>

  <div id="u112" class="ax_default icon">
    <img onclick="location='store.jsp'" id="u112_img" class="img " src="images/payment/u112.svg"/>
    <div id="u112_text" class="text " style="display:none; visibility: hidden">
      <p></p>
    </div>
  </div>

  <div id="u113" class="ax_default label">
    <div id="u113_div" class=""></div>
    <div style="top: -20px;" onclick="location='store.jsp'" id="u113_text" class="text ">
      <p><span>返回</span></p>
    </div>
  </div>
</div>
<script src="resources/scripts/axure/ios.js"></script>
</body>
</html>
