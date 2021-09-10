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

@WebServlet("/ManageGame")
public class ManageGame extends HttpServlet
{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        String AppID = new String(request.getParameter("AppID").getBytes("ISO8859-1"), StandardCharsets.UTF_8);
        String Name = new String(request.getParameter("Name").getBytes("ISO8859-1"), StandardCharsets.UTF_8);
        String Price = new String(request.getParameter("Price").getBytes("ISO8859-1"), StandardCharsets.UTF_8);
        String About = new String(request.getParameter("About").getBytes("ISO8859-1"), StandardCharsets.UTF_8);
        String Description = new String(request.getParameter("Description").getBytes("ISO8859-1"), StandardCharsets.UTF_8);
        String Size = new String(request.getParameter("Size").getBytes("ISO8859-1"), StandardCharsets.UTF_8);
        String InGame = new String(request.getParameter("InGame").getBytes("ISO8859-1"), StandardCharsets.UTF_8);
        String NegativeViews = new String(request.getParameter("NegativeViews").getBytes("ISO8859-1"), StandardCharsets.UTF_8);
        String PositiveViews = new String(request.getParameter("PositiveViews").getBytes("ISO8859-1"), StandardCharsets.UTF_8);
        String Rate = new String(request.getParameter("Rate").getBytes("ISO8859-1"), StandardCharsets.UTF_8);
        String LastUpdate = new String(request.getParameter("LastUpdate").getBytes("ISO8859-1"), StandardCharsets.UTF_8);
        String ReleaseDate = new String(request.getParameter("ReleaseDate").getBytes("ISO8859-1"), StandardCharsets.UTF_8);
        String Publisher = new String(request.getParameter("Publisher").getBytes("ISO8859-1"), StandardCharsets.UTF_8);
        String Developer = new String(request.getParameter("Developer").getBytes("ISO8859-1"), StandardCharsets.UTF_8);

        String Icon = new String("image/gameimage/"+Name+"1.jpg");
        String Header = new String("image/gameimage/"+Name+"2.jpg");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamelibdb", "root", "55611224");
            stmt = conn.createStatement();
            PreparedStatement ps = null;
            if (request.getParameter("delete") != null){
                ps = conn.prepareStatement(new String("DELETE FROM game WHERE AppID = " + AppID + ";"));
                ps.execute();
                ps = conn.prepareStatement(new String("DELETE FROM userlib WHERE AppID = " + AppID + ";"));
                ps.execute();
                ps.close();
            }
            if (request.getParameter("submit") != null){
                ps = conn.prepareStatement("INSERT INTO game VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
                ps.setInt(1, Integer.parseInt(AppID));
                ps.setString(2, Name);
                ps.setString(3, Developer);
                ps.setString(4, Publisher);
                ps.setDate(5, Date.valueOf(ReleaseDate));
                ps.setDate(6, Date.valueOf(LastUpdate));
                ps.setDouble(7, Double.parseDouble(Rate));
                ps.setInt(8, Integer.parseInt(PositiveViews));
                ps.setInt(9, Integer.parseInt(NegativeViews));
                ps.setInt(10, Integer.parseInt(InGame));
                ps.setString(11, Size);
                ps.setString(12, Icon);
                ps.setString(13, Header);
                ps.setString(14, Description);
                ps.setString(15, About);
                ps.setInt(16, Integer.parseInt(Price));
                //ps = conn.prepareStatement(new String("INSERT INTO game VALUES(" + AppID + ", " + Name + ", " + Developer + ", " + Publisher + ", '" + ReleaseDate + "', '" + LastUpdate + "', " + Rate + ", " + PositiveViews + ", " + NegativeViews + ", " + InGame + ", " + Size + ", " + Icon + ", " + Header + ", " + Description + ", " + About + ", " + Price + ");"));
                //ps = conn.prepareStatement(new String("INSERT INTO 'game' VALUES(11232,1123,12321,1123,'2000-01-01','2000-01-01',12,1323,1231,3231,1123,1231,1123,121,132,11);"));
                //ps = conn.prepareStatement(new String("INSERT INTO game VALUES(" + "11" + ", " + "11" + ", " + "11" + ", " + "11" + ", " + "'01-01-2000'" + ", " + "'01-01-2000'" + ", " + "11" + ", " + "11" + ", " + "11" + ", " + "11" + ", " + "11" + ", " + "11" + ", " + "11" + ", " + "11" + ", " + "11" + ", " + "11" + ");"));
                ps.executeUpdate();
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
