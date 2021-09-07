package com.database;
//连接数据库并执行sql，返回结果
import java.sql.*;
import java.util.Vector;

import javax.servlet.annotation.WebServlet;
import javax.xml.registry.infomodel.User;

@WebServlet("/DatabaseBean")
public class DatabaseBean{
    private Connection con;
    private void getDBCon() {
        String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
        String DB_URL = "jdbc:mysql://localhost:3306/gamelib?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        String user = "root";
        String password = "239080";//将密码改为自己的密码
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
        public DatabaseBean(){}

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
                    GameData tempGD = new GameData(rs.getString("Name"), rs.getString("Developer"), rs.getString("Publisher"), rs.getString("ReleaseDate"), rs.getString("LastUpDate"), rs.getDouble("Rate"), rs.getInt("AppID"), rs.getInt("PositiveReviews"), rs.getInt("NegativeReviews"), rs.getInt("In-Game"), rs.getString("Size"), rs.getString("Icon"), rs.getString("Header"), rs.getString("Description"), rs.getString("About"),rs.getInt("Price"));
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
                tempUD.setUserLib(getUserLibData(rs.getInt("UserID"),2,0,true));
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
            System.out.println("first in");
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
        public Boolean changeData(String sql){
            try {
                getDBCon();//与数据库建立连接
                Statement sta = con.createStatement();
                return sta.execute(sql);

            }
            catch(Exception e){
                e.printStackTrace();
                return false;
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

        public Vector getUserLibData(int UserID,int downloadOption,int orderOption,Boolean isAsc){
        Vector UserLib=new Vector();
        String sql="select game.*,userlib.UserID,userlib.Record,userlib.LastPlayed,userlib.IsLocal,userlib.IsFavorite from game natural join userlib natural join user where user.UserID=userlib.UserID and game.AppID=userlib.AppID and userlib.UserID ="+UserID;
        switch (downloadOption){
            case 0:sql+=" where userlib.IsLocal=0";break;
            case 1:sql+=" where userlib.IsLocal=1";break;
            default:;
        }
        String order_append;
        switch (orderOption){//排序方式
            case 0:order_append=" order by game.Name";break;//游戏名称
            case 1:order_append=" order by userlib.Record";break;//游戏时间
            case 2:order_append=" order by game.Size";break;//磁盘空间判断需要重写，待定
            case 3:order_append=" order by (game.PositiveReviews)/(game.PositiveReviews+game.NegativeReviews)";break;//用户评分
            default:order_append=" order by game.Name";
        }
        sql+=order_append+(isAsc?" asc":" desc");
        System.out.println("sql in UserData is: "+sql);

        Vector res=selectUserLibData(sql);
        if(res==null)return null;
        for(Object i:res){
            UserLibData uld=(UserLibData) i;
            UserLib.addElement(uld);
        }
        return UserLib;
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

        public String loginByID(int UserID,String Password){
        String sql="select * from user";
        sql+=" where UserID='"+UserID+"'";
        Vector<UserData> res=selectUserData(sql);
        if(res==null){
            return "ID不存在";
        }
        else {
            String pass=res.elementAt(0).getPassword();
            if(pass.equals(Password))
                return"登录成功";
            else return"密码错误";
        }
    }

        public String register(String UserName,String Password){
             String regInfo=login(UserName,Password);//调用login，测试用户名是否存在
             if(regInfo.equals("用户名错误")){
                 String sql="insert into user (Username,Password) values ('"+UserName+"','"+Password+"')";
                 if(changeData(sql))
                     return "注册成功";
                 else return "注册失败";
             }
             else{
                 return "用户名已存在";
             }
        }

        /*
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

         */

        public String buyGame(int UserID,int AppID){
            String sql="select * from userlib where UserID="+ UserID+" and AppID="+AppID;
            System.out.println("sql:\n"+sql);
            Vector<UserLibData> res0=selectUserLibData(sql);
            if(res0!=null) {
                System.out.println("已拥有此游戏");
                return "已拥有此游戏";
            }
            sql="select * from game where AppID="+AppID;
            System.out.println(sql);
            Vector<GameData> res=selectGameData(sql);
            if(res==null)
                return "游戏不存在";
            System.out.println("报错前一行");
            int price=res.elementAt(0).getPrice();//获取游戏价格
            String changeInfo=changeBalance(UserID,-price);
            if(changeInfo.equals("余额不足"))
                return "余额不足，请充值";
            Date time= new java.sql.Date(new java.util.Date().getTime());
            sql="insert into userlib (UserID,AppID,LastPlayed) values ( "+UserID+" , "+AppID+" , '"+time+"' )";
            System.out.println("buyGame sql: "+sql);
            if(changeData(sql))return "购买成功";
            else
                return "购买失败";
        }

        public String changeBalance(int UserID,int Money){
            if(Money<0) {//Money<0说明行为是购买，需要判断用户余额是否足够
                String sql = "select * from user";
                sql += " where UserID='" + UserID + "'";
                Vector<UserData> res = selectUserData(sql);
                if(res==null)return "账号不存在";
                int balance=res.elementAt(0).getBalance();
                if(balance+Money<0)
                    return "余额不足";
            }
            String sql = "update user set Balance=Balance+" + Money + " where UserID= '" + UserID + "'";
            if(changeData(sql))return "余额修改成功";
            else
                return "余额修改失败";
            }
}