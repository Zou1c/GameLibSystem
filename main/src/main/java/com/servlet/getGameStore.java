
package com.servlet;

import com.database.DatabaseBean;
import com.database.GameData;
import com.database.sort;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Vector;

@WebServlet(name = "getGameStore", value = "/getGameStore")
public class getGameStore extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        Vector<GameData> res=new Vector<GameData>();
        HttpSession session=request.getSession(true);
        int UserID= (int) session.getAttribute("UserID");
        String sortOption= (String) session.getAttribute("sortOption2");
        DatabaseBean dbb=new DatabaseBean();
        res=dbb.getUserStoreData("",UserID, sort.getSortValue("最近热门"),true);
        session.setAttribute("store",res);
        session.setAttribute("libraryU2","u2");
        session.setAttribute("id","u2");
        session.setAttribute("libraryUOption","所有游戏");
        session.setAttribute("libraryDownloadOption","全部");
        session.setAttribute("libraryOrderOption","游戏名称");
        session.setAttribute("storeOrderOption","最近热门");
        request.getRequestDispatcher("/library.jsp").forward(request,response);

    }
    public void destroy() {
    }
}