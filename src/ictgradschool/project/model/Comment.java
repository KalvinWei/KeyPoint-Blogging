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
}
