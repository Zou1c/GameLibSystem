package com.database;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;

//储存game表的信息
public class GameData implements Serializable {
    String Name;
    String Developer;
    String Publisher;
    java.sql.Date ReleaseDate;
    java.sql.Date LastUpDate;
    double Rate;
    int AppID;
    int PositiveReviews;
    int NegativeReviews;
    int InGame;
    String Size;
    String Icon;
    int Price;

    public GameData(String name, int appID, String size) {
        Name = name;
        AppID = appID;
        Size = size;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int price) {
        Price = price;
    }

    public GameData(String name, String developer, String publisher, java.sql.Date releaseDate, java.sql.Date lastUpDate, double rate, int appID, int positiveReviews, int negativeReviews, int inGame, String size, String icon, String header, String description, String about, int price) {
        Name = name;
        Developer = developer;
        Publisher = publisher;
        ReleaseDate = releaseDate;
        LastUpDate = lastUpDate;
        Rate = rate;
        AppID = appID;
        PositiveReviews = positiveReviews;
        NegativeReviews = negativeReviews;
        InGame = inGame;
        Size = size;
        Icon = icon;
        Header = header;
        Description = description;
        About = about;
        Price=price;
    }

    String Header;
    String Description;
    String About;

    @Override
    public String toString() {
        return "GameData{" +
                "Name='" + Name + '\'' +
                ", Developer='" + Developer + '\'' +
                ", Publisher='" + Publisher + '\'' +
                ", ReleaseDate='" + ReleaseDate + '\'' +
                ", LastUpDate='" + LastUpDate + '\'' +
                ", Rate=" + Rate +
                ", AppID=" + AppID +
                ", PositiveReviews=" + PositiveReviews +
                ", NegativeReviews=" + NegativeReviews +
                ", In_Game=" + InGame +
                ", Size='" + Size + '\'' +
                ", Icon='" + Icon + '\'' +
                ", Price=" + Price +
                ", Header='" + Header + '\'' +
                ", Description='" + Description + '\'' +
                ", About='" + About + '\'' +
                '}';
    }

    public String toString2() {
        return
                "Name='" + Name + '\'' +
                ", Developer='" + Developer + '\'' +
                ", Publisher='" + Publisher + '\'' +
                ", ReleaseDate='" + ReleaseDate + '\'' +
                ", LastUpDate='" + LastUpDate + '\'' +
                ", Rate=" + Rate +
                ", AppID=" + AppID +
                ", PositiveReviews=" + PositiveReviews +
                ", NegativeReviews=" + NegativeReviews +
                ", In_Game=" + InGame +
                ", Size='" + Size + '\'' +
                ", Icon='" + Icon + '\'' +
                ", Price=" + Price +
                ", Header='" + Header + '\'' +
                ", Description='" + Description + '\'' +
                ", About='" + About + '\'';
    }

    public void setName(String name) {
        Name = name;
    }

    public void setDeveloper(String developer) {
        Developer = developer;
    }

    public void setPublisher(String publisher) {
        Publisher = publisher;
    }


    public void setRate(double rate) {
        Rate = rate;
    }

    public void setAppID(int appID) {
        AppID = appID;
    }

    public void setPositiveReviews(int positiveReviews) {
        PositiveReviews = positiveReviews;
    }

    public void setNegativeReviews(int negativeReviews) {
        NegativeReviews = negativeReviews;
    }

    public void setInGame(int inGame) {
        InGame = inGame;
    }

    public void setSize(String size) {
        Size = size;
    }

    public void setIcon(String icon) {
        Icon = icon;
    }

    public void setHeader(String header) {
        Header = header;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public void setAbout(String about) {
        About = about;
    }

    public String getName() {
        return Name;
    }

    public String getDeveloper() {
        return Developer;
    }

    public String getPublisher() {
        return Publisher;
    }

    public java.sql.Date getReleaseDate() {
        return ReleaseDate;
    }

    public void setReleaseDate(java.sql.Date releaseDate) {
        ReleaseDate = releaseDate;
    }

    public java.sql.Date getLastUpDate() {
        return LastUpDate;
    }

    public void setLastUpDate(java.sql.Date lastUpDate) {
        LastUpDate = lastUpDate;
    }

    public double getRate() {
        return Rate;
    }


    public String getRate2(){
        double r=(double)getPositiveReviews()/(getPositiveReviews()+getNegativeReviews());
        BigDecimal bd = new BigDecimal(r*100);
        bd = bd.setScale(2, RoundingMode.HALF_UP);
        double res = bd.doubleValue();
        return ""+res+"%";
    }
    public int getAppID() {
        return AppID;
    }

    public int getPositiveReviews() {
        return PositiveReviews;
    }

    public int getNegativeReviews() {
        return NegativeReviews;
    }

    public int getInGame() {
        return InGame;
    }

    public String getSize() {
        return Size;
    }

    public String getIcon() {
        return Icon;
    }

    public String getHeader() {
        return Header;
    }

    public String getDescription() {
        return Description;
    }

    public String getAbout() {
        return About;
    }
}
