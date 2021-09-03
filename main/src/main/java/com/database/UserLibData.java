package com.database;

public class UserLibData {
    int AppID;
    double Record;
    String LastPlayed;
    Boolean isLocal;
    Boolean isFavorite;

    public UserLibData(int appID, double record, String lastPlayed, int isLocal, int isFavorite) {
        AppID = appID;
        Record = record;
        LastPlayed = lastPlayed;
        this.isLocal = isLocal==0;
        this.isFavorite = isFavorite==0;
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

    @Override
    public String toString() {
        return "{" +
                "AppID=" + AppID +
                ", Record=" + Record +
                ", LastPlayed='" + LastPlayed + '\'' +
                ", isLocal=" + isLocal +
                ", isFavorite=" + isFavorite +
                '}';
    }
}

