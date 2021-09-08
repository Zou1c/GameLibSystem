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
        String CheckBoxRinght =request.getParameter("text2");//游戏信息
        String CheckBoxleft =request.getParameter("text1");//下载状态
        session.setAttribute("right",CheckBoxRinght);
        System.out.println(Recent+"=r "+AllGame+"=A "+CL+"=cl"+"\t是否下载："+CheckBoxleft+"\t排序依据："+CheckBoxRinght);
        String isFav=request.getParameter("fav");
        System.out.println("is fav?"+isFav);
        String money=request.getParameter("pay");
        System.out.println("-"+money+"￥");
        if (money!=null){
            request.getRequestDispatcher("payment.jsp").forward(request,response);
            money=null;//无论如何置于if底端
        }
        if (Recent!=null){
            if (Recent.equals("最近")){
                session.setAttribute("id","u11");
                request.getRequestDispatcher("library.jsp").forward(request,response);
            }
        }
        else if (AllGame!=null){
            if (AllGame.equals("所有游戏")){
                session.setAttribute("id","u12");
                request.getRequestDispatcher("library.jsp").forward(request,response);
            }
        }
        else if (CL!=null){
            if (CL.equals("收藏")){
                session.setAttribute("id","u13");
                request.getRequestDispatcher("library.jsp").forward(request,response);
            }
        }
        this.destroy();
    }
    public void destroy() {
    }
}
