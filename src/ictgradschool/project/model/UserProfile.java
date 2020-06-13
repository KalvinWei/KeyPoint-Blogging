package ictgradschool.project.model;

import java.io.Serializable;
import java.time.LocalDate;

public class UserProfile implements Serializable {
    private Integer id;
    private String userName;
    private String nickname;
    private String firstName;
    private String lastName;
    private LocalDate dateOfBirth;
    private String email;
    private String signature;
    private String description;
    private String avatar = "default/guest.png";

    public UserProfile(Integer id, String userName, String nickname, String firstName, String lastName, LocalDate dateOfBirth, String email, String signature, String description, String avatar) {
        this.id = id;
        this.userName = userName;
        this.nickname = nickname;
        this.firstName = firstName;
        this.lastName = lastName;
        this.dateOfBirth = dateOfBirth;
        this.email = email;
        this.signature = signature;
        this.description = description;
        this.avatar = avatar;
    }

    public UserProfile() {
    }

    public void setField(String fieldName, String fieldValue) {
        switch (fieldName) {
            case "userName":
                setUserName(fieldValue);
                break;
            case "nickname":
                setNickname(fieldValue);
                break;
            case "firstName":
                setFirstName(fieldValue);
                break;
            case "lastName":
                setLastName(fieldValue);
                break;
            case "dateOfBirth":
                setDateOfBirth(LocalDate.parse(fieldValue));
                break;
            case "email":
                setEmail(fieldValue);
                break;
            case "signature":
                setSignature(fieldValue);
                break;
            case "description":
                setDescription(fieldValue);
                break;
            case "avatar":
                setAvatar(fieldValue);
                break;
        }
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

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
