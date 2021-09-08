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
                GameData tempGD = new GameData(rs.getString("Name"), rs.getString("Developer"), rs.getString("Publisher"), rs.getDate("ReleaseDate"), rs.getDate("LastUpDate"), rs.getDouble("Rate"), rs.getInt("AppID"), rs.getInt("PositiveReviews"), rs.getInt("NegativeReviews"), rs.getInt("InGame"), rs.getString("Size"), rs.getString("Icon"), rs.getString("Header"), rs.getString("Description"), rs.getString("About"),rs.getInt("Price"));
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
                tempUD.setUserLib(getUserLibData("",rs.getInt("UserID"),2,2,0,true));
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
            System.out.println(sql);
            ResultSet rs = sta.executeQuery(sql);
            if(!rs.next()){
                return null;}
            rs.previous();
            while (rs.next()) {
                GameData gd=new GameData(rs.getString("name"), rs.getString("developer"), rs.getString("publisher"), rs.getDate("releaseDate"), rs.getDate("lastUpDate"), rs.getDouble("rate"), rs.getInt("AppID"), rs.getInt("positiveReviews"), rs.getInt("negativeReviews"), rs.getInt("inGame"), rs.getString("size"), rs.getString("icon"), rs.getString("header"), rs.getString("description"), rs.getString("about"),rs.getInt("Price"));
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
            return sta.executeUpdate(sql)>0;

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

    public Vector getUserLibData(String keyWord,int UserID,int stateOption,int downloadOption,int orderOption,Boolean isAsc){
        Vector UserLib=new Vector();
        String sql="select game.*,userlib.UserID,userlib.Record,userlib.LastPlayed,userlib.IsLocal,userlib.IsFavorite from game natural join userlib natural join user where user.UserID=userlib.UserID and game.AppID=userlib.AppID and userlib.UserID ="+UserID+" and Name like '%"+keyWord+"%'";
        switch (downloadOption){
            case 0:sql+=" and userlib.IsLocal=0";break;
            case 1:sql+=" and userlib.IsLocal=1";break;
            default:;
        }
        if(stateOption==3)sql+=" and userlib.IsFavorite=1";
        String order_append;
        String state_append;
        switch (stateOption){
            case 1:state_append=" order by userlib.LastPlayed";break;//最近
            case 2:state_append="";break;//所有游戏
            default:state_append="";
        }

        switch (orderOption){//排序方式
            case 0:order_append=" order by game.Name";break;//游戏名称
            case 1:order_append=" order by userlib.Record";break;//游戏时间
            case 2:order_append=" order by game.Size";break;//磁盘空间判断需要重写，待定
            case 3:order_append=" order by game.Rate";break;//用户评分
            default:order_append=" order by game.Name";
        }
        if(stateOption!=1)
        sql+=order_append+state_append;
        else sql+=state_append+" desc , "+order_append.substring(10);
        if(stateOption==1||orderOption==1||orderOption==2||orderOption==3)sql+=" desc";
        else sql+=" asc";

        System.out.println("sql in UserData is: "+sql);

        Vector res=selectUserLibData(sql);
        if(res==null)return null;
        for(Object i:res){
            UserLibData uld=(UserLibData) i;
            UserLib.addElement(uld);
        }
        return UserLib;
    }

    public Vector getUserStoreData(String keyWord,int UserID,int orderOption,Boolean isAsc){
        String sql="select * from game where AppID not in(select AppID from game natural join userlib where game.AppID=userlib.AppID and userlib.UserID ="+UserID+") and Name like '%"+keyWord+"%'" ;
        String order_append;
        switch (orderOption){//排序方式
            case 3:order_append=" order by Rate";break;//用户评分
            case 4:order_append=" order by InGame";break;//最近热门
            case 5:order_append=" order by ReleaseDate";break;//发行日期
            case 6:order_append=" order by Price";break;//最低价格
            default:order_append=" order by InGame";
        }
        if(orderOption!=6)
            sql+=order_append+(isAsc?" asc":" desc");
        else sql+=order_append+" desc";
        System.out.println(sql);
        Vector<GameData> res=selectGameData(sql);
        if(res==null)return null;
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

    public String buyGameByID(int UserID,int AppID){
        String sql="select game.*,userlib.UserID,userlib.Record,userlib.LastPlayed,userlib.IsLocal,userlib.IsFavorite from game natural join userlib natural join user  where UserID="+ UserID+" and AppID="+AppID;
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
        String changeInfo=changeBalanceByID(UserID,-price);
        if(changeInfo.equals("余额不足"))
            return "余额不足，请充值";
        Date time= new java.sql.Date(new java.util.Date().getTime());
        sql="insert into userlib (UserID,AppID,LastPlayed) values ( "+UserID+" , "+AppID+" , '"+time+"' )";
        System.out.println("buyGame sql: "+sql);
        if(changeData(sql))return "购买成功";
        else
            return "购买失败";
    }

    public String changeBalanceByID(int UserID,int Money){
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

    public String setDownloadState(int UserID,int AppID){
        String sql="update userlib set IsLocal=not IsLocal where UserID="+UserID+" and AppID="+AppID;
        if(changeData(sql))
            return "修改下载状态成功";
        else
            return "修改下载状态失败";
    }

    public String setFavoriteState(int UserID,int AppID){
        String sql="update userlib set IsFavorite=not IsFavorite where UserID="+UserID+" and AppID="+AppID;
        if(changeData(sql))
            return "修改收藏状态成功";
        else
            return "修改收藏状态失败";
    }

}