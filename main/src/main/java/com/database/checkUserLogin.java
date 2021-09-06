//解析jsp传来的请求，并通过DatabaseBean执行sql语句,将结果封装在GameData中，并通过Session返回给前端

package com.database;

import java.io.*;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "checkUserLogin", value = "/checkUserLogin")
public class checkUserLogin extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println("\nInto checkUserLogin.java");
        String url="/index.jsp";
        request.setCharacterEncoding("UTF-8");
        Vector res;
        HttpSession session=request.getSession(true);
        String UserName=request.getParameter("UserName");
        String Password=request.getParameter("Password");
        if(UserName==""&&Password==""){
            System.out.println("用户名和密码为空");
            session.setAttribute("loginCheck","用户名和密码为空");
            request.getRequestDispatcher("index.jsp").forward(request,response);
            return;
        }
        else if(UserName==""){
            System.out.println("用户名为空");
            session.setAttribute("loginCheck","用户名为空");
            request.getRequestDispatcher("index.jsp").forward(request,response);
            return;
        }
        else if(Password==""){
            session.setAttribute("loginCheck","密码为空");
            session.setAttribute("name", UserName);
            request.getRequestDispatcher("index.jsp").forward(request,response);
            return;
        }
        String sql="select * from user";
        sql+=" where UserName='"+UserName+"'";
        DatabaseBean dbb=new DatabaseBean();
        System.out.println(sql);
        res=dbb.selectUserData(sql);
        String login=null;
        if(res==null){
            session.setAttribute("loginCheck","用户名错误");
            request.getRequestDispatcher("index.jsp").forward(request,response);
            return;
        }
        else{
            System.out.println(res);
            System.out.println("Vector is "+res.getClass().getName());
            UserData ud= (UserData) res.elementAt(0);
            login=ud.getPassword().equals(Password)?"登录成功":"密码错误";
            session.setAttribute("loginCheck",login);
            session.setAttribute("name", UserName);
            session.setAttribute("name", UserName);
            //System.out.println("UserName in servelet is "+UserName);
            System.out.println(ud.UserLibInformation());
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }
    }
    public void destroy() {
    }
}