package ictgradschool.project.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class Comment implements Serializable {
    private Integer id;
    private String content;
    private Timestamp time;
    private String userName;
    private int article;
    private int parent;
    private String userNickname;
    private String userAvatar;
    private int likes;
    private int level;
    private List<Comment> comments;


    public Comment(Integer id, String content, Timestamp time, String userName, int article, int parent) {
        this.id = id;
        this.content = content;
        this.time = time;
        this.userName = userName;
        this.article = article;
    }

    public Comment(Integer id, String content, Timestamp time, String userName, int article, int parent, String userNickname, String userAvatar, int likes, int level, List<Comment> comments) {
        this.id = id;
        this.content = content;
        this.time = time;
        this.userName = userName;
        this.article = article;
        this.parent = parent;
        this.userNickname = userNickname;
        this.userAvatar = userAvatar;
        this.likes = likes;
        this.level = level;
        this.comments = comments;
    }

    public Comment() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getArticle() {
        return article;
    }

    public void setArticle(int article) {
        this.article = article;
    }

    public int getParent() {
        return parent;
    }

    public void setParent(int parent) {
        this.parent = parent;
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
                ", userName=" + userName +
                ", userNickname='" + userNickname + '\'' +
                ", userAvatar='" + userAvatar + '\'' +
                ", likes=" + likes +
                ", commentList=" + comments +
                '}';
    }
}
