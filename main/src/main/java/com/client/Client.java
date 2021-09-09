package com.client;

import java.io.*;
import java.net.Socket;
import java.net.SocketException;
import java.util.Vector;

public class Client {

    static private Socket server = null;

    static private OutputStream os;
    static private InputStream is;
    static private ObjectOutputStream oos;
    static private ObjectInputStream ois;


    public void start() {
        try {
            server = new Socket("10.128.246.156", 5555);
            //server = new Socket("localhost", 5555);
            System.out.println("连接服务器成功");

        } catch (SocketException e) {
            System.out.println("服务器" + server.getRemoteSocketAddress() + "嗝屁了");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    static public Vector sendForUserStoreData(String keyWord, int UserID, int orderOption, Boolean isAsc) throws IOException {
        os = server.getOutputStream();
        oos = new ObjectOutputStream(os);
        Vector temp = new Vector();
        temp.addElement(Integer.valueOf(7));

        temp.addElement(keyWord);
        temp.addElement(Integer.valueOf(UserID));
        temp.addElement(Integer.valueOf(orderOption));
        temp.addElement(Boolean.valueOf(isAsc));
        oos.writeObject(temp);
        System.out.println("sended request '7'");
        return ReceiveVector();
    }


    static public String sendForLogin(String username, String Password) throws IOException {
        os = server.getOutputStream();
        oos = new ObjectOutputStream(os);
        Vector temp = new Vector();
        temp.addElement(Integer.valueOf(1));
        temp.addElement(username);
        temp.addElement(Password);
        oos.writeObject(temp);
        System.out.println("sended request '1'");
        return ReceiveStatus();
    }


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