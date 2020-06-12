package ictgradschool.project.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class ArticleSummary implements Serializable {
    private int id;
    private String title;
    private String contentSummary;
    private String cover;
    private String userName;
    private String userNickname;
    private String userAvatar;
    private Timestamp time;
    private int likes;


    public ArticleSummary(int id, String title, String contentSummary, String cover, String userName, String userNickname, String userAvatar, Timestamp time, int likes) {
        this.id = id;
        this.title = title;
        this.contentSummary = contentSummary;
        this.cover = cover;
        this.userName = userName;
        this.userNickname = userNickname;
        this.userAvatar = userAvatar;
        this.time = time;
        this.likes = likes;
    }

    public ArticleSummary() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContentSummary() {
        return contentSummary;
    }

    public void setContentSummary(String contentSummary) {
        this.contentSummary = contentSummary;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserId(String userName) {
        this.userName = userName;
    }

    public String getUserNickname() {
        return userNickname;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname;
    }

    public String getUserAvatar() {
        return userAvatar;
    }

    public void setUserAvatar(String userAvatar) {
        this.userAvatar = userAvatar;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    @Override
    public String toString() {
        return "ArticleSummary{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", contentSummary='" + contentSummary + '\'' +
                ", cover='" + cover + '\'' +
                //", userId=" + userId +
                ", userNickname='" + userNickname + '\'' +
                ", userAvatar='" + userAvatar + '\'' +
                ", time=" + time +
                ", likes=" + likes +
                '}';
    }
}