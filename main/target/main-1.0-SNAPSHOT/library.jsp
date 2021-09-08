<%@ page import="java.util.Vector" %>
<%@ page import="com.database.GameData" %>
<%@ page import="com.database.UserData" %>
<%@ page import="com.database.UserLibData" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" --%>
<!DOCTYPE html>
<html>
<head>
    <title>Library</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="files/library/styles.css" type="text/css" rel="stylesheet"/>
    <script src="resources/scripts/jquery-3.2.1.min.js"></script>
    <script src="data/document.js"></script>
    <script src="files/library/data.js"></script>
    <script type="text/javascript">
        $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
        $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
        $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
    </script>
</head>
<body>
<form action="changeList" method="post" id="libraryForm">
    <div id="base" class="">

        <!-- Unnamed (文本框) -->
        <div id="u8" class="ax_default text_field">
            <div id="u8_div" class=""></div>
            <input style="color: #6d6d6d" id="u8_input" type="text" value="请输入游戏名" onfocus="this.value='';"   οnblur="if (this.value == '') {this.value = '请输入游戏名';}" class="u8_input"/>
        </div>

        <div id="u9" class="ax_default label">
            <div id="u9_div" class=""></div>
            <div id="u9_text" class="text ">
                <input name="librarySearchKeyWord" value="搜索" type="button" style="border: 0px;border-radius: 3px;width: 40px;height: 25px ;background-color: #008dcb;color:#ffffff "></input>
            </div>
        </div>

        <div id="u10" class="ax_default label">
            <div id="u10_div" class=""></div>
            <div id="u10_text" class="text ">
                <p><span>排序依据</span></p>
            </div>
        </div>
        <%String Choose="background-color: rgba(65, 123, 156, 1);";String unChoose ="background-color: rgba(15, 15, 25, 1);";
            String s1;String s2;String s3;String click;
            s1=unChoose ;s3= unChoose;s2=Choose;
            click=(String)session.getAttribute("id");
            session.removeAttribute("id");
            System.out.println("click="+click);
            if (click!=null){
                if (click.equals("u1")){s1=Choose;s2=unChoose;s3= unChoose;}
                if (click.equals("u2")){s2=Choose;s1=unChoose;s3= unChoose;}
                if (click.equals("u3")){s3=Choose;s1=unChoose;s2= unChoose;}
                System.out.println("s1="+s1);
                System.out.println("s2="+s2);
                System.out.println("s3="+s3);
            }
            else {
                s1=unChoose;s2=Choose;s3=unChoose;
            }
        %>
        <script type="javascript">
            function getId(obj) {
                sessionStorage.setItem("id",this.id);
            }
        </script>
        <div id="u11" class="ax_default button">
            <div id="u11_div" class="" style="<%=s1%>"></div>
            <div id="u11_text" class="text ">
                <input type="submit" name="u1" value="最近"style="border:transparent;background: transparent;color:#ffffff;font-family: '华文细黑', sans-serif;"><span></span></input>
            </div>
        </div>

        <div id="u12" class="ax_default button">
            <div id="u12_div" class="" style="<%=s2%>"></div>
            <div id="u12_text" class="text ">
                <input type="submit" name="u2" value="所有游戏"style="border:transparent;background: transparent;color:#ffffff;font-family: '华文细黑', sans-serif;"></input>
            </div>
        </div>

        <div id="u13" class="ax_default button">
            <div id="u13_div" class="" style="<%=s3%>"></div>
            <div id="u13_text" class="text ">
                <input type="submit" name="u3" value="收藏"style="border:transparent;background: transparent;color:#ffffff;font-family: '华文细黑', sans-serif;"><span></span></input>
            </div>
        </div>
        <!-- Unnamed (矩形) -->
        <div id="u14" class="ax_default box_1">
            <div id="u14_div" class=""></div>
            <div id="u14_text" class="text " style="display:none; visibility: hidden">
                <p></p>
            </div>
        </div>


        <!-- Unnamed (下拉列表) -->
        <div id="u15" class="ax_default droplist"><!--复选框1-->
            <div id="u15_div" class=""></div>
            <select id="u15_input" name="libraryOrder" class="u15_input" onchange="submitForm();">
                <option class="u15_input_option" value="游戏名称">游戏名称</option>
                <option class="u15_input_option" value="游戏时间">游戏时间</option>
                <option class="u15_input_option" value="磁盘空间">磁盘空间</option>
                <option class="u15_input_option" value="用户评分">用户评分</option>
            </select>
        </div>



        <!-- Unnamed (矩形) -->
        <div id="u28" class="ax_default label">
            <div id="u28_div" class=""></div>
            <div id="u28_text" class="text ">
                <p><span>筛选</span></p>
            </div>
        </div>

        <!-- Unnamed (下拉列表) -->
        <div id="u29" class="ax_default droplist">
            <div id="u29_div" class=""></div>
            <select id="u29_input" name="libraryDownload" class="u29_input" onchange="submitForm();">
                <option class="u29_input_option" value="全部">全部</option>
                <option class="u29_input_option" value="已下载">已下载</option>
                <option class="u29_input_option" value="未下载">未下载</option>
            </select>
        </div>

        <script type="text/javascript">
            function submitForm() {
                $("#libraryForm").submit();
            }
        </script>


        <div id="u36" class="ax_default _图片_"> <img id="u36_img" class="img " src="images/login/u7.svg"/>
            <div id="u36_text" class="text " style="display:none; visibility: hidden">
                <p></p>
            </div>
        </div>


        <div id="u37" class="ax_default label">
            <div id="u37_div" class=""></div>
            <div id="u37_text" class="text ">
                <p><span onclick="location='session.jsp'">注销</span></p>
            </div>
        </div>


        <div id="u38" class="ax_default icon"> <img onclick="location='session.jsp'" id="u38_img" class="img " src="images/library/u38.svg"/>
            <div id="u38_text" class="text " style="display:none; visibility: hidden">
                <p></p>
            </div>
        </div>


        <div id="u39" class="ax_default">
            <div id="u39_state0" class="panel_state" data-label="State1" style="">
                <div id="u39_state0_content" class="panel_state_content">


                    <div id="u40" class="ax_default box_2">
                        <div id="u40_div" class=""></div>
                        <div id="u40_text" class="text " style="display:none; visibility: hidden">
                            <p></p>
                        </div>
                    </div>


                    <div id="u41" class="ax_default icon"> <img id="u41_img" class="img " src="images/library/u41.svg"/>
                        <div id="u41_text" class="text " style="display:none; visibility: hidden">
                            <p></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%!
            int count=0;
            Vector<UserLibData> res=new Vector();

        %>
        <%
            res=(Vector<UserLibData>)session.getAttribute("library");
            if(res!=null)
                count=res.size();
            else count=0;
            System.out.println("有"+count+"个游戏");
            for (int i=0;i<count;i++){
                int ti=i*105+328;//到顶部的距离
        %>
        <div style="top:<%=ti%>px;border-width: 0px;position: absolute;left: 118px;width: 845px;  height: 99px;  background-color: rgba(22, 32, 45, 1);">
            <!-- 游戏名 -->
            <div class="name">
                <p><a onclick="location='detail.jsp?id=<%=res.elementAt(i).getGameData().getAppID()%>'" style="width:200px; height:20px;" ><%=res.elementAt(i).getGameData().getName()%></a></p>
            </div>

            <!-- 简短信息 -->
            <div class="des">
                <p><span><%=res.elementAt(i).getRecord()%> 小时 / <%=res.elementAt(i).getGameData().getSize()%> / <%=(res.elementAt(i).getGameData().getRate2())%></span></p>
            </div>
            <% if(res.elementAt(i).getFavorite()){
                System.out.println(res.elementAt(i).getFavorite());
            %>
            <input type="submit" name="fav" class="fav" value="true<%=i%>" style="color: transparent;border: transparent;background-color: transparent;background-image: url(images/library/u21.svg)"><%--喜欢与否的星号 u20未选中 u21选中 --%>
            <%}
            else{%>
            <input type="submit" name="fav" class="fav" value="fals<%=i%>" style="color: transparent;border: transparent;background-color: transparent;background-image: url(images/library/u20.svg)">
            <%}
            %>
            <div class="detail"><%--改了格式会乱倒起飞--%>
                <div > <img style="left:0px;top:0px;width: 131px;height: 37px;" name="particulars" onclick="location='detail.jsp?id=<%=res.elementAt(i).getGameData().getAppID()%>'"  value="true" src="images/library/particulars.png"/><%--真正显示详情信息的地方--%>
                    <div class="text detButton_text"><%--改了格式会乱倒起飞--%>
                        <p><span>&nbsp;&nbsp; &nbsp;</span></p><%--改了格式会乱倒起飞--%>
                    </div>
                </div>

                <!-- 详细信息图标 (形状) -->
                <div class="ax_default icon detIcon"> <img class="detIcon_img" src="images/library/lu.png"/> </div><%--麻了搞个透明图层--%>
            </div>

            <!-- 下载 (动态面板) -->
            <%if(res.elementAt(i).getLocal()){%>
            <div class="download">
                <div> <input type="button" style="left:0px;top:0px;width: 131px;height: 37px;background-image: url(images/library/startGame.png);border:0px;border-radius: 5px;" name="startGame"/><%--真正显示下载的地方--%>
                    <div class="text .dlButton_text"><%--改了格式会乱倒起飞--%>
                        <p><span>&nbsp;&nbsp;</span></p><%--改了格式会乱倒起飞--%>
                    </div>
                </div>
                <div class="ax_default icon dlIcon"> <img url="images/library/u50.svg"/> </div><%--改了格式会乱倒起飞--%>
            </div>
            <%}
            else{
            %>
            <div class="download">
                <div> <input type="button" style="left:0px;top:0px;width: 131px;height: 37px;background-image: url(images/library/downLoad.png);border-radius: 5px;border: 0px;" name="download"/><%--真正显示下载的地方--%>
                    <div class="text .dlButton_text"><%--改了格式会乱倒起飞--%>
                        <p><span>&nbsp;&nbsp;</span></p><%--改了格式会乱倒起飞--%>
                    </div>
                </div>
                <div class="ax_default icon dlIcon"> <img url="images/library/u50.svg"/> </div><%--改了格式会乱倒起飞--%>
            </div>
            <%
                }
            %>
            <!-- Header (图片 ) -->
            <div class="ax_default _图片_ header"> <img class="img header_img" src="<%=res.elementAt(i).getGameData().getHeader()%>"/> </div>
        </div>

        <%}%>

        <!-- Unnamed (矩形) -->
        <div id="u43" class="ax_default label">
            <div id="u43_div" class=""></div>
            <div onclick="location='store.jsp'" id="u43_text" class="text ">
                <p><span>商店</span></p>
            </div>
        </div>

        <!-- Unnamed (形状) -->
        <div id="u46" class="ax_default icon">
            <img onclick="location='store.jsp'" id="u46_img" class="img " src="images/library/u46.svg"/>
            <div id="u46_text" class="text " style="display:none; visibility: hidden">
                <p></p>
            </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u47" class="ax_default _一级标题">
            <div id="u47_div" class=""></div>
            <div id="u47_text" class="text ">
                <p><span>库</span></p>
            </div>
        </div>

    </div>
    <script src="resources/scripts/axure/ios.js"></script>
</form>
</body>
</html>
