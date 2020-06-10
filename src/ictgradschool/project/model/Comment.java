package ictgradschool.project.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class Comment implements Serializable {
    private int id;
    private String content;
    private Timestamp time;
    private int userId;
    private String userNickname;
    private String userAvatar;
    private int likes;
    private int level;
    private List<Comment> comments;


    public Comment(int id, String content, Timestamp time, int userId, String userNickname, String userAvatar, int likes, int level, List<Comment> comments) {
        this.id = id;
        this.content = content;
        this.time = time;
        this.userId = userId;
        this.userNickname = userNickname;
        this.userAvatar = userAvatar;
        this.likes = likes;
        this.level = level;
        this.comments = comments;
    }

    public Comment() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", time=" + time +
                ", userId=" + userId +
                ", userNickname='" + userNickname + '\'' +
                ", userAvatar='" + userAvatar + '\'' +
                ", likes=" + likes +
                ", commentList=" + comments +
                '}';
    }
}
