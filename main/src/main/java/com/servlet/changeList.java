package com.servlet;
import com.database.sort;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet(name = "changeList", value = "/changeList")
public class changeList extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //library状态切换
        request.setCharacterEncoding("UTF-8");

        HttpSession session=request.getSession(true);

        String recent=request.getParameter("u1");
        String allGame=request.getParameter("u2");
        String collection=request.getParameter("u3");
        String libraryOrderOption =request.getParameter("libraryOrder");//游戏信息
        String libraryDownloadOption =request.getParameter("libraryDownload");//下载状态
        session.setAttribute("right",libraryOrderOption);
        System.out.println("u1: "+recent+" u2: "+allGame+" u3: "+collection+" 游戏信息: "+libraryOrderOption+" 下载状态: "+libraryDownloadOption);

        if (recent!=null){
            if (recent.equals("最近")){
                session.setAttribute("id","u1");
                session.setAttribute("libraryUOption",1);
                //request.getRequestDispatcher("library.jsp").forward(request,response);
            }
        }
        else if (allGame!=null){
            if (allGame.equals("所有游戏")){
                session.setAttribute("id","u2");
                session.setAttribute("libraryUOption",2);
                //request.getRequestDispatcher("library.jsp").forward(request,response);
            }
        }
        else if (collection!=null){
            if (collection.equals("收藏")){
                session.setAttribute("id","u3");
                session.setAttribute("libraryUOption",3);
            }
        }
        else if(libraryOrderOption!=null){
            session.setAttribute("libraryOrderOption", libraryOrderOption);
        }
        else if(libraryDownloadOption!=null){
            session.setAttribute("libraryDownloadOption",libraryDownloadOption);
        }
        request.getRequestDispatcher("library.jsp").forward(request,response);
        this.destroy();
    }
    public void destroy() {
    }
}
