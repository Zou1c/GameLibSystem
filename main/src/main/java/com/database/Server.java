package com.database;

import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
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
                Vector Pak = new Vector();
                DatabaseBean db = new DatabaseBean();

                Result = db.getUserStoreData(
                        judge.elementAt(1).toString(),
                        ((Integer) judge.elementAt(2)).intValue(),
                        ((Integer) judge.elementAt(3)).intValue(),
                        ((Boolean) judge.elementAt(4)).booleanValue());

                oos = new ObjectOutputStream(client.getOutputStream());

                Pak.addElement(new Integer(Result.size())); //客户端循环次数

                for(int i=0;i<Result.size();i++) {
                    GameData gg = (GameData) Result.elementAt(i);

                    Pak.addElement(gg.Name);
                    Pak.addElement(gg.Developer);
                    Pak.addElement(gg.Publisher);
                    Pak.addElement(gg.ReleaseDate);
                    Pak.addElement(gg.LastUpDate);
                    Pak.addElement(new Double(gg.Rate));
                    Pak.addElement(new Integer(gg.AppID));
                    Pak.addElement(new Integer(gg.PositiveReviews));
                    Pak.addElement(new Integer(gg.NegativeReviews));
                    Pak.addElement(new Integer(gg.InGame));
                    Pak.addElement(gg.Size);
                    Pak.addElement(gg.Icon);
                    Pak.addElement(new Integer(gg.Price));
                    Pak.addElement(gg.Header);
                    Pak.addElement(gg.Description);
                    Pak.addElement(gg.About);
                }
                oos.writeObject(Pak);

                System.out.println(oos.toString());

            } else if (judge.elementAt(0).equals(new Integer(8))) {//获取UserLibData操作
                Vector Result = null;
                Vector Pak = new Vector();
                DatabaseBean db = new DatabaseBean();

                Result = db.getUserLibData(
                        judge.elementAt(1).toString(),
                        ((Integer) judge.elementAt(2)).intValue(),
                        ((Integer) judge.elementAt(3)).intValue(),
                        ((Integer) judge.elementAt(4)).intValue(),
                        ((Integer) judge.elementAt(5)).intValue(),
                        ((Boolean) judge.elementAt(6)).booleanValue());

                oos = new ObjectOutputStream(client.getOutputStream());

                Pak.addElement(new Integer(Result.size())); //客户端循环次数

                for(int i=0;i<Result.size();i++){
                    UserLibData us = (UserLibData) Result.elementAt(i);

                    Pak.addElement(new Integer(us.getAppID()));
                    Pak.addElement(new Double(us.getRecord()));
                    Pak.addElement(us.getLastPlayed());
                    Pak.addElement(us.getLocal());
                    Pak.addElement(us.getFavorite());

                    GameData gd = us.getGameData();
                    Pak.addElement(gd.getName());
                    Pak.addElement(gd.getDeveloper());
                    Pak.addElement(gd.getPublisher());
                    Pak.addElement(gd.getReleaseDate());
                    Pak.addElement(gd.getLastUpDate());
                    Pak.addElement(new Double(gd.getRate()));
                    Pak.addElement(new Integer(gd.getAppID()));
                    Pak.addElement(new Integer(gd.getPositiveReviews()));
                    Pak.addElement(new Integer(gd.getNegativeReviews()));
                    Pak.addElement(new Integer(gd.getInGame()));
                    Pak.addElement(gd.getSize());
                    Pak.addElement(gd.getIcon());
                    Pak.addElement(new Integer(gd.getPrice()));
                    Pak.addElement(gd.getHeader());
                    Pak.addElement(gd.getDescription());
                    Pak.addElement(gd.getAbout());
                }

                oos.writeObject(Pak);

                System.out.println("已返回获取UserLibData结果(String): " + Result.toString());

            } else if (judge.elementAt(0).equals(new Integer(9))) {//根据sql获取UserLibData操作
                Vector Result = null;
                Vector Pak = new Vector();
                DatabaseBean db = new DatabaseBean();

                Result = db.selectUserLibData(judge.elementAt(1).toString());

                oos = new ObjectOutputStream(client.getOutputStream());

                Pak.addElement(new Integer(Result.size())); //客户端循环次数

                for(int i=0;i<Result.size();i++){
                    UserLibData us = (UserLibData) Result.elementAt(i);

                    Pak.addElement(new Integer(us.getAppID()));
                    Pak.addElement(new Double(us.getRecord()));
                    Pak.addElement(us.getLastPlayed());
                    Pak.addElement(us.getLocal());
                    Pak.addElement(us.getLocal());

                    GameData gd = us.getGameData();
                    Pak.addElement(gd.getName());
                    Pak.addElement(gd.getDeveloper());
                    Pak.addElement(gd.getPublisher());
                    Pak.addElement(gd.getReleaseDate());
                    Pak.addElement(gd.getLastUpDate());
                    Pak.addElement(new Double(gd.getRate()));
                    Pak.addElement(new Integer(gd.getAppID()));
                    Pak.addElement(new Integer(gd.getPositiveReviews()));
                    Pak.addElement(new Integer(gd.getNegativeReviews()));
                    Pak.addElement(new Integer(gd.getInGame()));
                    Pak.addElement(gd.getSize());
                    Pak.addElement(gd.getIcon());
                    Pak.addElement(new Integer(gd.getPrice()));
                    Pak.addElement(gd.getHeader());
                    Pak.addElement(gd.getDescription());
                    Pak.addElement(gd.getAbout());
                }

                oos.writeObject(Result);

                System.out.println("已返回通过sql:\n"+judge.elementAt(1).toString()
                        +"获取UserLibData结果(String): " + Result.toString());

            }else if (judge.elementAt(0).equals(new Integer(10))) {//根据sql获取UserData操作
                Vector<UserData> Result = null;
                Vector Pak = new Vector();
                DatabaseBean db = new DatabaseBean();

                Result = db.selectUserData(judge.elementAt(1).toString());

                oos = new ObjectOutputStream(client.getOutputStream());

                Pak.addElement(new Integer(Result.size())); //客户端循环次数

                for(int i=0;i<Result.size();i++){
                    UserData USD = (UserData) Result.elementAt(i);

                    Pak.addElement(new Integer(USD.getUserID()));
                    Pak.addElement(USD.getUserName());
                    Pak.addElement(USD.getPassword());
                    Pak.addElement(new Integer(USD.getBalance()));

                    Vector Vus = USD.getUserLibData();
                    //System.out.println(Vus.elementAt(0).toString());
                    if(Vus==null){
                        Pak.addElement(new Integer(99999));
                        continue;
                    }

                    Pak.addElement(new Integer(Vus.size()));

                    for(int j=0;j<Vus.size();j++){
                        Pak.addElement(new Integer(((UserLibData)Vus.elementAt(j)).getAppID()));
                        Pak.addElement(new Double(((UserLibData)Vus.elementAt(j)).getRecord()));
                        Pak.addElement(((UserLibData)Vus.elementAt(j)).getLastPlayed());
                        Pak.addElement(((UserLibData)Vus.elementAt(j)).getLocal());
                        Pak.addElement(((UserLibData)Vus.elementAt(j)).getFavorite());

                        GameData gd = ((UserLibData)Vus.elementAt(j)).getGameData();
                        Pak.addElement(gd.getName());
                        Pak.addElement(gd.getDeveloper());
                        Pak.addElement(gd.getPublisher());
                        Pak.addElement(gd.getReleaseDate());
                        Pak.addElement(gd.getLastUpDate());
                        Pak.addElement(new Double(gd.getRate()));
                        Pak.addElement(new Integer(gd.getAppID()));
                        Pak.addElement(new Integer(gd.getPositiveReviews()));
                        Pak.addElement(new Integer(gd.getNegativeReviews()));
                        Pak.addElement(new Integer(gd.getInGame()));
                        Pak.addElement(gd.getSize());
                        Pak.addElement(gd.getIcon());
                        Pak.addElement(new Integer(gd.getPrice()));
                        Pak.addElement(gd.getHeader());
                        Pak.addElement(gd.getDescription());
                        Pak.addElement(gd.getAbout());
                    }


                }

                oos.writeObject(Pak);

                System.out.println("已返回通过sql:\n"+judge.elementAt(1).toString()
                        +"获取UserData结果(String): " + Result.toString());

            }else if (judge.elementAt(0).equals(new Integer(11))) {//根据sql获取GameData操作
                Vector Result = null;
                Vector Pak = new Vector();
                DatabaseBean db = new DatabaseBean();

                Result = db.selectGameData(judge.elementAt(1).toString());

                oos = new ObjectOutputStream(client.getOutputStream());

                Pak.addElement(new Integer(Result.size()));

                for(int i=0;i<Result.size();i++) {
                    GameData gg = (GameData) Result.elementAt(i);

                    Pak.addElement(gg.Name);
                    Pak.addElement(gg.Developer);
                    Pak.addElement(gg.Publisher);
                    Pak.addElement(gg.ReleaseDate);
                    Pak.addElement(gg.LastUpDate);
                    Pak.addElement(new Double(gg.Rate));
                    Pak.addElement(new Integer(gg.AppID));
                    Pak.addElement(new Integer(gg.PositiveReviews));
                    Pak.addElement(new Integer(gg.NegativeReviews));
                    Pak.addElement(new Integer(gg.InGame));
                    Pak.addElement(gg.Size);
                    Pak.addElement(gg.Icon);
                    Pak.addElement(new Integer(gg.Price));
                    Pak.addElement(gg.Header);
                    Pak.addElement(gg.Description);
                    Pak.addElement(gg.About);
                }

                oos.writeObject(Pak);

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
        new Server().start();
    }
}
