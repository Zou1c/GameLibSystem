<%@ page import="com.database.UserLibData" %>
<%@ page import="java.util.Vector" %>
<%--@ page import="javax.xml.registry.infomodel.User" --%>
<!DOCTYPE html>
<html>
  <head>
    <title>Detail #2</title>
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
    UserLibData uld=null;

  %>

  <%
    if(request.getParameter("id")!=null&&request.getParameter("id")!="") {
      int id = Integer.parseInt(request.getParameter("id"));
      Vector<UserLibData> res=(Vector<UserLibData>)session.getAttribute("library");
      for(UserLibData i :res){
        if(i.getAppID()==id){
          uld=i;
          break;
        }
      }
    }
    else{
      uld=null;//默认
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
                <p><span><%=uld.getGameData().getRate2()%></span></p>
              </div>
            </div>

            <!-- 好评/差评数 -->
            <div id="u98" class="ax_default label">
              <div id="u98_div" class=""></div>
              <div id="u98_text" class="text ">
                <p><span style="color:#A0FF05;">↑<%=uld.getGameData().getPositiveReviews()%></span><span style="color:#FFFFFF;"> </span><span style="color:#DC1F41;">↓<%=uld.getGameData().getNegativeReviews()%></span></p>
              </div>
            </div>

            <!-- emoji -->
            <div id="u99" class="ax_default icon">
              <img id="u99_img" class="img " src="images/detail__2/u99.svg"/>
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
          <p><span><%=uld.getGameData().getName()%></span></p>
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
            <p><span><%=uld.getGameData().getDeveloper()%></span></p>
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
            <p><span>&nbsp;&nbsp; &nbsp; <%=uld.getGameData().getPublisher()%></span></p>
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
            <p><span><%=uld.getGameData().getReleaseDate()%></span></p>
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
            <p><span><%=uld.getGameData().getLastUpDate()%></span></p>
          </div>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u113" class="ax_default _文本段落">
        <div id="u113_div" class=""></div>
        <div id="u113_text" class="text ">
          <p><span><%=uld.getGameData().getAbout()%></span></p>
        </div>
      </div>

      <!-- Unnamed (形状) -->
      <div id="u114" class="ax_default icon">
        <img id="u114_img" class="img " src="images/detail__2/u114.svg"/>
        <div id="u114_text" class="text " style="display:none; visibility: hidden">
          <p></p>
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
        <img id="u116_img" class="img " src="images/detail__1/u77.svg"/>
        <div id="u116_text" class="text " style="display:none; visibility: hidden">
          <p></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u117" class="ax_default label">
        <div id="u117_div" class=""></div>
        <div id="u117_text" class="text ">
          <p><span>返回</span></p>
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
            <p><span><%=uld.getRecord()%> 小时</span></p>
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
            <p><span><%=uld.getGameData().getSize()%></span></p>
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
                <p><span><%=uld.getGameData().getIn_Game()%></span></p>
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
          <p><span>《NBA 2K21》是享誉全球的畅销大作NBA 2K系列的最新作品。本作的玩法、竞争性以及社区在线功能，在前作的优质基础上精益求精，作出一系列激动人心的改进，再加上更加丰富多样的游戏模式，《NBA 2K21》将带给您NBA篮球与文化世界的沉浸式体验——随心所欲。</span></p><p><span>无论你是新玩家、老玩家还是回归的玩家，你都能在《NBA 2K21》中找到你喜欢的刺激游戏模式，体验多种多样的篮球乐趣：</span></p><p><span><br></span></p><p><span>更加真实的体验</span></p><p><span>通过视觉呈现、球员AI、游戏模式等多个方面的进化，《NBA 2K21》不断突破极限，带给你最真实的篮球游戏体验。你将能感受到观众的热情与NBA的激烈竞争，以及当今游戏领域最让人沉浸的体育大作为你带来的无穷乐趣。</span></p><p><span><br></span></p><p><span>精英级游戏玩法</span></p><p><span>先进的专家摇杆让你享受持球时无与伦比的顺滑操控手感。跳投和上篮将展现前所未有精准和巧妙，还可解锁全新招牌运球动作，控球效率更高。</span></p><p><span><br></span></p><p><span>你专属的史上最佳球队</span></p><p><span>利用梦幻球队收集最新的NBA明星和传奇球员，与全世界的顶级收藏家们一较高下。《2K21》新增限时赛季概念，随着在梦幻球队的新老模式中完成比赛，你将获得独一无二的奖励。</span></p><p><span><br></span></p><p><span>新的辉煌生涯</span></p><p><span>全新的大片级辉煌生涯体验，带领你从高中球队开始，一路进入十支官方授权的大学球队之一，最后闯入大联盟。在场内场外都成为最亮眼的明星，让你的自创球员走上顶峰，在这段激动人心的传奇旅程中成为一代巨星。</span></p><p><span><br></span></p><p><span>新的街区场景</span></p><p><span>在阳光下享受1对1、3对3和5对5的比赛吧。《NBA 2K21》 的新街区新加入海滩球场，更有全新的视觉呈现和画面布局。你可以在街球公园展示你的风格技巧，组队出征职业业余混合赛，还可以在动态更新的2K竞技活动中赢取奖励。</span></p><p><span><br></span></p><p><span>最新的服饰和音乐</span></p><p><span>穿上全新的服饰和球鞋，用你最喜欢的衣服、配饰和球鞋品牌从头到脚打扮自己，让你成为最潮最炫的球员。你还可以在《NBA 2K21》 的动感音乐中享受篮球，除了来自全世界的著名艺术家，更有亟待被发现的新兴音乐家为游戏增添色彩。</span></p><p><span><br></span></p><p><span>美国篮球史</span></p><p><span>回顾美国篮球历史上的冠军传奇。跟随经典球队走上赛场，在梦幻球队中收集来自过去的明星球员卡片，用自创球员装备展示你的骄傲。</span></p>
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

            <!-- Unnamed (矩形) -->
            <div id="u131" class="ax_default primary_button">
              <div id="u131_div" class=""></div>
              <div id="u131_text" class="text ">
                <p><span>&nbsp;&nbsp; &nbsp; 安装</span></p>
              </div>
            </div>

            <!-- Unnamed (形状) -->
            <div id="u132" class="ax_default icon">
              <img id="u132_img" class="img " src="images/library/u50.svg"/>
              <div id="u132_text" class="text " style="display:none; visibility: hidden">
                <p></p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 游戏图片 -->
      <div id="u133" class="ax_default _图片_">
        <img id="u133_img" class="img " src="<%=uld.getGameData().getHeader()%>"/>
        <div id="u133_text" class="text " style="display:none; visibility: hidden">
          <p></p>
        </div>
      </div>

      <!-- Unnamed (图片 ) -->
      <div id="u134" class="ax_default _图片_">
        <img id="u134_img" class="img " src="<%=uld.getGameData().getIcon()%>"/>
        <div id="u134_text" class="text " style="display:none; visibility: hidden">
          <p></p>
        </div>
      </div>
    </div>
    <script src="resources/scripts/axure/ios.js"></script>
  </body>
</html>
