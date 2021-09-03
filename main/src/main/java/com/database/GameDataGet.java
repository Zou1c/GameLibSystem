//解析jsp传来的请求，并通过DatabaseBean执行sql语句,将结果封装在GameData中，并通过Session返回给前端

package com.database;

import java.io.*;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "GameDataGet", value = "/GameDataGet")
public class GameDataGet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        Vector res=new Vector();
        HttpSession session=request.getSession(true);
        String name=request.getParameter("Name");
        String temp;
        temp=request.getParameter("AppID");
        int AppID=0;
        if(!temp.equals("")) AppID= Integer.parseInt(temp);
        /*
        String Developer=request.getParameter(("Developer"));
        String Publisher=request.getParameter(("Publisher"));
        String ReleaseDate=request.getParameter(("ReleaseDate"));
        String LastUpdate=request.getParameter(("LastUpdate"));
        temp=request.getParameter("Rate");
        System.out.println(1);
        double Rate=0.0;
        if(temp!=null)Rate= Double.parseDouble(temp);
        */
        String sql="select * from game";
        boolean hasWhere=false;
        if(!name.equals("")){
            sql+=(!hasWhere?" where ":" and ")+"Name='"+name+"'";
            hasWhere=true;
        }
        if(AppID>0){
            sql+=(!hasWhere?" where ":" and ")+"AppID="+AppID;
            hasWhere=true;
        }
        DatabaseBean dbb=new DatabaseBean();
        System.out.println(sql);
        res=dbb.selectGameData(sql);
        System.out.println(res);
        session.setAttribute("res",res);
        request.getRequestDispatcher("/sqlResult.jsp").forward(request,response);

    }
    public void destroy() {
    }
}