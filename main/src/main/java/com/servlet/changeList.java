package com.servlet;
import com.database.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Vector;

@WebServlet(name = "changeList", value = "/changeList")
public class changeList extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //library状态切换
        Client client=new Client();
        client.start();
        request.setCharacterEncoding("UTF-8");

        HttpSession session=request.getSession(true);

        String recent=request.getParameter("u1");
        String allGame=request.getParameter("u2");
        String collection=request.getParameter("u3");
        String libraryOrderOption =request.getParameter("libraryOrder");//游戏信息
        String libraryDownloadOption =request.getParameter("libraryDownload");//下载状态
        String downInfo=request.getParameter("download");
        String favoInfo=request.getParameter("favorite");
        String search=request.getParameter("search");
        String keyWord="";

        int UserID= (int) session.getAttribute("UserID");

        session.setAttribute("right",libraryOrderOption);
        Vector<UserLibData> uld;
        if (recent!=null){
            if (recent.equals("最近")){
                session.setAttribute("id","u1");
                session.setAttribute("state",recent);
                session.setAttribute("libraryUOption",1);
            }
        }
        else if (allGame!=null){
            if (allGame.equals("所有游戏")){
                session.setAttribute("id","u2");
                session.setAttribute("state",allGame);
                session.setAttribute("libraryUOption",2);
            }
        }
        else if (collection!=null){
            if (collection.equals("收藏")){
                session.setAttribute("id","u3");
                session.setAttribute("state",collection);
                session.setAttribute("libraryUOption",3);
            }
        }
        if(libraryOrderOption!=null){
            session.setAttribute("libraryOrderOption", libraryOrderOption);
        }
        if(libraryDownloadOption!=null){
            session.setAttribute("libraryDownloadOption",libraryDownloadOption);
        }
        if(downInfo!=null){

            int down=Integer.parseInt(downInfo);
            client.sendForDownload(UserID,down);
        }
        if(favoInfo!=null){
            int favo=Integer.parseInt(favoInfo);
            client.sendForFavorite(UserID,favo);
        }

        keyWord=request.getParameter("keyWord");
        if(keyWord.equals("请输入游戏名")) {
            keyWord="";
        }
        session.setAttribute("libraryKeyWord",keyWord);
        String stateInfo= (String) session.getAttribute("state");
        if(stateInfo==null)
            stateInfo="所有游戏";

        uld=client.sendForUserLibData(keyWord,UserID,sort.getStateOptionValue(stateInfo),sort.getDownloadOptionValue(libraryDownloadOption),sort.getOrderValue(libraryOrderOption),false);
        session.setAttribute("library",uld);
        response.sendRedirect("library.jsp");
        this.destroy();
    }
    public void destroy() {
    }
}
