<!DOCTYPE html>
<%@ page import="com.database.DatabaseBean" %>
<%@ page import="com.database.sort" %>
<%@ page import="com.database.UserData" %>
<%@ page import="com.database.UserLibData" %>
<%@ page import="java.util.Vector" %>
<%@ page import="com.database.GameData" %>
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
  %>
  <%
    int UserID=(int)session.getAttribute("UserID");
    DatabaseBean dbb=new DatabaseBean();
    ud=dbb.selectUserData("select * from user where UserID="+UserID);

  %>


  <!-- Unnamed (文本 框) -->
  <div id="u48" class="ax_default text_field">
    <div id="u48_div" class=""></div>
    <input style="color: #6d6d6d" id="u48_input" type="text" name="keyWord" value="请输入游戏名" onfocus="this.value='';"   οnblur="if (this.value == '') {this.value = '请输入游戏名';}" class="u8_input"/>
  </div>

  <!-- Unnamed (矩形) -->
  <div id="u49" class="ax_default label">
    <div id="u49_div" class=""></div>
    <div id="u49_text" class="text ">
      <input name="search" value="搜索" type="button" style="border: 0px;border-radius: 3px;width: 40px;height: 25px ;background-color: #008dcb;color:#ffffff "></input>
    </div>
  </div>
  
  <!-- Unnamed (矩形) -->
  <div id="u50" class="ax_default label">
    <div id="u50_div" class=""></div>
    <div id="u50_text" class="text ">
      <p><span>排序依据</span></p>
    </div>
  </div>
  
  <!-- Unnamed (矩形) -->
  <div id="u51" class="ax_default box_1">
    <div id="u51_div" class=""></div>
    <div id="u51_text" class="text " style="display:none; visibility: hidden">
      <p></p>
    </div>
  </div>
  
  <!-- Unnamed (下拉列表) -->
  <div id="u52" class="ax_default droplist">
    <div id="u52_div" class=""></div>
    <select id="u52_input" class="u52_input" name="storeOrder" onchange="submitForm();">
      <option class="u52_input_option" value="最近热门">最近热门</option>
      <option class="u52_input_option" value="发行日期">发行日期</option>
      <option class="u52_input_option" value="最低价格">最低价格</option>
      <option class="u52_input_option" value="用户评分">用户评分</option>
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
    System.out.println("有"+count+"个游戏");
    for (int i=0;i<count;i++){
      int ti=i*105+328;//到顶部的距离
  %>

  <div style="top:<%=ti%>px;border-width: 0px;position: absolute;left: 118px;width: 845px;  height: 99px;  background-color: rgba(22, 32, 45, 1);">
    <!-- 背景 (矩形) -->
    <div class="background"></div>
    
    <!-- Unnamed (矩形) -->
    <div class="name">
      <a onclick="location='detail_s.jsp?id=<%=res.elementAt(i).getAppID()%>'"><span><%=res.elementAt(i).getName()%></span></a>
    </div>
    
    <!-- 详细信息 (动态面板) -->
    <div class="detail">
      <!-- 详细信息按钮 (矩形) -->
      <div class="ax_default primary_button detButton"> <img class="detButton_img" onclick="location='detail_s.jsp?id=<%=res.elementAt(i).getAppID()%>'" src="images/library/particulars.png"/>
        <div class="text detButton_text">
        </div>
      </div>
      
      <!-- 详细信息图标 (形状) -->
      <div class="detIcon"> <img class="detIcon_img" onclick="location='detail_s.jsp?id=<%=res.elementAt(i).getAppID()%>'" src="images/library/lu.png"/> </div>
    </div>
    
    <!-- Header (图片 ) -->
    <div class="header"> <img class ="header_img" src="<%=res.elementAt(i).getHeader()%>"/> </div>
    
    <!-- 购买按钮 (动态面板) -->
    <div class="purchase"> 
      <!-- 背景1 (矩形) -->
      <div class="purBackground">
        <div class="purBackground_div"></div>
      </div>
      
      <!-- 背景2 (矩形) -->
      <div class="purBackground2">
        <div class="purBackground_2_div"></div>
      </div>
      
      <!-- 绿色按钮 (动态面板) -->
      <div class="purButton">
        <div class="purButtonState" data-label="State1" style="">
          <div class="purButtonContent"> 
            
            <!-- 购买 文字 (矩形) -->
            <div class="ax_default primary_button purBT">
              <input type="submit" name="buy" value="<%=res.elementAt(i).getAppID()%>" style="color: transparent;" class="purBT_div"></input>
              <div class="text purBT_text">
                <p><span>&nbsp;&nbsp; &nbsp; 购买</span></p>
              </div>
            </div>
            
            <!-- 购物车标志 (形状) -->
            <div class="ax_default icon purBTIcon"> <img class="img purBTIcon_img" src="images/store/u65.svg"/> </div>
          </div>
        </div>
      </div>
      
      <!-- 价格 (矩形) -->
      <div class="ax_default label prize">
        <div class="prize_div"></div>
        <div class="text prize_text">
          <p><span>￥ <%=res.elementAt(i).getPrice()%></span></p>
        </div>
      </div>
    </div>
  </div>
  <%}%>
  <!-- Unnamed (矩形) -->
  <div id="u67" class="ax_default _一级标题">
    <div id="u67_div" class=""></div>
    <div id="u67_text" class="text ">
      <p><span>商店</span></p>
    </div>
  </div>
  
  <!-- Unnamed (形状) -->
  <div id="u68" class="ax_default icon"> <img onclick="location='library.jsp'" id="u68_img" class="img " src="images/store/u68.svg"/>
    <div id="u68_text" class="text " style="display:none; visibility: hidden">
      <p></p>
    </div>
  </div>
  
  <!-- Unnamed (矩形) -->
  <div id="u69" class="ax_default label">
    <div id="u69_div" class=""></div>
    <div onclick="location='library.jsp'" id="u69_text" class="text ">
      <p><span>库</span></p>
    </div>
  </div>
  
  <!-- Unnamed (SVG) -->
  <div id="u70" class="ax_default _图片_"> <img id="u70_img" class="img " src="images/login/u7.svg"/>
    <div id="u70_text" class="text " style="display:none; visibility: hidden">
      <p></p>
    </div>
  </div>
  
  <!-- Unnamed (矩形) -->
  <div id="u71" class="ax_default label">
    <div id="u71_div" class=""></div>
    <div id="u71_text" class="text ">
      <p onclick="location='session.jsp'"><span>注销</span></p>
    </div>
  </div>
  
  <!-- Unnamed (形状) -->
  <div id="u72" class="ax_default icon"> <img onclick="location='session.jsp'" id="u72_img" class="img " src="images/library/u38.svg"/>
    <div id="u72_text" class="text " style="display:none; visibility: hidden">
      <p></p>
    </div>
  </div>
	
	<!-- Unnamed (矩形) -->
      <div id="u73" class="ax_default label">
        <div id="u73_div" class=""></div>
        <div id="u73_text" class="text ">
          <p><span><%="钱包余额：￥"+ud.elementAt(0).getBalance()%></span></p>
        </div>
      </div>
	
	<!-- Unnamed (矩形) -->
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
