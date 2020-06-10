package ictgradschool.project.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class Article implements Serializable {
    private int id;
    private String title;
    private String content;
    private Timestamp time;
    private String cover;
    private int userId;
    private String userNickname;
    private String userAvatar;
    private int likes;
    private List<String> tags;
    private List<Comment> commentList;
}
