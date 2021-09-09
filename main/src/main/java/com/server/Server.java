package com.server;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class Server {

    private static List<Socket> clients = new ArrayList<>();

    private void start() {
        try {
            ServerSocket server = new ServerSocket(5555);
            System.out.println("服务开启，等待客户端连接中...");

            while (true) {
                Socket client = server.accept();
                clients.add(client);

                System.out.println("客户端[" + client.getRemoteSocketAddress() + "]连接成功，当前在线用户" + clients.size() + "个");

                new MessageListener(client).start();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

//---

    class MessageListener extends Thread {

        // 将每个连接上的客户端传递进来，收消息和发消息
        private Socket client;

        ObjectInputStream ois=null;
        ObjectOutputStream oos=null;

        private InputStream is;

        public MessageListener(Socket socket) {
            this.client = socket;
        }

        @Override
        public void run() {
            try {
                // 循环监听消息
                while (true) {
                    sendObj(receiveObj());
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        private  void sendObj(Vector judge)throws IOException {
            if (judge.elementAt(0).equals(new Integer(1))) {//登录查询操作
                String Result = null;
                DatabaseBean db = new DatabaseBean();
                Result = db.login(judge.elementAt(1).toString(), judge.elementAt(2).toString());
                //上面这一行：写入用户名和密码，在数据库查询后判断，并返回登录验证结果
                oos = new ObjectOutputStream(client.getOutputStream());
                oos.writeObject(Result);
                System.out.println("已返回登录验证结果: " + Result);

            } else if (judge.elementAt(0).equals(new Integer(2))) {//注册操作
                String Result = "NULL!";
                DatabaseBean db = new DatabaseBean();
                Result = db.register(judge.elementAt(1).toString(), judge.elementAt(2).toString());

                oos = new ObjectOutputStream(client.getOutputStream());
                oos.writeObject(Result);
                System.out.println("已返回注册结果: " + Result);

            } else if (judge.elementAt(0).equals(new Integer(3))) {//下载操作
                String Result = "donwnload str";
                DatabaseBean db = new DatabaseBean();

                Result = db.setDownloadState(((Integer) judge.elementAt(1)).intValue()
                        , ((Integer) judge.elementAt(2)).intValue());

                oos = new ObjectOutputStream(client.getOutputStream());
                oos.writeObject(Result);
                System.out.println("已返回下载结果: " + Result);

            } else if (judge.elementAt(0).equals(new Integer(4))) {//购买游戏操作
                String Result = "buy str";
                DatabaseBean db = new DatabaseBean();

                Result = db.buyGameByID(((Integer) judge.elementAt(1)).intValue()
                        , ((Integer) judge.elementAt(2)).intValue());

                oos = new ObjectOutputStream(client.getOutputStream());
                oos.writeObject(Result);
                System.out.println("已返回购买结果: " + Result);

            } else if (judge.elementAt(0).equals(new Integer(5))) {//余额修改操作
                String Result = "change balance str";
                DatabaseBean db = new DatabaseBean();

                Result = db.changeBalanceByID(((Integer) judge.elementAt(1)).intValue()
                        , ((Integer) judge.elementAt(2)).intValue());

                oos = new ObjectOutputStream(client.getOutputStream());
                oos.writeObject(Result);
                System.out.println("已返回余额修改结果: " + Result);

            } else if (judge.elementAt(0).equals(new Integer(6))) {//收藏操作
                String Result = "collect str";
                DatabaseBean db = new DatabaseBean();

                Result = db.setFavoriteState(((Integer) judge.elementAt(1)).intValue()
                        , ((Integer) judge.elementAt(2)).intValue());

                oos = new ObjectOutputStream(client.getOutputStream());
                oos.writeObject(Result);
                System.out.println("已返回收藏结果: " + Result);

            } else if (judge.elementAt(0).equals(new Integer(7))) {//获取UserStoreData操作
                Vector Result = null;
                DatabaseBean db = new DatabaseBean();

                Result = db.getUserStoreData(
                        judge.elementAt(1).toString(),
                        ((Integer) judge.elementAt(2)).intValue(),
                        ((Integer) judge.elementAt(3)).intValue(),
                        ((Boolean) judge.elementAt(4)).booleanValue());

                oos = new ObjectOutputStream(client.getOutputStream());
                oos.writeObject(Result);

                System.out.println("已返回获取UserStoreData结果(String): " + Result.toString());

            } else if (judge.elementAt(0).equals(new Integer(8))) {//获取UserLibData操作
                Vector Result = null;
                DatabaseBean db = new DatabaseBean();

                Result = db.getUserLibData(
                        judge.elementAt(1).toString(),
                        ((Integer) judge.elementAt(2)).intValue(),
                        ((Integer) judge.elementAt(3)).intValue(),
                        ((Integer) judge.elementAt(4)).intValue(),
                        ((Integer) judge.elementAt(5)).intValue(),
                        ((Boolean) judge.elementAt(6)).booleanValue());

                oos = new ObjectOutputStream(client.getOutputStream());
                oos.writeObject(Result);

                System.out.println("已返回获取UserLibData结果(String): " + Result.toString());

            } else if (judge.elementAt(0).equals(new Integer(9))) {//根据sql获取UserLibData操作
                Vector Result = null;
                DatabaseBean db = new DatabaseBean();

                Result = db.selectUserLibData(judge.elementAt(1).toString());

                oos = new ObjectOutputStream(client.getOutputStream());
                oos.writeObject(Result);

                System.out.println("已返回通过sql:\n"+judge.elementAt(1).toString()
                        +"获取UserLibData结果(String): " + Result.toString());

            }else if (judge.elementAt(0).equals(new Integer(10))) {//根据sql获取UserData操作
                Vector Result = null;
                DatabaseBean db = new DatabaseBean();

                Result = db.selectUserData(judge.elementAt(1).toString());

                oos = new ObjectOutputStream(client.getOutputStream());
                oos.writeObject(Result);

                System.out.println("已返回通过sql:\n"+judge.elementAt(1).toString()
                        +"获取UserData结果(String): " + Result.toString());

            }else if (judge.elementAt(0).equals(new Integer(11))) {//根据sql获取GameData操作
                Vector Result = null;
                DatabaseBean db = new DatabaseBean();

                Result = db.selectGameData(judge.elementAt(1).toString());

                oos = new ObjectOutputStream(client.getOutputStream());
                oos.writeObject(Result);

                System.out.println("已返回通过sql:\n"+judge.elementAt(1).toString()
                        +"获取GameData结果(String): " + Result.toString());
            }
        }

        private Vector receiveObj()throws  IOException{
            int type = 0;
            Vector Re =null;
            is=client.getInputStream();
            ois=new ObjectInputStream(is);
            try {
                Object o = ois.readObject();
                Re=(Vector) o;
            }catch(ClassNotFoundException e){
                e.printStackTrace();
            }

            return Re;
        }
    }
    //-----
    public static void main(String[] args) {
        new SSS().start();
    }
}