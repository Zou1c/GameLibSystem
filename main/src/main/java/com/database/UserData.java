package com.database;
//储存user表的信息
import javax.xml.registry.infomodel.User;
import java.io.Serializable;
import java.util.Vector;

public class UserData implements Serializable {
    int UserID;
    String UserName;
    String Password;
    int Balance;
    Vector UserLib;

    public UserData(int userID, String userName, String password,int balance) {
        UserID = userID;
        UserName = userName;
        Password = password;
        Balance=balance;
        //getUserLibData(2,0,true);
    }

    public void setBalance(int balance) {
        Balance = balance;
    }

    public void setUserLib(Vector userLib) {
        UserLib = userLib;
    }

    public Vector getUserLibData(){
        return UserLib;
    }

    public Vector getUserLibData2(int downloadOption, int orderOption, Boolean isAsc){
        UserLib=new Vector();
        DatabaseBean dbb=new DatabaseBean();
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

        Vector res=dbb.selectUserLibData(sql);
        if(res==null)return null;
        for(Object i:res){
            UserLibData uld=(UserLibData) i;
            UserLib.addElement(uld);
        }
        return UserLib;
    }
    public String UserLibInformation(){
        String s=UserName;
        if(UserLib==null)return "未拥有游戏";
        for(Object i: UserLib){
            UserLibData ul=(UserLibData) i;
            s+=" "+ul.toString();
        }
        return s;
    }

    @Override
    public String toString() {
        return "UserData{" +
                "UserID=" + UserID +
                ", UserName='" + UserName + '\'' +
                ", Password='" + Password + '\'' +
                ", Balance=" + Balance +
                '}';
    }

    public int getUserID() {
        return UserID;
    }

    public String getUserName() {
        return UserName;
    }

    public String getPassword() {
        return Password;
    }

    public Vector getUserLib() {
        return UserLib;
    }

    public void setUserID(int userID) {
        UserID = userID;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public void setPassword(String password) {
        Password = password;
    }
}
