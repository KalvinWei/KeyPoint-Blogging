package ictgradschool.project.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class Comment implements Serializable {
    private Integer id;
    private String content;
    private Timestamp time;
    private int article;
    private Integer parent;
    private int likes;
    private int level;
    private UserProfile user;
    private List<Comment> comments;


    public Comment(Integer id, String content, Timestamp time, UserProfile user, int article, Integer parent) {
        this.id = id;
        this.content = content;
        this.time = time;
        this.user = user;
        this.article = article;
        this.parent = parent;
    }

    public Comment(Integer id, String content, Timestamp time, int article, int parent, int likes, int level, UserProfile user, List<Comment> comments) {
        this.id = id;
        this.content = content;
        this.time = time;
        this.article = article;
        this.parent = parent;
        this.likes = likes;
        this.level = level;
        this.user = user;
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

    public int getArticle() {
        return article;
    }

    public void setArticle(int article) {
        this.article = article;
    }

    public Integer getParent() {
        return parent;
    }

    public void setParent(Integer parent) {
        this.parent = parent;
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

    public UserProfile getUser() {
        return user;
    }

    public void setUser(UserProfile user) {
        this.user = user;
    }
}
