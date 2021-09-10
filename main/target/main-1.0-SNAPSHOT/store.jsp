<!DOCTYPE html>
<%@ page import="com.database.DatabaseBean" %>
<%@ page import="com.database.UserData" %>
<%@ page import="java.util.Vector" %>
<%@ page import="com.database.GameData" %>
<%@ page import="com.database.Client" %>
<html>
<head>
<title>Store</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
<link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
<link href="data/styles.css" type="text/css" rel="stylesheet"/>
<link href="files/store/styles.css" type="text/css" rel="stylesheet"/>
<script src="resources/scripts/jquery-3.2.1.min.js"></script> 
<script src="resources/scripts/messagecenter.js"></script>
<script src="data/document.js"></script>
<script src="files/store/data.js"></script> 
<script type="text/javascript">
      $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
    </script>
</head>
<body>
<form action="changeBalance" method="post" id="storeForm">
<div id="base" class="">

  <%!
    Vector<UserData> ud;
    Vector<String> orderInfo=new Vector<String>(4);
    String storeKeyWord;
    Client client=new Client();
  %>
  <%
    client.start();
    String temp= (String) session.getAttribute("storeOrderOption");
    if(temp==null)temp="";
    orderInfo.clear();
    orderInfo.addElement(temp.equals("最近热门")?" selected":"");
    orderInfo.addElement(temp.equals("发行日期")?" selected":"");
    orderInfo.addElement(temp.equals("最低价格")?" selected":"");
    orderInfo.addElement(temp.equals("用户评分")?" selected":"");

    int UserID=(int)session.getAttribute("UserID");
    ud=client.sendBasicReqForUserData("select * from user where UserID="+UserID);
    storeKeyWord=(String)session.getAttribute("storeKeyWord");
    if(storeKeyWord==null)
      storeKeyWord="";

  %>



  <div id="u48" class="ax_default text_field">
    <div id="u48_div" class=""></div>
    <input style="color: #6d6d6d" id="u48_input" type="text" name="keyWord" value="<%=storeKeyWord==""?"请输入游戏名":storeKeyWord%>" onfocus="this.value='';"   οnblur="if (this.value == '') {this.value = '请输入游戏名';}" class="u8_input"/>
  </div>

  <div id="u49" class="ax_default label">
    <div id="u49_div" class=""></div>
    <div id="u49_text" class="text ">
      <input name="search" value="搜索" type="submit" style="border-radius: 3px;width: 40px;height: 25px ;background-color: #008dcb;color:#ffffff "></input>
    </div>
  </div>

  <div id="u50" class="ax_default label">
    <div id="u50_div" class=""></div>
    <div id="u50_text" class="text ">
      <p><span>排序依据</span></p>
    </div>
  </div>

  <div id="u51" class="ax_default box_1">
    <div id="u51_div" class=""></div>
    <div id="u51_text" class="text " style="display:none; visibility: hidden">
      <p></p>
    </div>
  </div>

  <div id="u52" class="ax_default droplist">
    <div id="u52_div" class=""></div>
    <select id="u52_input" class="u52_input" name="storeOrder" onchange="submitForm();">
      <option class="u52_input_option" value="最近热门" <%=orderInfo.elementAt(0)%>>最近热门</option>
      <option class="u52_input_option" value="发行日期" <%=orderInfo.elementAt(1)%>>发行日期</option>
      <option class="u52_input_option" value="最低价格" <%=orderInfo.elementAt(2)%>>最低价格</option>
      <option class="u52_input_option" value="用户评分" <%=orderInfo.elementAt(3)%>>用户评分</option>
    </select>
  </div>

  <script type="text/javascript">
    function submitForm() {
      $("#storeForm").submit();
    }
  </script>

  <%!
    int count=0;
    Vector<GameData> res=new Vector<GameData>();

  %>
  <%
    res=(Vector<GameData>)session.getAttribute("store");
    if(res!=null)
      count=res.size();
    else count=0;
    for (int i=0;i<count;i++){
      int ti=i*105+328;
  %>

  <div style="top:<%=ti%>px;border-width: 0px;position: absolute;left: 118px;width: 845px;  height: 99px;  background-color: rgba(22, 32, 45, 1);">

    <div class="background"></div>
    

    <div class="name">
      <a onclick="location='detail_s.jsp?id=<%=res.elementAt(i).getAppID()%>'"><span><%=res.elementAt(i).getName()%></span></a>
    </div>
    

    <div class="detail">

      <div class="ax_default primary_button detButton"> <input
              type="button" class="detButton_img" onclick="location='detail_s.jsp?id=<%=res.elementAt(i).getAppID()%>'"style="background-size: cover;
              background-image: url(images/library/particulars.png);border-radius: 5px;"/>
      </div>

    </div>

    <div class="header"> <img class ="header_img" src="<%=res.elementAt(i).getHeader()%>"/> </div>

    <div class="purchase"> 

      <div class="purBackground">
        <div class="purBackground_div"></div>
      </div>

      <div class="purBackground2">
        <div class="purBackground_2_div"></div>
      </div>

      <div class="purButton">
        <div class="purButtonState" data-label="State1" style="">
          <div class="purButtonContent"> 

            <div>
              <input type="submit" name="buy" value="<%=res.elementAt(i).getAppID()%>" style="
              color: transparent;background-image: url(images/store/purchase.png);background-size: cover;width:131px;height:37px;border-radius: 5px;" ></input>
              <div class="text purBT_text">
                <p><span>&nbsp;&nbsp; &nbsp; </span></p>
              </div>
            </div>


          </div>
        </div>
      </div>

      <div class="ax_default label prize">
        <div class="prize_div"></div>
        <div class="text prize_text">
          <p><span>￥ <%=res.elementAt(i).getPrice()%></span></p>
        </div>
      </div>
    </div>
  </div>
  <%}%>

  <div id="u67" class="ax_default _一级标题">
    <div id="u67_div" class=""></div>
    <div id="u67_text" class="text ">
      <p><span>商店</span></p>
    </div>
  </div>

  <div id="u68" class="ax_default icon"> <img onclick="location='library.jsp'" id="u68_img" class="img " src="images/store/u68.svg"/>
    <div id="u68_text" class="text " style="display:none; visibility: hidden">
      <p></p>
    </div>
  </div>

  <div id="u69" class="ax_default label">
    <div id="u69_div" class=""></div>
    <div onclick="location='library.jsp'" id="u69_text" class="text ">
      <p><span>库</span></p>
    </div>
  </div>

  <div id="u70" class="ax_default _图片_"> <img id="u70_img" class="img " src="images/login/u7.svg"/>
    <div id="u70_text" class="text " style="display:none; visibility: hidden">
      <p></p>
    </div>
  </div>

  <div id="u71" class="ax_default label">
    <div id="u71_div" class=""></div>
    <div id="u71_text" class="text ">
      <p onclick="location='session.jsp'"><span>注销</span></p>
    </div>
  </div>

  <div id="u72" class="ax_default icon"> <img onclick="location='session.jsp'" id="u72_img" class="img " src="images/library/u38.svg"/>
    <div id="u72_text" class="text " style="display:none; visibility: hidden">
      <p></p>
    </div>
  </div>

      <div id="u73" class="ax_default label">
        <div id="u73_div" class=""></div>
        <div id="u73_text" class="text ">
          <p><span><%="钱包余额：￥"+ud.elementAt(0).getBalance()%></span></p>
        </div>
      </div>

      <div id="u74" class="ax_default label">
        <div id="u74_div" class=""></div>
        <div onclick="location='payment.jsp'" id="u74_text" class="text ">
          <p><span style="text-decoration:underline ;">充值</span></p>
        </div>
      </div>
</div>
<script src="resources/scripts/axure/ios.js"></script>
</form>
</body>
</html>
