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
    private List<Comment> commentList;


    public Comment(int id, String content, Timestamp time, int userId, String userNickname, String userAvatar, int likes, List<Comment> commentList) {
        this.id = id;
        this.content = content;
        this.time = time;
        this.userId = userId;
        this.userNickname = userNickname;
        this.userAvatar = userAvatar;
        this.likes = likes;
        this.commentList = commentList;
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

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
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
                ", commentList=" + commentList +
                '}';
    }
}
