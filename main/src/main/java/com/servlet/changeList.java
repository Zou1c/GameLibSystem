package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet(name = "changeList", value = "/changeList")
public class changeList extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //library状态切换
        request.setCharacterEncoding("UTF-8");
        HttpSession session=request.getSession(true);
        String Recent=request.getParameter("u1");
        String AllGame=request.getParameter("u2");
        String CL=request.getParameter("u3");
        System.out.println(Recent+"=r "+AllGame+"=A "+CL+"=cl");
        if (Recent!=null){
            if (Recent.equals("最近")){
                session.setAttribute("id","u11");
            }
        }
        else if (AllGame!=null){
            if (AllGame.equals("所有游戏")){
                session.setAttribute("id","u12");
            }
        }
        else if (CL!=null){
            if (CL.equals("收藏")){
                session.setAttribute("id","u13");
            }
        }

        this.destroy();
        request.getRequestDispatcher("library.jsp").forward(request,response);
    }
    public void destroy() {
    }
}
