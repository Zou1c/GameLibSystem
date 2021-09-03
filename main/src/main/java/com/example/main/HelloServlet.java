package com.example.main;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        HttpSession session=request.getSession();
        String username=request.getParameter("username").trim();
        String password=request.getParameter("password").trim();
        if (request.getParameter("reg")!=null){
            try {
                request.getRequestDispatcher("2nd.jsp").forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            }
        }
        boolean go=false;
        if(username.equals("1355060521@qq.com")&&password.equals("mima")){
            go=true;
        }
        if (request.getParameter("login")!=null){
            if(username.length()>0&&password.length()>0&&go){
                try {
                    request.getRequestDispatcher("3rd.jsp").forward(request,response);
                } catch (ServletException e) {
                    e.printStackTrace();
                }
            }else {
                if (username.length()==0){
                    String statu = "refresh";
                    session.setAttribute("statu",statu);
                }
                else if (!username.equals("1355060521@qq.com")){
                    String statu = "nameWrong";
                    session.setAttribute("statu",statu);
                }
                else if(!password.equals("mima")){
                    String statu = "passwordWrong";
                    session.setAttribute("statu",statu);
                }
                try {
                    request.getRequestDispatcher("index.jsp").forward(request,response);
                } catch (ServletException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        doPost(request,response);
    }
    public void destroy() {
    }
}
