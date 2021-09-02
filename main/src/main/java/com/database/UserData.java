package com.database;
//储存user表的信息
import java.util.Vector;

public class UserData {
    int UserID;
    String UserName;
    String Password;
    Vector UserLib=null;

    public UserData(int userID, String userName, String password) {
        UserID = userID;
        UserName = userName;
        Password = password;
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

    public void setUserLib(Vector userLib) {
        UserLib = userLib;
    }
}
