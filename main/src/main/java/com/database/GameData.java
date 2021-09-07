package com.database;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;

//储存game表的信息
public class GameData implements Serializable {
    String Name;
    String Developer;
    String Publisher;
    String ReleaseDate;
    String LastUpDate;
    double Rate;
    int AppID;
    int PositiveReviews;
    int NegativeReviews;
    int In_Game;
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

    public GameData(String name, String developer, String publisher, String releaseDate, String lastUpDate, double rate, int appID, int positiveReviews, int negativeReviews, int in_Game, String size, String icon, String header, String description, String about, int price) {
        Name = name;
        Developer = developer;
        Publisher = publisher;
        ReleaseDate = releaseDate;
        LastUpDate = lastUpDate;
        Rate = rate;
        AppID = appID;
        PositiveReviews = positiveReviews;
        NegativeReviews = negativeReviews;
        In_Game = in_Game;
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
                ", In_Game=" + In_Game +
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
                ", In_Game=" + In_Game +
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

    public void setReleaseDate(String releaseDate) {
        ReleaseDate = releaseDate;
    }

    public void setLastUpDate(String lastUpDate) {
        LastUpDate = lastUpDate;
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

    public void setIn_Game(int in_Game) {
        In_Game = in_Game;
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

    public String getReleaseDate() {
        return ReleaseDate;
    }

    public String getLastUpDate() {
        return LastUpDate;
    }

    public double getRate() {
        return Rate;
    }


    public String getRate2(){
        BigDecimal bd = new BigDecimal(Rate*100);
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

    public int getIn_Game() {
        return In_Game;
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
