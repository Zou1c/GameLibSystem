package com.database;
//储存user表的信息
import javax.xml.registry.infomodel.User;
import java.util.Vector;

public class UserData {
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
        getUserLibData();
    }

    public void getUserLibData(){
        UserLib=new Vector();
        DatabaseBean dbb=new DatabaseBean();
        String sql="select userlib.* from user,userlib where user.UserID=userlib.UserID and user.UserID= "+UserID;
        Vector res=dbb.selectUserLibData(sql);
        for(Object i:res){
            UserLibData uld=(UserLibData) i;
            UserLib.addElement(uld);
        }
    }
    public String UserLibInformation(){
        String s=UserName;
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
