package com.servlet;
import com.database.Client;
import com.database.DatabaseBean;
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

@WebServlet(name = "registerServlet", value = "/registerServlet")
public class registerServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Client client=new Client();
        client.start();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session=request.getSession(true);
        String Check=request.getParameter("check");
        if (Check!=""){
            String regiName=request.getParameter("regiName");
            String regiPassword=request.getParameter("regiPassword");
            String reCheck=request.getParameter("reCheck");

                if (regiName==""){session.setAttribute("alret","用户名为空");request.getRequestDispatcher("register.jsp").forward(request,response);return;}
                else if (regiName==""&&regiPassword==""){session.setAttribute("alret","用户名和密码为空");request.getRequestDispatcher("register.jsp").forward(request,response);return;}
                else if (regiName==""&&reCheck==""){session.setAttribute("alret","用户名和确认密码为空");request.getRequestDispatcher("register.jsp").forward(request,response);return;}
                else if (regiName==""&&regiPassword==""&&reCheck==""){session.setAttribute ("alret","全为空");request.getRequestDispatcher("register.jsp").forward(request,response);return;}
                else if (regiPassword==""&&reCheck==""){session.setAttribute("alret","密码为空");request.getRequestDispatcher("register.jsp").forward(request,response);return;}
                else if (regiPassword==""){session.setAttribute("alret","密码为空");request.getRequestDispatcher("register.jsp").forward(request,response);return;}
                else if (reCheck==""){session.setAttribute("alret","请确认密码");request.getRequestDispatcher("register.jsp").forward(request,response);return;}
            String info=client.sendForRegister(regiName,regiPassword);

            if(info.equals("注册失败")){
                session.setAttribute("alret","注册失败");request.getRequestDispatcher("register.jsp").forward(request,response);
            }
            else if(info.equals("用户名已存在")){
                session.setAttribute("alret","用户名已存在");request.getRequestDispatcher("register.jsp").forward(request,response);
            }
            else if(info.equals("注册成功")){
                Vector<UserData> res;
                res=client.sendBasicReqForUserData("select * from user where UserName='"+regiName+"'");
                session.setAttribute("loginCheck","登录成功");
                session.setAttribute("name", regiName);
                Vector<UserLibData> res2=res.elementAt(0).getUserLibData();
                session.setAttribute("library",res2);

                session.setAttribute("UserID",res.elementAt(0).getUserID());
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }

        }
    }
}
