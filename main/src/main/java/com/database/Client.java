package com.database;

import java.io.*;
import java.net.Socket;
import java.net.SocketException;
import java.util.Vector;
import com.database.GameData;
import com.database.UserData;
import com.database.UserLibData;
//import com.sun.org.apache.xpath.internal.operations.Bool;
//import com.sun.org.apache.xpath.internal.operations.Bool;

public class Client {

    private Socket server = null;

    private OutputStream os;
    private InputStream is;
    private ObjectOutputStream oos;
    private ObjectInputStream ois;


    public void start() {
        try {
            server = new Socket("10.28.210.136", 5555);
            //server = new Socket("localhost", 5555);
            System.out.println("连接服务器成功");

        } catch (SocketException e) {
            System.out.println("服务器" + server.getRemoteSocketAddress() + "嗝屁了");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //-----初始连接-------


    //-----向服务端发出请求----

    public String sendForMoneyBack(int Userid, int Appid) throws IOException {
        os = server.getOutputStream();
        oos = new ObjectOutputStream(os);
        Vector temp = new Vector();
        temp.addElement(new Integer(12));
        temp.addElement(new Integer(Userid));
        temp.addElement(new Integer(Appid));
        oos.writeObject(temp);
        System.out.println("sended request '12'");
        return ReceiveStatus();
    }

    public Vector sendBasicReqForGameData(String sql) throws IOException {
        os = server.getOutputStream();
        oos = new ObjectOutputStream(os);
        Vector temp = new Vector();
        temp.addElement(new Integer(11));
        temp.addElement(sql);

        oos.writeObject(temp);
        System.out.println("sended request '11'" + " sql: " + sql);
        return ReceiveVectorGD();
    }

    public Vector sendBasicReqForUserData(String sql) throws IOException {
        os = server.getOutputStream();
        oos = new ObjectOutputStream(os);
        Vector temp = new Vector();
        temp.addElement(new Integer(10));
        temp.addElement(sql);

        oos.writeObject(temp);
        System.out.println("sended request '10'" + " sql: " + sql);
        return ReceiveVectorUSD();
    }

    public Vector sendBasicReqForUserLibData(String sql) throws IOException {
        os = server.getOutputStream();
        oos = new ObjectOutputStream(os);
        Vector temp = new Vector();
        temp.addElement(new Integer(9));
        temp.addElement(sql);

        oos.writeObject(temp);
        System.out.println("sended request '9'" + " sql: " + sql);
        return ReceiveVectorUSLD();
    }

    public Vector sendForUserLibData(String keyWord, int UserID, int stateOption,
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
        return ReceiveVectorUSLD();
    }

    public Vector sendForUserStoreData(String keyWord, int UserID, int orderOption, Boolean isAsc) throws IOException {
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
        return ReceiveVectorGD();
    }

    public String sendForFavorite(int Userid, int Appid) throws IOException {
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

    public String sendForChangeBalance(int Userid, int Trade) throws IOException {
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

    public String sendForBuyGame(int Userid, int Appid) throws IOException {
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

    public String sendForDownload(int Userid, int Appid) throws IOException {
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

    public String sendForRegister(String username, String Password) throws IOException {
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

    public String sendForLogin(String username, String Password) throws IOException {
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
    private String ReceiveStatus() throws IOException {
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

    private Vector ReceiveVectorGD() throws IOException {
        is = server.getInputStream();
        ois = new ObjectInputStream(is);
        Object o = null;
        Vector back = null;
        System.out.println(ois.available());
        try {
            o = ois.readObject();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        back = (Vector) o;
        int num=((Integer) back.elementAt(0)).intValue();

        Vector Last = new Vector();
        for(int i=1,t=1;i<=num;i++,t+=16){

                GameData gg = new GameData(
                        back.elementAt(t).toString(),
                        back.elementAt(t + 1).toString(),
                        back.elementAt(t + 2).toString(),
                        (java.sql.Date)back.elementAt(t + 3),
                        (java.sql.Date)back.elementAt(t + 4),
                        ((Double)back.elementAt(t+5)).doubleValue(),
                        ((Integer)back.elementAt(t+6)).intValue(),
                        ((Integer)back.elementAt(t+7)).intValue(),
                        ((Integer)back.elementAt(t+8)).intValue(),
                        ((Integer)back.elementAt(t+9)).intValue(),
                        back.elementAt(t + 10).toString(),
                        back.elementAt(t + 11).toString(),
                        back.elementAt(t + 13).toString(),
                        back.elementAt(t + 14).toString(),
                        back.elementAt(t + 15).toString(),
                        ((Integer)back.elementAt(t+12)).intValue()
                         );

                Last.addElement(gg);
        }


        return Last;
    }

    private Vector ReceiveVectorUSLD() throws IOException {
        is = server.getInputStream();
        ois = new ObjectInputStream(is);
        Object o = null;
        Vector back = null;
        System.out.println(ois.available());
        try {
            o = ois.readObject();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        back = (Vector) o;
        int num=((Integer) back.elementAt(0)).intValue();

        Vector Last = new Vector();
        for(int i=1,t=1;i<=num;i++,t+=21){

            UserLibData usd = new UserLibData(((Integer) back.elementAt(t)).intValue(),
                    ((Double)back.elementAt(t+1)).doubleValue(),
                    (back.elementAt(t+2)).toString(),
                    ((Boolean)back.elementAt(t+3) ? 1:0),
                    ((Boolean) back.elementAt(t+4)? 1:0),
                    new GameData(
                    back.elementAt(t + 5).toString(),
                    back.elementAt(t + 6).toString(),
                    back.elementAt(t + 7).toString(),
                    (java.sql.Date)back.elementAt(t + 8),
                    (java.sql.Date)back.elementAt(t + 9),
                    ((Double)back.elementAt(t+10)).doubleValue(),
                    ((Integer)back.elementAt(t+11)).intValue(),
                    ((Integer)back.elementAt(t+12)).intValue(),
                    ((Integer)back.elementAt(t+13)).intValue(),
                    ((Integer)back.elementAt(t+14)).intValue(),
                    back.elementAt(t + 15).toString(),
                    back.elementAt(t + 16).toString(),
                    back.elementAt(t + 18).toString(),
                    back.elementAt(t + 19).toString(),
                    back.elementAt(t + 20).toString(),
                    ((Integer)back.elementAt(t+17)).intValue()
                    )
            );

            Last.addElement(usd);
        }


        return Last;
    }

    private Vector ReceiveVectorUSD() throws IOException {
        is = server.getInputStream();
        ois = new ObjectInputStream(is);
        Object o = null;
        Vector back = null;
        System.out.println(ois.available());
        try {
            o = ois.readObject();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        back = (Vector) o;
        int N=((Integer) back.elementAt(0)).intValue();

        int M=0;

        Vector Last = new Vector();
        for(int i=1 , t=1 ; i<=N ; i++ , t += M*21 + 5){
            UserData US = new UserData(((Integer) back.elementAt(t)).intValue(),
                    (back.elementAt(t+1)).toString(),
                    (back.elementAt(t+2)).toString(),
                    ((Integer) back.elementAt(t+3)).intValue());

                M = ((Integer)back.elementAt(t+4)).intValue();

                if(M==99999){
                    Last.addElement(US);
                    continue;
                }

                Vector V= new Vector();
            for(int z=0, w=0;z<M;z++,w+=21) {

                UserLibData usd = new UserLibData(((Integer) back.elementAt(t + 5 + w)).intValue(),
                        ((Double) back.elementAt(t + 6 + w)).doubleValue(),
                        (back.elementAt(t + 7 + w)).toString(),
                        ((Boolean) back.elementAt(t + 8 + w) ? 1 : 0),
                        ((Boolean) back.elementAt(t + 9 + w) ? 1 : 0),
                        new GameData(
                                back.elementAt(t + 10 + w).toString(),
                                back.elementAt(t + 11 + w).toString(),
                                back.elementAt(t + 12 + w).toString(),
                                (java.sql.Date) back.elementAt(t + 13 + w),
                                (java.sql.Date) back.elementAt(t + 14 + w),
                                ((Double) back.elementAt(t + 15 + w)).doubleValue(),
                                ((Integer) back.elementAt(t + 16 + w)).intValue(),
                                ((Integer) back.elementAt(t + 17 + w)).intValue(),
                                ((Integer) back.elementAt(t + 18 + w)).intValue(),
                                ((Integer) back.elementAt(t + 19 + w)).intValue(),
                                back.elementAt(t + 20 + w).toString(),
                                back.elementAt(t + 21 + w).toString(),
                                back.elementAt(t + 23 + w).toString(),
                                back.elementAt(t + 24 + w).toString(),
                                back.elementAt(t + 25 + w).toString(),
                                ((Integer) back.elementAt(t + 22 + w)).intValue()
                        )

                );

                V.addElement(usd);


            }

            US.setUserLib(V);

            Last.addElement(US);
        }


        return Last;
    }
}