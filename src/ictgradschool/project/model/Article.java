package ictgradschool.project.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class Article implements Serializable {
    private Integer id;
    private String title;
    private String content;
    private Timestamp time;
    private String cover;
    private int userId;
    private String userNickname;
    private String userAvatar;
    private int likes;
    private List<String> tags;
    private List<Comment> comments;

    public Article(Integer id, String title, String content, Timestamp time, String cover, int userId,  List<String> tags) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.time = time;
        this.cover = cover;
        this.userId = userId;
        this.tags = tags;
    }

    public Article() {
    }

    public static Article getBlankArticle(String userName) {
        return null;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
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

    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", time=" + time +
                ", cover='" + cover + '\'' +
                ", userId=" + userId +
                ", userNickname='" + userNickname + '\'' +
                ", userAvatar='" + userAvatar + '\'' +
                ", likes=" + likes +
                ", tags=" + tags +
                ", commentList=" + comments +
                '}';
    }
}
