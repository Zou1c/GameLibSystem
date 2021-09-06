package com.database;

import java.io.Serializable;

public class UserLibData implements Serializable {
    int AppID;
    double Record;
    String LastPlayed;
    Boolean isLocal;
    Boolean isFavorite;
    GameData gameData;

    public UserLibData(int appID, double record, String lastPlayed, int isLocal, int isFavorite,GameData gd) {
        AppID = appID;
        Record = record;
        LastPlayed = lastPlayed;
        this.isLocal = isLocal==0;
        this.isFavorite = isFavorite==0;
        gameData=gd;
    }

    public int getAppID() {
        return AppID;
    }

    public double getRecord() {
        return Record;
    }

    public String getLastPlayed() {
        return LastPlayed;
    }

    public Boolean getLocal() {
        return isLocal;
    }

    public Boolean getFavorite() {
        return isFavorite;
    }

    public void setAppID(int appID) {
        AppID = appID;
    }

    public void setRecord(double record) {
        Record = record;
    }

    public void setLastPlayed(String lastPlayed) {
        LastPlayed = lastPlayed;
    }

    public void setLocal(Boolean local) {
        isLocal = local;
    }

    public void setFavorite(Boolean isfavorite) {
        isFavorite = isfavorite;
    }

    public GameData getGameData() {
        return gameData;
    }

    @Override
    public String toString() {
        return "\n{" +
                gameData.toString2()+
                ", Record=" + Record +
                ", LastPlayed='" + LastPlayed + '\'' +
                ", isLocal=" + isLocal +
                ", isFavorite=" + isFavorite +
                '}';
    }
}

