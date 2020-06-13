package ictgradschool.project.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Article implements Serializable {
    private Integer id;
    private String userName;
    private String title;
    private String content;
    private Timestamp time;
    private String cover = "cover5.jpg";
    private String userNickname;
    private String userAvatar;
    private int likes = 0;
    private List<String> tags;
    private List<Comment> comments;

    public Article(Integer id, String title, String content, Timestamp time, String cover, String userName, List<String> tags) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.time = time;
        this.cover = cover;
        this.userName = userName;
        this.tags = tags;
    }

    public Article(Integer id, String title, String content, Timestamp time, String cover, String userName, String userNickname, String userAvatar, int likes, List<String> tags, List<Comment> comments) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.time = time;
        this.cover = cover;
        this.userName = userName;
        this.userNickname = userNickname;
        this.userAvatar = userAvatar;
        this.likes = likes;
        this.tags = tags;
        this.comments = comments;
    }

    public Article() {
    }

    public Article(String userName) {
        this.userName = userName;
        this.tags = new ArrayList<>();
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
            case "userName":
                setUserName(fieldValue);
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

    public String getUserNickname() {
        return userNickname;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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
                ", userNickname='" + userNickname + '\'' +
                ", userAvatar='" + userAvatar + '\'' +
                ", likes=" + likes +
                ", commentList=" + comments +
                '}';
    }
}
