package com.servlet;
import com.database.DatabaseBean;
import com.database.UserData;
import com.database.UserLibData;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Vector;

@WebServlet(name = "changeBalance", value = "/changeBalance")
public class changeBalance extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session=request.getSession(true);
        String payInfo=request.getParameter("pay");
        String buyInfo=request.getParameter("buy");
        int UserID=(int)session.getAttribute("UserID");
        DatabaseBean dbb=new DatabaseBean();
        if(payInfo!=null){
            int pay= Integer.parseInt(payInfo);
            dbb.changeBalanceByID(UserID,pay);
            response.sendRedirect("payment.jsp");
        }
        if(buyInfo!=null){
            int buy=Integer.parseInt(buyInfo);
            dbb.buyGameByID(UserID,buy);
            response.sendRedirect("store.jsp");
        }
        this.destroy();
    }
    public void destroy() {
    }
}
