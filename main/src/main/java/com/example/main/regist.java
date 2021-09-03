package com.example.main;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.StringReader;

@WebServlet(name = "registSerlet",value = "/registSerlet")
public class regist extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        HttpSession session=request.getSession(true);
        String location=request.getParameter("country");
        System.out.println(location);
        if (request.getParameter("button1")!=null){
            if(true){
                try {
                    request.getRequestDispatcher("index.jsp").forward(request,response);
                } catch (ServletException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    public void destroy() {
    }
}
