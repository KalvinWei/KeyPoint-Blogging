package ictgradschool.project.model;

import java.io.Serializable;
import java.util.Date;

public class UserProfile implements Serializable {
    private int id;
    private String userName;
    private String nickname;
    private String firstName;
    private String lastName;
    private Date dateOfBirth;
    private String email;
    private String signature;
    private String description;
    private String avatar;
}
