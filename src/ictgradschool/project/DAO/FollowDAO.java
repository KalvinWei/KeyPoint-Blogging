package ictgradschool.project.DAO;

import ictgradschool.project.model.User;

import java.sql.Connection;
import java.util.List;

public class FollowDAO {
    public static boolean checkFollowStatus(int followeeId, int followerId) {
        return false;
    }

    public static boolean follow(int followeeId, int followerId) {
        return false;
    }

    public static boolean unfollow(int followeeId, int followerId) {
        return false;
    }

    public static List<User> getUsersByFollowee(Connection conn, int followeeId) {
        return null;
    }

    public static List<User> getUsersByFollower(Connection conn, int followerId) {
        return null;
    }
}
