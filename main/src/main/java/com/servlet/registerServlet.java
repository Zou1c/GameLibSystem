package com.servlet;
import com.database.DatabaseBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "registerServlet", value = "/registerServlet")
public class registerServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session=request.getSession(true);
        String Check=request.getParameter("check");
        if (Check!=""){
            String regiName=request.getParameter("regiName");
            String regiPassword=request.getParameter("regiPassword");
            String reCheck=request.getParameter("reCheck");
            System.out.println("注册:"+regiName+" "+regiPassword+" "+reCheck);
            String isRename="false";

                if (regiName==""){session.setAttribute("alret","用户名为空");request.getRequestDispatcher("register.jsp").forward(request,response);}
                else if (regiName==""&&regiPassword==""){session.setAttribute("alret","用户名和密码为空");request.getRequestDispatcher("register.jsp").forward(request,response);}
                else if (regiName==""&&reCheck==""){session.setAttribute("alret","用户名和确认密码为空");request.getRequestDispatcher("register.jsp").forward(request,response);}
                else if (regiName==""&&regiPassword==""&&reCheck==""){session.setAttribute ("alret","全为空");request.getRequestDispatcher("register.jsp").forward(request,response);}
                else if (regiPassword==""&&reCheck==""){session.setAttribute("alret","密码为空");request.getRequestDispatcher("register.jsp").forward(request,response);}
                else if (regiPassword==""){session.setAttribute("alret","密码为空");request.getRequestDispatcher("register.jsp").forward(request,response);}
                else if (reCheck==""){session.setAttribute("alret","请确认密码");request.getRequestDispatcher("register.jsp").forward(request,response);}
            DatabaseBean dbb=new DatabaseBean();
            String info=dbb.register(regiName,regiPassword);
            System.out.println("info");
            if(info.equals("注册失败")){
                session.setAttribute("alret","注册失败");request.getRequestDispatcher("register.jsp").forward(request,response);
            }
            else if(info.equals("用户名已存在")){
                session.setAttribute("alret","用户名已存在");request.getRequestDispatcher("register.jsp").forward(request,response);
            }
            else if(info.equals("注册成功")){
                System.out.println(request);
                System.out.println("注册成功");
                request.setAttribute("UserName",regiName);
                request.setAttribute("Password",regiPassword);
                System.out.println(request);
                request.getRequestDispatcher("checkUserLogin").include(request,response);

            }

        }
    }
}
