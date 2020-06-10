package ictgradschool.project.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class ArticleSummary implements Serializable {
    private int id;
    private String title;
    private String contentSummary;
    private String cover;
    private int userId;
    private String userNickName;
    private String userAvatar;
    private Timestamp time;
    private int likes;
}