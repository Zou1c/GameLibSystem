//解析jsp传来的请求，并通过DatabaseBean执行sql语句,将结果封装在GameData中，并通过Session返回给前端

package com.database;

import java.io.*;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "UserLoginCheck", value = "/UserLoginCheck")
public class UserLoginCheck extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String url="/input.jsp";
        request.setCharacterEncoding("UTF-8");
        Vector res;
        HttpSession session=request.getSession(true);
        String UserName=request.getParameter("UserName");
        String Password=request.getParameter(("Password"));
        String sql="select * from user";
        sql+=" where UserName='"+UserName+"'";
        DatabaseBean dbb=new DatabaseBean();
        System.out.println(sql);
        res=dbb.selectUserData(sql);
        if(res==null){
            System.out.println("res is null");
            session.setAttribute("loginCheck",-1);//找不到此用户
            request.getRequestDispatcher(url).forward(request,response);
        }
        else{
            System.out.println(res);
            UserData ud= (UserData) res.elementAt(0);
            int login=ud.getPassword().equals(Password)?1:0;
            session.setAttribute("loginCheck",login);
        }
        session.setAttribute("res",res);
        request.getRequestDispatcher(url).forward(request,response);

    }
    public void destroy() {
    }
}