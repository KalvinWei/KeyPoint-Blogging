package ictgradschool.project.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Article implements Serializable {
    private Integer id;
    private String title;
    private String content;
    private Timestamp time;
    private String cover = "cover5.jpg";
    private int likes = 0;
    private UserProfile user;
    private List<String> tags = new ArrayList<>();
    private List<Comment> comments = new ArrayList<>();

    public Article(Integer id, String title, String content, Timestamp time, String cover, UserProfile user, int likes, List<String> tags, List<Comment> comments) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.time = time;
        this.cover = cover;
        this.user = user;
        this.likes = likes;
        this.tags = tags;
        this.comments = comments;
    }

    public Article() {
    }

    public Article(UserProfile user) {
        this.user = user;
    }

    public void setField(String fieldName, String fieldValue) {
        switch (fieldName) {
            case "id":
                setId(fieldValue.isEmpty() ? null : Integer.parseInt(fieldValue));
                break;
            case "title":
                setTitle(fieldValue);
                break;
            case "content":
                setContent(fieldValue);
                break;
            case "cover":
                setCover(fieldValue);
                break;
            case "tags":
                List<String> tags = Stream.of(fieldValue.split("\\s*,\\s*"))
                        .distinct()
                        .filter(tag -> !tag.isEmpty())
                        .collect(Collectors.toList());
                setTags(tags);
                break;
        }
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

    public void setUser(UserProfile user) {
        this.user = user;
    }

    public UserProfile getUser() {
        return user;
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
}
