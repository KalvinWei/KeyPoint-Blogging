package ictgradschool.project.model;

public class User {
    private String userName;
    private String nickname;
    private String passwordHash;
    private String salt;
    private int iteration;

    public User(String userName, String nickname, String passwordHash, String salt, int iteration) {
        this.userName = userName;
        this.nickname = nickname;
        this.passwordHash = passwordHash;
        this.salt = salt;
        this.iteration = iteration;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public int getIteration() {
        return iteration;
    }

    public void setIteration(int iteration) {
        this.iteration = iteration;
    }
}
