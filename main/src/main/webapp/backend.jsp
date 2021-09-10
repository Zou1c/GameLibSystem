<!DOCTYPE html>
<html>
  <head>
    <title>Backend</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="files/backend/styles.css" type="text/css" rel="stylesheet"/>
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
    <script src="files/backend/data.js"></script>
    <script type="text/javascript">
      $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
    </script>
  </head>
  <body>

      <!-- Unnamed (矩形) -->
      <div id="u34" class="ax_default _一级标题">
        <div id="u34_div" class=""></div>
        <div id="u34_text" class="text ">
          <p><span>后台管理面板</span></p>
        </div>
      </div>

      <!-- Tabs (组合) -->
      <div id="u35" class="ax_default" data-label="Tabs" data-left="83" data-top="178" data-width="914" data-height="522">

        <!-- Tab Label 2 (矩形) -->
        <div id="u36" class="ax_default box_3" data-label="Tab Label 2" selectiongroup="Tabs">
          <div id="u36_div" class=""></div>
          <div id="u36_text" class="text ">
            <p><span>管理用户</span></p>
          </div>
        </div>

        <!-- Tab Label 1 (矩形) -->
        <div id="u37" class="ax_default box_3 selected" data-label="Tab Label 1" selectiongroup="Tabs">
          <div id="u37_div" class="selected"></div>
          <div id="u37_text" class="text ">
            <p><span>管理游戏</span></p>
          </div>
        </div>


        <!-- Tab Panels (动态面板) -->
        <div id="u38" class="ax_default" data-label="Tab Panels">
          <div id="u38_state0" class="panel_state" data-label="Game" style="">
            <div id="u38_state0_content" class="panel_state_content">
              <form action="ManageGame" method="post">
              <!-- Panel 1 Content (矩形) -->
              <div id="u39" class="ax_default shape" data-label="Panel 1 Content">
                <div id="u39_div" class=""></div>
                <div id="u39_text" class="text " style="display:none; visibility: hidden">
                  <p></p>
                </div>
              </div>

              <!-- Unnamed (文本框) -->
              <div id="u40" class="ax_default text_field">
                <div id="u40_div" class=""></div>
                <input id="u40_input" name="AppID" type="text" value="" class="u40_input"/>
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u41" class="ax_default label">
                <div id="u41_div" class=""></div>
                <div id="u41_text" class="text ">
                  <p><span>AppID</span></p>
                </div>
              </div>

              <!-- Unnamed (文本框) -->
              <div id="u42" class="ax_default text_field">
                <div id="u42_div" class=""></div>
                <input id="u42_input" name="Name" type="text" value="" class="u42_input"/>
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u43" class="ax_default label">
                <div id="u43_div" class=""></div>
                <div id="u43_text" class="text ">
                  <p><span>游戏名</span></p>
                </div>
              </div>

              <!-- Unnamed (文本框) -->
              <div id="u44" class="ax_default text_field">
                <div id="u44_div" class=""></div>
                <input id="u44_input" name="Developer" type="text" value="" class="u44_input"/>
              </div>

              <!-- Unnamed (文本框) -->
              <div id="u45" class="ax_default text_field">
                <div id="u45_div" class=""></div>
                <input id="u45_input" name="Publisher" type="text" value="" class="u45_input"/>
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u46" class="ax_default label">
                <div id="u46_div" class=""></div>
                <div id="u46_text" class="text ">
                  <p><span>发行商</span></p>
                </div>
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u47" class="ax_default label">
                <div id="u47_div" class=""></div>
                <div id="u47_text" class="text ">
                  <p><span>开发商</span></p>
                </div>
              </div>

              <!-- Unnamed (文本框) -->
              <div id="u48" class="ax_default text_field">
                <div id="u48_div" class=""></div>
                <input id="u48_input" name="ReleaseDate" type="text" value="" class="u48_input"/>
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u49" class="ax_default label">
                <div id="u49_div" class=""></div>
                <div id="u49_text" class="text ">
                  <p><span>发售日期</span></p>
                </div>
              </div>

              <!-- Unnamed (文本框) -->
              <div id="u50" class="ax_default text_field">
                <div id="u50_div" class=""></div>
                <input id="u50_input" name="LastUpdate" type="text" value="" class="u50_input"/>
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u51" class="ax_default label">
                <div id="u51_div" class=""></div>
                <div id="u51_text" class="text ">
                  <p><span>最后更新</span></p>
                </div>
              </div>

              <!-- Unnamed (文本框) -->
              <div id="u52" class="ax_default text_field">
                <div id="u52_div" class=""></div>
                <input id="u52_input" name="Rate" type="text" value="" class="u52_input"/>
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u53" class="ax_default label">
                <div id="u53_div" class=""></div>
                <div id="u53_text" class="text ">
                  <p><span>评分</span></p>
                </div>
              </div>

              <!-- Unnamed (文本框) -->
              <div id="u54" class="ax_default text_field">
                <div id="u54_div" class=""></div>
                <input id="u54_input" name="PositiveViews" type="text" value="" class="u54_input"/>
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u55" class="ax_default label">
                <div id="u55_div" class=""></div>
                <div id="u55_text" class="text ">
                  <p><span>好评数</span></p>
                </div>
              </div>

              <!-- Unnamed (文本框) -->
              <div id="u56" class="ax_default text_field">
                <div id="u56_div" class=""></div>
                <input id="u56_input" name="NegativeViews" type="text" value="" class="u56_input"/>
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u57" class="ax_default label">
                <div id="u57_div" class=""></div>
                <div id="u57_text" class="text ">
                  <p><span>差评数</span></p>
                </div>
              </div>

              <!-- Unnamed (文本框) -->
              <div id="u58" class="ax_default text_field">
                <div id="u58_div" class=""></div>
                <input id="u58_input" name="InGame" type="text" value="" class="u58_input"/>
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u59" class="ax_default label">
                <div id="u59_div" class=""></div>
                <div id="u59_text" class="text ">
                  <p><span>简短描述</span></p>
                </div>
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u60" class="ax_default label">
                <div id="u60_div" class=""></div>
                <div id="u60_text" class="text ">
                  <p><span>关于游戏</span></p>
                </div>
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u61" class="ax_default button">
                <div id="u61_div" class=""></div>
                <div id="u61_text" class="text ">
                  <p><span>上传图标</span></p>
                </div>
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u62" class="ax_default button">
                <div id="u62_div" class=""></div>
                <div id="u62_text" class="text ">
                  <p><span>上传Header</span></p>
                </div>
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u63" class="ax_default primary_button">
                <div id="u63_div" class=""></div>
                <input style="background: #169bd5;color: #ffffff" type="submit" name="submit" id="u63_text" class="text " value="提交">
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u64" class="ax_default primary_button">
                <div id="u64_div" class=""></div>
                <input style="background: #d9001b;color: #ffffff" type="submit" name="delete" id="u64_text" class="text " value="删除此游戏">
                </div>

              <!-- Unnamed (矩形) -->
              <div id="u65" class="ax_default label">
                <div id="u65_div" class=""></div>
                <div id="u65_text" class="text ">
                  <p><span>*输入所有字段来新建一个游戏。</span></p>
                </div>
              </div>

              <!-- Unnamed (文本域) -->
              <div id="u66" class="ax_default text_area">
                <div id="u66_div" class=""></div>
                <input type="text" name="Description" id="u66_input" class="u66_input">
              </div>

              <!-- Unnamed (文本域) -->
              <div id="u67" class="ax_default text_area">
                <div id="u67_div" class=""></div>
                <input type="text" id="u67_input" name="About" class="u67_input">
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u68" class="ax_default label">
                <div id="u68_div" class=""></div>
                <div id="u68_text" class="text ">
                  <p><span>游戏中人数</span></p>
                </div>
              </div>

              <!-- Unnamed (文本框) -->
              <div id="u69" class="ax_default text_field">
                <div id="u69_div" class=""></div>
                <input id="u69_input" name="Price" type="text" value="" class="u69_input"/>
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u70" class="ax_default label">
                <div id="u70_div" class=""></div>
                <div id="u70_text" class="text ">
                  <p><span>价格</span></p>
                </div>
              </div>
                <!-- Unnamed (矩形) -->
                <div id="u97" class="ax_default label">
                  <div id="u97_div" class=""></div>
                  <div id="u97_text" class="text ">
                    <p><span>游戏大小</span></p>
                  </div>
                </div>

                <!-- Unnamed (文本框) -->
                <div id="u98" class="ax_default text_field">
                  <div id="u98_div" class=""></div>
                  <input id="u98_input" name="Size" type="text" value="" class="u98_input"/>
                </div>


              </form></div>
          </div>

          <div id="u38_state1" class="panel_state" data-label="User" style="visibility: hidden;">
            <div id="u38_state1_content" class="panel_state_content">

              <form action="ManageUser" method="post">
              <!-- Panel 2 Content (矩形) -->
              <div id="u71" class="ax_default shape" data-label="Panel 2 Content">
                <div id="u71_div" class=""></div>
                <div id="u71_text" class="text " style="display:none; visibility: hidden">
                  <p></p>
                </div>
              </div>

              <!-- Tabs (组合) -->
              <div id="u72" class="ax_default" data-label="Tabs" data-left="0" data-top="0" data-width="0" data-height="0">
              </div>

              <!-- Unnamed (文本框) -->
              <div id="u73" class="ax_default text_field">
                <div id="u73_div" class=""></div>
                <input id="u73_input" name="UserID" type="text" value="" class="u73_input"/>
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u74" class="ax_default label">
                <div id="u74_div" class=""></div>
                <div id="u74_text" class="text ">
                  <p><span>User ID</span></p>
                </div>
              </div>

              <!-- Unnamed (文本框) -->
              <div id="u75" class="ax_default text_field">
                <div id="u75_div" class=""></div>
                <input id="u75_input" name="Username" type="text" value="" class="u75_input"/>
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u76" class="ax_default label">
                <div id="u76_div" class=""></div>
                <div id="u76_text" class="text ">
                  <p><span>用户名</span></p>
                </div>
              </div>

              <!-- Unnamed (文本框) -->
              <div id="u77" class="ax_default text_field">
                <div id="u77_div" class=""></div>
                <input id="u77_input" name="Password" type="text" value="" class="u77_input"/>
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u78" class="ax_default label">
                <div id="u78_div" class=""></div>
                <div id="u78_text" class="text ">
                  <p><span>密码</span></p>
                </div>
              </div>

              <!-- Unnamed (文本框) -->
              <div id="u79" class="ax_default text_field">
                <div id="u79_div" class=""></div>
                <input id="u79_input" name="Balance" type="text" value="" class="u79_input"/>
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u80" class="ax_default label">
                <div id="u80_div" class=""></div>
                <div id="u80_text" class="text ">
                  <p><span>钱包余额</span></p>
                </div>
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u81" class="ax_default primary_button">
                <div id="u81_div" class=""></div>
                <input style="background: #169bd5;color: #ffffff" id="u81_text" name="submit" type="submit" class="text " value="提交">
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u82" class="ax_default primary_button">
                <div id="u82_div" class=""></div>
                <input style="background: #d9001b;color: #ffffff" id="u82_text" name="delete" type="submit" class="text " value="删除此用户">
              </div>

              <!-- Unnamed (矩形) -->
              <div id="u83" class="ax_default label">
                <div id="u83_div" class=""></div>
                <div id="u83_text" class="text ">
                  <p><span>*输入所有字段来建立一个User。</span></p>
                </div>
              </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- Unnamed (矩形) -->
      <div id="u84" class="ax_default box_3">
        <div id="u84_div" class=""></div>
        <div id="u84_text" class="text " style="display:none; visibility: hidden">
          <p></p>
        </div>
      </div>

      <form action="SQLStatement" method="POST">
      <!-- Unnamed (文本框) -->
      <div id="u85" class="ax_default text_field">
        <div id="u85_div" class=""></div>
        <input id="u85_input" name="SQLStatement" type="text" value="" class="u85_input"/>
      </div>


      <!-- Unnamed (矩形) -->
      <div id="u86" class="ax_default _二级标题">
        <div id="u86_div" class=""></div>
        <div id="u86_text" class="text ">
          <p><span>通过SQL语句管理数据库</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u87" class="ax_default primary_button">
        <div id="u87_div" class=""></div>
          <input style="background: #169bd5;color: #ffffff" id="u87_text" class="text " type="submit" value="提交">
      </div>
      </form>
    </div>
    <script src="resources/scripts/axure/ios.js"></script>
  </body>
</html>
