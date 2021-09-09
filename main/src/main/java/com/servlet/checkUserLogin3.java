//解析jsp传来的请求，将请求过滤后传给客户端，通过客户端访问服务端的数据库

package com.servlet;

import com.client.Client;
import com.database.DatabaseBean;
import com.database.GameData;
import com.database.UserData;
import com.database.UserLibData;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Vector;

@WebServlet(name = "checkUserLogin3", value = "/checkUserLogin3")
public class checkUserLogin3 extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        new Client().start();
        String url="login.jsp";
        request.setCharacterEncoding("UTF-8");
        Vector res=null;
        HttpSession session=request.getSession(true);
        String UserName=request.getParameter("UserName");
        String Password=request.getParameter("Password");
        if(UserName==""&&Password==""){
            System.out.println("用户名和密码为空");
            session.setAttribute("loginCheck","用户名和密码为空");
            request.getRequestDispatcher("login.jsp").forward(request,response);
            return;
        }
        else if(UserName==""){
            System.out.println("用户名为空");
            session.setAttribute("loginCheck","用户名为空");
            request.getRequestDispatcher("login.jsp").forward(request,response);
            return;
        }
        else if(Password==""){
            session.setAttribute("loginCheck","密码为空");
            session.setAttribute("name", UserName);
            request.getRequestDispatcher("login.jsp").forward(request,response);
            return;
        }
        System.out.println("name: "+UserName+" password: "+Password);

        String login=Client.sendForLogin(UserName,Password);
        if(login.equals("用户名错误")){
            session.setAttribute("loginCheck","用户名错误");
            request.getRequestDispatcher("login.jsp").forward(request,response);
            return;
        }
        else if(login.equals("登录成功")){
            res=Client.sendForUserStoreData("",7,0,true);

        }
        else if(login.equals("密码错误")){
            session.setAttribute("loginCheck","密码错误");
            request.getRequestDispatcher("login.jsp").forward(request,response);
            return;
        }
    }
    public void destroy() {
    }
}