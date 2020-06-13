package ictgradschool.project.DAO;

import ictgradschool.project.model.User;
import ictgradschool.project.model.UserProfile;
import ictgradschool.project.model.UserProfileSummary;
import ictgradschool.project.util.DBConnectionUtils;

import javax.ejb.Local;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;

public class UserDAO {
    public static User getUserFromUserName(String userName) throws SQLException, IOException {
        try (Connection connection = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = connection.prepareStatement("SELECT * FROM user WHERE userName=?;");) {
                ps.setString(1, userName);
                try (ResultSet resultSet = ps.executeQuery()) {
                    if (!resultSet.next())
                        return null;
                    return new User(
                            resultSet.getString("userName"),
                            resultSet.getString("nickname"),
                            resultSet.getString("passwordHash"),
                            resultSet.getString("salt"),
                            resultSet.getInt("iteration")
                    );
                }
            }
        }
    }

    public static boolean insertUser(User user) throws IOException, SQLException {
        String defaultAvatarName = "default/guest.png";
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO user VALUES (?, ?, NULL, NULL, NULL, NULL, NULL, NULL, ?, ?, ?, ?);")) {
                ps.setString(1, user.getUserName());
                ps.setString(2, user.getNickname());
                ps.setString(3, defaultAvatarName);
                ps.setString(4, user.getPasswordHash());
                ps.setString(5, user.getSalt());
                ps.setInt(6, user.getIteration());
                return ps.executeUpdate() != 0;
            }
        }
    }

    public static UserProfileSummary getUserProfileSummaryFromUserName(String userName) throws SQLException, IOException {
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = conn.prepareStatement(
                    "SELECT * FROM user WHERE userName = ?")) {
                ps.setString(1, userName);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next())
                        return new UserProfileSummary(
                                rs.getString("userName"),
                                rs.getString("nickname"),
                                rs.getString("email"),
                                rs.getString("signature"),
                                rs.getString("avatar"),
                                rs.getString("description")
                        );
                    else return null;
                }
            }
        }
    }

    public static UserProfile getUserProfileFromUserName(String userName) throws IOException, SQLException {
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = conn.prepareStatement(
                    "SELECT * FROM user WHERE userName = ?")) {
                ps.setString(1, userName);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next())
                        return new UserProfile(
                                rs.getString("userName"),
                                rs.getString("nickname"),
                                rs.getString("firstName"),
                                rs.getString("lastName"),
                                rs.getObject("dateOfBirth", LocalDate.class),
                                rs.getString("email"),
                                rs.getString("signature"),
                                rs.getString("description"),
                                rs.getString("avatar")
                        );
                    else return null;
                }
            }
        }
    }

    public static void saveProfile(UserProfile userProfile) throws IOException, SQLException {
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = conn.prepareStatement(
                    "UPDATE user SET nickname = ?, firstName = ?, " +
                            "lastName = ?, email = ?, dateOfBirth = ?, signature = ? , description = ?, avatar = ? " +
                            "WHERE userName = ? ")) {
                ps.setString(1,userProfile.getNickname());
                ps.setString(2,userProfile.getFirstName());
                ps.setString(3,userProfile.getLastName());
                ps.setString(4,userProfile.getEmail());
                ps.setDate(5, Date.valueOf(userProfile.getDateOfBirth()));
                ps.setString(6,userProfile.getSignature());
                ps.setString(7,userProfile.getDescription());
                ps.setString(8,userProfile.getAvatar());
                ps.setString(9,userProfile.getUserName());

                ps.executeUpdate();
            }
        }
    }

    public static boolean deleteUserByUserName(String userName) throws IOException, SQLException{
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = conn.prepareStatement(
                    "DELETE FROM user WHERE userName = ?")) {
                ps.setString(1, userName);
                return ps.execute();
            }
        }
    }

}
