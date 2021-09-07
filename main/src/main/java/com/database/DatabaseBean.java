package com.database;
//连接数据库并执行sql，返回结果
import java.sql.*;
import java.util.Vector;

import javax.servlet.annotation.WebServlet;

@WebServlet("/DatabaseBean")
public class DatabaseBean{
    private Connection con;
    private void getDBCon() {
        String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
        String DB_URL = "jdbc:mysql://localhost:3306/gamelib?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        String user = "root";
        String password = "224353Y1560x";//将密码改为自己的密码
        try {
            Class.forName(JDBC_DRIVER);
            con = DriverManager.getConnection(DB_URL, user, password);
            if(con!=null)
                System.out.println("数据库成功连接！");
            else
                System.out.println("数据库连接失败！");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
        public DatabaseBean(){};
        public Vector selectGameData(String sql){
            Vector res = new Vector();
            try {
                getDBCon();//与数据库建立连接
                Statement sta = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = sta.executeQuery(sql);
                if(!rs.next()){
                    return null;}
                rs.previous();
                while (rs.next()) {
                    GameData tempGD = new GameData(rs.getString("name"), rs.getString("developer"), rs.getString("publisher"), rs.getString("releaseDate"), rs.getString("lastUpDate"), rs.getDouble("rate"), rs.getInt("AppID"), rs.getInt("positiveReviews"), rs.getInt("negativeReviews"), rs.getInt("in-Game"), rs.getString("size"), rs.getString("icon"), rs.getString("header"), rs.getString("description"), rs.getString("about"),rs.getInt("Price"));
                    res.add(tempGD);
                }
            }
            catch(Exception e){
                e.printStackTrace();
            }
            finally {
                //关闭资源
                if(con!=null) {
                    try {
                        con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
            return res;
        }
        public Vector selectUserData(String sql){
        Vector res = new Vector();
        try {
            getDBCon();//与数据库建立连接
            Statement sta = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = sta.executeQuery(sql);
            if(!rs.next()){
                return null;}
            rs.previous();
            while (rs.next()) {
                UserData tempUD = new UserData(rs.getInt("UserID"), rs.getString("UserName"), rs.getString("Password"),rs.getInt("Balance"));
                res.add(tempUD);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
            //关闭资源
            if(con!=null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return res;
    }
        public Vector selectUserLibData(String sql){
        Vector res = new Vector();
        try {
            getDBCon();//与数据库建立连接
            Statement sta = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = sta.executeQuery(sql);
            if(!rs.next()){
                return null;}
            rs.previous();
            while (rs.next()) {
                GameData gd=new GameData(rs.getString("name"), rs.getString("developer"), rs.getString("publisher"), rs.getString("releaseDate"), rs.getString("lastUpDate"), rs.getDouble("rate"), rs.getInt("AppID"), rs.getInt("positiveReviews"), rs.getInt("negativeReviews"), rs.getInt("in-Game"), rs.getString("size"), rs.getString("icon"), rs.getString("header"), rs.getString("description"), rs.getString("about"),rs.getInt("Price"));
                UserLibData uld = new UserLibData(rs.getInt("AppID"), rs.getDouble("Record"), rs.getString("lastPlayed"), rs.getInt("IsLocal"), rs.getInt("IsFavorite"),gd);
                res.add(uld);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
            //关闭资源
            if(con!=null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return res;
    }
        public String login(String UserName,String Password){
            String sql="select * from user";
            sql+=" where UserName='"+UserName+"'";
            Vector<UserData> res=selectUserData(sql);
            if(res==null){
                return "用户名错误";
            }
            else {
                String pass=res.elementAt(0).getPassword();
                if(pass.equals(Password))
                    return"登录成功";
                else return"密码错误";
            }
        }

        public String addUserData(String userName,String password){
            try{
                System.out.println("into addUserData try");
                System.out.println("userName==\"\":"+(userName==""));
                System.out.println("password==\"\":"+(password==""));
                if(userName==""&&password==""){
                    System.out.println("用户名和密码为空");
                    return "用户名和密码为空";
                }
                else if(userName==""){
                    System.out.println("用户名为空");
                    return "用户名为空";
                }
                else if(password==""){
                    System.out.println("密码为空");
                    return "密码为空";
                }
                getDBCon();//与数据库建立连接
                Statement sta = con.createStatement();
                String sql0="select Username from user where Username='"+userName+"'";
                System.out.println(sql0);
                ResultSet rs=sta.executeQuery(sql0);
                if(rs.next()){
                    System.out.println("用户已存在");
                    return "用户名已存在";}

                String sql="insert into user (Username,Password) values ('"+userName+"','"+password+"')";
                sta.execute(sql);
                System.out.println("成功注册");
                return "成功注册";
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("异常");
                return "异常";
            }
            finally {
                //关闭资源
                if(con!=null) {
                    try {
                        con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        public int changeBalance(String userName,int money){
            try{
                getDBCon();
                Statement sta = con.createStatement();
                String sql0="select balance from user where Username='"+userName+"'";
                ResultSet rs=sta.executeQuery(sql0);
                rs.next();
                int balance=rs.getInt("Balance");
                System.out.println("balance:"+balance);
                if(money+balance>=0) {
                    String sql = "update user set Balance=Balance+" + money + " where Username= '" + userName + "'";
                    sta.execute(sql);
                    return 1;
                }
                else {
                    return -1;
                }
            } catch (Exception e) {
                e.printStackTrace();
                return -1;
            }
        }
}