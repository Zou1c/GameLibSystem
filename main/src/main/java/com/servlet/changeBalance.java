package com.servlet;
import com.database.*;

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
        Client client=new Client();
        client.start();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session=request.getSession(true);
        String payInfo=request.getParameter("pay");
        String buyInfo=request.getParameter("buy");
        String storeOrderOption=request.getParameter("storeOrder");
        String search=request.getParameter("search");
        String keyWord="";
        String uninstall=request.getParameter("uninstall");
        String moneyBack=request.getParameter("moneyBack");
        int UserID=(int)session.getAttribute("UserID");
        if(payInfo!=null){
            int pay= Integer.parseInt(payInfo);
            client.sendForChangeBalance(UserID,pay);
            response.sendRedirect("payment.jsp");
            return;
        }
        if(buyInfo!=null){
            int buy=Integer.parseInt(buyInfo);
            String info=client.sendForBuyGame(UserID,buy);
            if(info.equals("余额不足，请充值")){
                response.sendRedirect("payment.jsp");
                return;
            }
            Vector<UserLibData> uld;//
            uld=client.sendForUserStoreData(keyWord,UserID, sort.getOrderValue(storeOrderOption),true);
            session.setAttribute("store",uld);
            response.sendRedirect("store.jsp");
            String stateInfo= (String) session.getAttribute("state");
            String libraryDownloadOption=(String) session.getAttribute("libraryDownloadOption");
            String libraryOrderOption=(String) session.getAttribute("libraryOrderOption");
            Vector<UserData> ud= client.sendBasicReqForUserData("select * from user where UserID='"+UserID+"'");
            uld=client.sendForUserLibData("",UserID,sort.getStateOptionValue(stateInfo),sort.getDownloadOptionValue(libraryDownloadOption),sort.getOrderValue(libraryOrderOption),false);
            session.setAttribute("library",uld);
            return;
        }
        if(moneyBack!=null){
            int money=Integer.parseInt(moneyBack);
            DatabaseBean dbb=new DatabaseBean();
            String info=dbb.giveMoneyBack(UserID,money);
            Vector<UserLibData> uld;
            String soo="最近热门";
            if(storeOrderOption==null)
                soo= (String) session.getAttribute("storeOrderOption");
            uld=dbb.getUserStoreData(keyWord,UserID, sort.getOrderValue(soo),true);
            session.setAttribute("store",uld);
            response.sendRedirect("library.jsp");
            String stateInfo= (String) session.getAttribute("state");
            String libraryDownloadOption=(String) session.getAttribute("libraryDownloadOption");
            String libraryOrderOption=(String) session.getAttribute("libraryOrderOption");
            Vector<UserData> ud=dbb.selectUserData("select * from user where UserID='"+UserID+"'");
            uld=dbb.getUserLibData("",UserID,sort.getStateOptionValue(stateInfo),sort.getDownloadOptionValue(libraryDownloadOption),sort.getOrderValue(libraryOrderOption),false);
            session.setAttribute("library",uld);
            return;
        }
        if(uninstall!=null){
            int un=Integer.parseInt(uninstall);
            client.sendForDownload(UserID,un);
            Vector<UserLibData> uld;
            String stateInfo=(String)session.getAttribute("state");
            String libraryDownloadOption=(String) session.getAttribute("libraryDownloadOption");
            String libraryOrderOption=(String) session.getAttribute("libraryOrderOption");
            Vector<UserData> ud=client.sendBasicReqForUserData("select * from user where UserID='"+UserID+"'");
            uld= client.sendForUserLibData("", UserID, sort.getStateOptionValue(stateInfo), sort.getDownloadOptionValue(libraryDownloadOption), sort.getOrderValue(libraryOrderOption), false);
            session.setAttribute("library",uld);
            response.sendRedirect("detail.jsp?id="+un);
            return;
        }
        keyWord=request.getParameter("keyWord");
        if(keyWord.equals("请输入游戏名")) {
            keyWord="";
        }
        session.setAttribute("storeKeyWord",keyWord);
        if(storeOrderOption!=null){
            Vector<UserLibData> uld;
            uld=client.sendForUserStoreData(keyWord,UserID, sort.getOrderValue(storeOrderOption),true);
            session.setAttribute("store",uld);
            session.setAttribute("storeOrderOption",storeOrderOption);
        }
        response.sendRedirect("store.jsp");
        this.destroy();
    }
    public void destroy() {
    }
}
