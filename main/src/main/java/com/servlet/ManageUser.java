package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.sql.*;

@WebServlet("/ManageUser")
public class ManageUser extends HttpServlet
{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        String UserID = new String(request.getParameter("UserID").getBytes("ISO8859-1"), StandardCharsets.UTF_8);
        String Username = new String(request.getParameter("Username").getBytes("ISO8859-1"), StandardCharsets.UTF_8);
        String Password = new String(request.getParameter("Password").getBytes("ISO8859-1"), StandardCharsets.UTF_8);
        String Balance = new String(request.getParameter("Balance").getBytes("ISO8859-1"), StandardCharsets.UTF_8);
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamelibdb", "root", "55611224");
            stmt = conn.createStatement();
            PreparedStatement ps = null;
            if (request.getParameter("delete") != null){
                ps = conn.prepareStatement(new String("DELETE FROM user WHERE UserID = " + UserID + ";"));
                ps = conn.prepareStatement(new String("DELETE FROM userlib WHERE UserID = " + UserID + ";"));
                ps.execute();
                ps.close();
            }
            if (request.getParameter("submit") != null){
                ps = conn.prepareStatement(new String("INSERT INTO user VALUES(" + UserID + ", " + Username + ", " + Password + ", " + Balance + ");"));

                ps.execute();
                ps.close();
            }
            conn.close();
            request.getRequestDispatcher("backend.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        {
            doGet(request, response);
        }
    }
}
