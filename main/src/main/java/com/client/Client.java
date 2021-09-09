package com.client;

import java.io.*;
import java.net.Socket;
import java.net.SocketException;
import java.util.Scanner;
import java.util.Vector;

public class Client {

    static private Socket server = null;

    static private OutputStream os;
    static private InputStream is;
    static private ObjectOutputStream oos;
    static private ObjectInputStream ois;


    private void start() {
        try {
            //server = new Socket("10.128.216.73", 5555);
            server = new Socket("localhost", 5555);
            System.out.println("连接服务器成功");

        } catch (SocketException e) {
            System.out.println("服务器" + server.getRemoteSocketAddress() + "嗝屁了");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //-----初始连接-------


    //-----向服务端发出请求----
    static public Vector sendBasicReqForGameData(String sql) throws IOException {
        os = server.getOutputStream();
        oos = new ObjectOutputStream(os);
        Vector temp = new Vector();
        temp.addElement(new Integer(11));

        oos.writeObject(temp);
        System.out.println("sended request '11'" + " sql: " + sql);
        return ReceiveVector();
    }

    static public Vector sendBasicReqForUserData(String sql) throws IOException {
        os = server.getOutputStream();
        oos = new ObjectOutputStream(os);
        Vector temp = new Vector();
        temp.addElement(new Integer(10));

        oos.writeObject(temp);
        System.out.println("sended request '10'" + " sql: " + sql);
        return ReceiveVector();
    }

    static public Vector sendBasicReqForUserLibData(String sql) throws IOException {
        os = server.getOutputStream();
        oos = new ObjectOutputStream(os);
        Vector temp = new Vector();
        temp.addElement(new Integer(9));

        oos.writeObject(temp);
        System.out.println("sended request '9'" + " sql: " + sql);
        return ReceiveVector();
    }

    static public Vector sendForUserLibData(String keyWord, int UserID, int stateOption,
                                            int downloadOption, int orderOption, Boolean isAsc)
            throws IOException {
        os = server.getOutputStream();
        oos = new ObjectOutputStream(os);
        Vector temp = new Vector();
        temp.addElement(new Integer(8));

        temp.addElement(keyWord);
        temp.addElement(new Integer(UserID));
        temp.addElement(new Integer(stateOption));
        temp.addElement(new Integer(downloadOption));
        temp.addElement(new Integer(orderOption));
        temp.addElement(new Boolean(isAsc));

        oos.writeObject(temp);
        System.out.println("sended request '8'");
        return ReceiveVector();
    }

    static public Vector sendForUserStoreData(String keyWord, int UserID, int orderOption, Boolean isAsc) throws IOException {
        os = server.getOutputStream();
        oos = new ObjectOutputStream(os);
        Vector temp = new Vector();
        temp.addElement(new Integer(7));

        temp.addElement(keyWord);
        temp.addElement(new Integer(UserID));
        temp.addElement(new Integer(orderOption));
        temp.addElement(new Boolean(isAsc));
        oos.writeObject(temp);
        System.out.println("sended request '7'");
        return ReceiveVector();
    }

    static public String sendForFavorite(int Userid, int Appid) throws IOException {
        os = server.getOutputStream();
        oos = new ObjectOutputStream(os);
        Vector temp = new Vector();
        temp.addElement(new Integer(6));
        temp.addElement(new Integer(Userid));
        temp.addElement(new Integer(Appid));
        oos.writeObject(temp);
        System.out.println("sended request '6'");
        return ReceiveStatus();
    }

    static public String sendForChangeBalance(int Userid, int Trade) throws IOException {
        os = server.getOutputStream();
        oos = new ObjectOutputStream(os);
        Vector temp = new Vector();
        temp.addElement(new Integer(5));
        temp.addElement(new Integer(Userid));
        temp.addElement(new Integer(Trade));
        oos.writeObject(temp);
        System.out.println("sended request '5'");
        return ReceiveStatus();
    }

    static public String sendForBuyGame(int Userid, int Appid) throws IOException {
        os = server.getOutputStream();
        oos = new ObjectOutputStream(os);
        Vector temp = new Vector();
        temp.addElement(new Integer(4));
        temp.addElement(new Integer(Userid));
        temp.addElement(new Integer(Appid));
        oos.writeObject(temp);
        System.out.println("sended request '4'");
        return ReceiveStatus();
    }

    static public String sendForDownload(int Userid, int Appid) throws IOException {
        os = server.getOutputStream();
        oos = new ObjectOutputStream(os);
        Vector temp = new Vector();
        temp.addElement(new Integer(3));
        temp.addElement(new Integer(Userid));
        temp.addElement(new Integer(Appid));
        oos.writeObject(temp);
        System.out.println("sended request '3'");

        return ReceiveStatus();
    }

    static public String sendForRegister(String username, String Password) throws IOException {
        os = server.getOutputStream();
        oos = new ObjectOutputStream(os);
        Vector temp = new Vector();
        temp.addElement(new Integer(2));
        temp.addElement(username);
        temp.addElement(Password);
        oos.writeObject(temp);
        System.out.println("sended request '2'");
        return ReceiveStatus();
    }

    static public String sendForLogin(String username, String Password) throws IOException {
        os = server.getOutputStream();
        oos = new ObjectOutputStream(os);
        Vector temp = new Vector();
        temp.addElement(new Integer(1));
        temp.addElement(username);
        temp.addElement(Password);
        oos.writeObject(temp);
        System.out.println("sended request '1'");
        return ReceiveStatus();
    }


    //----------接受服务端发出的对象------------
    static private String ReceiveStatus() throws IOException {
        is = server.getInputStream();
        ois = new ObjectInputStream(is);
        Object o = null;
        try {
            o = ois.readObject();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return o.toString();
    }

    static private Vector ReceiveVector() throws IOException {
        is = server.getInputStream();
        ois = new ObjectInputStream(is);
        Object o = null;
        try {
            o = ois.readObject();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return (Vector) o;
    }
}