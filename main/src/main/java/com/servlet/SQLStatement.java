package com.servlet;

import java.sql.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.DELETE;

@WebServlet("/SQLStatement")
public class SQLStatement extends HttpServlet
{
    String statement = "";
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        statement = new String(request.getParameter("SQLStatement").getBytes("ISO8859-1"), StandardCharsets.UTF_8);
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamelibdb", "root", "55611224");
            stmt = conn.createStatement();
            PreparedStatement ps = conn.prepareStatement(statement);
            ps.execute();
            ps.close();
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


