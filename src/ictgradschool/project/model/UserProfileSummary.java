package ictgradschool.project.model;

import java.io.Serializable;

public class UserProfileSummary implements Serializable {
    private Integer id;
    private String userName;
    private String nickname;
    private String email;
    private String signature;
    private String avatar;
    private String description;

    public UserProfileSummary(Integer id, String userName, String nickname, String email, String signature, String avatar, String description) {
        this.id = id;
        this.userName = userName;
        this.nickname = nickname;
        this.email = email;
        this.signature = signature;
        this.avatar = avatar;
        this.description = description;
    }

    public UserProfileSummary() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
