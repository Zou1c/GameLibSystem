<%@ page import="com.database.UserLibData" %>
<%@ page import="java.util.Vector" %>
<%@ page import="com.database.GameData" %>
<%--@ page import="javax.xml.registry.infomodel.User" --%>
<!DOCTYPE html>
<html>
  <head>
    <title>Detail #2</title>
    <meta name="referrer" content="never">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="files/detail__2/styles.css" type="text/css" rel="stylesheet"/>
    <script src="resources/scripts/jquery-3.2.1.min.js"></script>
    <script src="resources/scripts/axure/axQuery.js"></script>
    <script src="resources/scripts/axure/globals.js"></script>
    <script src="resources/scripts/axutils.js"></script>
    <script src="resources/scripts/axure/annotation.js"></script>
    <script src="resources/scripts/axure/axQuery.std.js"></script>
    <script src="resources/scripts/axure/doc.js"></script>
    <script src="resources/scripts/messagecenter.js"></script>
    <script src="resources/scripts/axure/events.js"></script>
    <script src="resources/scripts/axure/recording.js"></script>
    <script src="resources/scripts/axure/action.js"></script>
    <script src="resources/scripts/axure/expr.js"></script>
    <script src="resources/scripts/axure/geometry.js"></script>
    <script src="resources/scripts/axure/flyout.js"></script>
    <script src="resources/scripts/axure/model.js"></script>
    <script src="resources/scripts/axure/repeater.js"></script>
    <script src="resources/scripts/axure/sto.js"></script>
    <script src="resources/scripts/axure/utils.temp.js"></script>
    <script src="resources/scripts/axure/variables.js"></script>
    <script src="resources/scripts/axure/drag.js"></script>
    <script src="resources/scripts/axure/move.js"></script>
    <script src="resources/scripts/axure/visibility.js"></script>
    <script src="resources/scripts/axure/style.js"></script>
    <script src="resources/scripts/axure/adaptive.js"></script>
    <script src="resources/scripts/axure/tree.js"></script>
    <script src="resources/scripts/axure/init.temp.js"></script>
    <script src="resources/scripts/axure/legacy.js"></script>
    <script src="resources/scripts/axure/viewer.js"></script>
    <script src="resources/scripts/axure/math.js"></script>
    <script src="resources/scripts/axure/jquery.nicescroll.min.js"></script>
    <script src="data/document.js"></script>
    <script src="files/detail__2/data.js"></script>
    <script type="text/javascript">
      $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
    </script>
  </head>
  <body>
  <%!
    GameData gd=null;

  %>

  <%
    if(request.getParameter("id")!=null&&request.getParameter("id")!="") {
      int id = Integer.parseInt(request.getParameter("id"));
      Vector<GameData> res=(Vector<GameData>)session.getAttribute("store");
      for(GameData i :res){
        if(i.getAppID()==id){
          gd=i;
          break;
        }
      }
    }
    else{
      gd=null;//默认
    }

  %>
    <div id="base" class="">

      <!-- Unnamed (动态面板) -->
      <div id="u95" class="ax_default">
        <div id="u95_state0" class="panel_state" data-label="State1" style="">
          <div id="u95_state0_content" class="panel_state_content">

            <!-- Unnamed (矩形) -->
            <div id="u96" class="ax_default box_2">
              <div id="u96_div" class=""></div>
              <div id="u96_text" class="text " style="display:none; visibility: hidden">
                <p></p>
              </div>
            </div>

            <!-- 好评率 -->
            <div id="u97" class="ax_default label">
              <div id="u97_div" class=""></div>
              <div id="u97_text" class="text ">
                <p><span><%=gd.getRate2()%></span></p>
              </div>
            </div>

            <!-- 好评/差评数 -->
            <div id="u98" class="ax_default label">
              <div id="u98_div" class=""></div>
              <div id="u98_text" class="text ">
                <p><span style="color:#A0FF05;">↑<%=gd.getPositiveReviews()%></span><span style="color:#FFFFFF;"> </span><span style="color:#DC1F41;">↓<%=gd.getNegativeReviews()%></span></p>
              </div>
            </div>

            <!-- emoji -->
            <%
              String emojiAdd_s="images/detail__2/";
              int rate= (int) (gd.getRate()*100);
              if(rate>95)
                emojiAdd_s+="a1.png";
              else if(rate>80)
                emojiAdd_s+="A7S2.png";
              else if (rate>70)
                emojiAdd_s+="A7S3.png";
              else if (rate>60)
                emojiAdd_s+="A7M4.png";
              else if (rate>40)
                emojiAdd_s+="EOSR5.png";
              else
                emojiAdd_s+="EOSR6.png";
            %>
            <div id="u99" class="ax_default icon">
              <img id="u99_img" class="img " src="<%=emojiAdd_s%>>"/>
              <div id="u99_text" class="text " style="display:none; visibility: hidden">
                <p></p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- steam图标 -->
      <div id="u100" class="ax_default _图片_">
        <img id="u100_img" class="img " src="images/login/u7.svg"/>
        <div id="u100_text" class="text " style="display:none; visibility: hidden">
          <p></p>
        </div>
      </div>

      <!-- 游戏名 -->
      <div id="u101" class="ax_default label">
        <div id="u101_div" class=""></div>
        <div id="u101_text" class="text ">
          <p><span><%=gd.getName()%></span></p>
        </div>
      </div>

      <!-- Unnamed (表格) -->
      <div id="u102" class="ax_default">

        <!-- Unnamed (单元格) -->
        <div id="u103" class="ax_default table_cell">
          <img id="u103_img" class="img " src="images/detail__1/u61.png"/>
          <div id="u103_text" class="text ">
            <p><span>App ID</span></p>
          </div>
        </div>

        <!-- Unnamed (单元格) -->
        <div id="u104" class="ax_default table_cell">
          <img id="u104_img" class="img " src="images/detail__1/u62.png"/>
          <div id="u104_text" class="text ">
            <p><span>1225330</span></p>
          </div>
        </div>

        <!-- Unnamed (单元格) -->
        <div id="u105" class="ax_default table_cell">
          <img id="u105_img" class="img " src="images/detail__1/u61.png"/>
          <div id="u105_text" class="text ">
            <p><span>开发商</span></p>
          </div>
        </div>

        <!-- 开发商 -->
        <div id="u106" class="ax_default table_cell">
          <img id="u106_img" class="img " src="images/detail__1/u62.png"/>
          <div id="u106_text" class="text ">
            <p><span><%=gd.getDeveloper()%></span></p>
          </div>
        </div>

        <!-- Unnamed (单元格) -->
        <div id="u107" class="ax_default table_cell">
          <img id="u107_img" class="img " src="images/detail__1/u61.png"/>
          <div id="u107_text" class="text ">
            <p><span>发行商</span></p>
          </div>
        </div>

        <!-- 发行商 -->
        <div id="u108" class="ax_default table_cell">
          <img id="u108_img" class="img " src="images/detail__1/u62.png"/>
          <div id="u108_text" class="text ">
            <p><span>&nbsp;&nbsp; &nbsp; <%=gd.getPublisher()%></span></p>
          </div>
        </div>

        <!-- Unnamed (单元格) -->
        <div id="u109" class="ax_default table_cell">
          <img id="u109_img" class="img " src="images/detail__1/u61.png"/>
          <div id="u109_text" class="text ">
            <p><span>发布日期</span></p>
          </div>
        </div>

        <!-- 发行日期 -->
        <div id="u110" class="ax_default table_cell">
          <img id="u110_img" class="img " src="images/detail__1/u62.png"/>
          <div id="u110_text" class="text ">
            <p><span><%=gd.getReleaseDate()%></span></p>
          </div>
        </div>

        <!-- Unnamed (单元格) -->
        <div id="u111" class="ax_default table_cell">
          <img id="u111_img" class="img " src="images/detail__1/u69.png"/>
          <div id="u111_text" class="text ">
            <p><span>最后更新</span></p>
          </div>
        </div>

        <!-- 最后更新 -->
        <div id="u112" class="ax_default table_cell">
          <img id="u112_img" class="img " src="images/detail__1/u70.png"/>
          <div id="u112_text" class="text ">
            <p><span><%=gd.getLastUpDate()%></span></p>
          </div>
        </div>
      </div>

      <!-- 简介 -->
      <div id="u113" class="ax_default _文本段落">
        <div id="u113_div" class=""></div>
        <div id="u113_text" class="text ">
          <p><span><%=gd.getDescription()%></span></p>
        </div>
      </div>



      <!-- Unnamed (矩形) -->
      <div id="u115" class="ax_default label">
        <div id="u115_div" class=""></div>
        <div id="u115_text" class="text ">
          <p onclick="location='session.jsp'"><span>注销</span></p>
        </div>
      </div>

      <!-- Unnamed (形状) -->
      <div id="u116" class="ax_default icon">
        <img onclick="location='store.jsp'" id="u116_img" class="img " src="images/detail__1/u77.svg"/>
        <div id="u116_text" class="text " style="display:none; visibility: hidden">
          <p></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u117" class="ax_default label">
        <div id="u117_div" class=""></div>
        <div id="u117_text" class="text ">
          <p onclick="location='store.jsp'" ><span>返回</span></p>
        </div>
      </div>

      <!-- Unnamed (形状) -->
      <div id="u118" class="ax_default icon">
        <img onclick="location='session.jsp'" id="u118_img" class="img " src="images/library/u38.svg"/>
        <div id="u118_text" class="text " style="display:none; visibility: hidden">
          <p></p>
        </div>
      </div>

      <!-- Unnamed (表格) -->
      <div id="u119" class="ax_default">

        <!-- Unnamed (单元格) -->
        <div id="u120" class="ax_default table_cell">
          <img id="u120_img" class="img " src="images/detail__1/u61.png"/>
          <div id="u120_text" class="text ">
            <p><span>游戏时长</span></p>
          </div>
        </div>

        <!-- Unnamed (单元格) -->
        <div id="u121" class="ax_default table_cell">
          <img id="u121_img" class="img " src="images/detail__1/u62.png"/>
          <div id="u121_text" class="text ">
            <p><span><%=0%> 小时</span></p>
          </div>
        </div>

        <!-- Unnamed (单元格) -->
        <div id="u122" class="ax_default table_cell">
          <img id="u122_img" class="img " src="images/detail__1/u69.png"/>
          <div id="u122_text" class="text ">
            <p><span>磁盘空间</span></p>
          </div>
        </div>

        <!-- Unnamed (单元格) -->
        <div id="u123" class="ax_default table_cell">
          <img id="u123_img" class="img " src="images/detail__1/u70.png"/>
          <div id="u123_text" class="text ">
            <p><span><%=gd.getSize()%></span></p>
          </div>
        </div>
      </div>

      <!-- Unnamed (动态面板) -->
      <div id="u124" class="ax_default">
        <div id="u124_state0" class="panel_state" data-label="State1" style="">
          <div id="u124_state0_content" class="panel_state_content">

            <!-- Unnamed (矩形) -->
            <div id="u125" class="ax_default box_2">
              <div id="u125_div" class=""></div>
              <div id="u125_text" class="text " style="display:none; visibility: hidden">
                <p></p>
              </div>
            </div>

            <!-- Unnamed (矩形) -->
            <div id="u126" class="ax_default label">
              <div id="u126_div" class=""></div>
              <div id="u126_text" class="text ">
                <p><span><%=gd.getInGame()%></span></p>
              </div>
            </div>

            <!-- Unnamed (矩形) -->
            <div id="u127" class="ax_default label">
              <div id="u127_div" class=""></div>
              <div id="u127_text" class="text ">
                <p><span>游戏中</span></p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u128" class="ax_default _文本段落">
        <div id="u128_div" class=""></div>
        <div id="u128_text" class="text ">
          <%=gd.getAbout()%>
          </div>
      </div>

      <!-- Unnamed (线段) -->
      <div id="u129" class="ax_default line">
        <img id="u129_img" class="img " src="images/detail__1/u90.svg"/>
        <div id="u129_text" class="text " style="display:none; visibility: hidden">
          <p></p>
        </div>
      </div>

      <!-- Unnamed (动态面板) -->
      <div id="u130" class="ax_default">
        <div id="u130_state0" class="panel_state" data-label="State1" style="">
          <div id="u130_state0_content" class="panel_state_content">



          </div>
        </div>
      </div>

      <!-- 游戏图片 -->
      <div id="u133" class="ax_default _图片_">
        <img id="u133_img" class="img " src="<%=gd.getHeader()%>"/>
        <div id="u133_text" class="text " style="display:none; visibility: hidden">
          <p></p>
        </div>
      </div>

      <!-- Unnamed (图片 ) -->
      <div id="u134" class="ax_default _图片_">
        <img id="u134_img" class="img " src="<%=gd.getIcon()%>"/>
        <div id="u134_text" class="text " style="display:none; visibility: hidden">
          <p></p>
        </div>
      </div>
    </div>
    <script src="resources/scripts/axure/ios.js"></script>
  </body>
</html>
