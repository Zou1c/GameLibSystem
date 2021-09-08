package com.database;

import com.database.DatabaseBean;
import com.database.GameData;

import java.io.IOException;
import java.util.Vector;

public class sort {
    public static int getSortValue(String sortInfo){
        int res;
        switch (sortInfo){
            case "游戏名称":res=0;break;
            case "游戏时间":res=1;break;
            case "磁盘空间":res=2;break;
            case "用户评分":res=3;break;
            case "最近热门":res=4;break;
            case "发行日期":res=5;break;
            case "最低价格":res=6;break;
            case "最近游戏":res=7;break;
            default:res=0;break;
        }
        return res;
    }
    public static int getDownloadOptionValue(String Info){
        int res;
        switch (Info){
            case "全部":res=0;break;
            case "已下载":res=1;break;
            case "未下载":res=2;break;
            default:res=0;break;
        }
        return res;
    }
}