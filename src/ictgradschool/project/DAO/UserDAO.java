package ictgradschool.project.DAO;

import ictgradschool.project.model.UserData;
import ictgradschool.project.model.UserProfile;
import ictgradschool.project.util.DBConnectionUtils;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;

public class UserDAO {
    public static UserData getUserDataFromUserName(String userName) throws IOException, SQLException {
        try (Connection connection = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = connection.prepareStatement("SELECT * FROM user WHERE userName=?;");) {
                ps.setString(1, userName);
                try (ResultSet resultSet = ps.executeQuery()) {
                    if (!resultSet.next())
                        return null;
                    return new UserData(
                            resultSet.getString("userName"),
                            resultSet.getString("passwordHash"),
                            resultSet.getString("salt"),
                            resultSet.getInt("iteration")
                    );
                }
            }
        }
    }

//    public static UserData getUserDataFromId(int id) throws SQLException, IOException {
//        try (Connection connection = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
//            try (PreparedStatement ps = connection.prepareStatement("SELECT * FROM user WHERE id=?;");) {
//                ps.setInt(1, id);
//                try (ResultSet resultSet = ps.executeQuery()) {
//                    if (!resultSet.next())
//                        return null;
//                    return new UserData(
//                            resultSet.getString("userName"),
//                            resultSet.getString("passwordHash"),
//                            resultSet.getString("salt"),
//                            resultSet.getInt("iteration")
//                    );
//                }
//            }
//        }
//    }

    public static String insertUser(UserData user) throws IOException, SQLException {
        String defaultAvatarName = "default/guest.png";
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO user VALUES (NULL, ?, ?, NULL, NULL, NULL, NULL, NULL, NULL, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS)) {
                ps.setString(1, user.getUserName());
                ps.setString(3, defaultAvatarName);
                ps.setString(4, user.getPasswordHash());
                ps.setString(5, user.getSalt());
                ps.setInt(6, user.getIteration());

                return user.getUserName();
            }
        }
    }

//    public static UserProfileSummary getUserProfileSummaryFromUserName(String userName) throws SQLException, IOException {
//        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
//            try (PreparedStatement ps = conn.prepareStatement(
//                    "SELECT * FROM user WHERE userName = ?")) {
//                ps.setString(1, userName);
//                try (ResultSet rs = ps.executeQuery()) {
//                    if (rs.next())
//                        return new UserProfileSummary(
//                                rs.getString("userName"),
//                                rs.getString("nickname"),
//                                rs.getString("email"),
//                                rs.getString("signature"),
//                                rs.getString("avatar"),
//                                rs.getString("description")
//                        );
//                    else return null;
//                }
//            }
//        }
//    }

    public static UserProfile getUserProfileFromId(Connection conn, int id) throws SQLException {
        try (PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM user WHERE id = ?")) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next())
                    return new UserProfile(
                            rs.getInt("id"),
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

    public static UserProfile getUserProfileFromId(int id) throws IOException, SQLException {
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
           return getUserProfileFromId(conn, id);
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
                                rs.getInt("id"),
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
                    "UPDATE user SET userName = ?, nickname = ?, firstName = ?, " +
                            "lastName = ?, email = ?, dateOfBirth = ?, signature = ? , description = ?, avatar = ? " +
                            "WHERE id = ? ")) {
                ps.setString(1,userProfile.getUserName());
                ps.setString(2,userProfile.getNickname());
                ps.setString(3,userProfile.getFirstName());
                ps.setString(4,userProfile.getLastName());
                ps.setString(5,userProfile.getEmail());
                ps.setDate(6, Date.valueOf(userProfile.getDateOfBirth()));
                ps.setString(7,userProfile.getSignature());
                ps.setString(8,userProfile.getDescription());
                ps.setString(9,userProfile.getAvatar());
                ps.setInt(10,userProfile.getId());

                ps.executeUpdate();
            }
        }
    }

    public static boolean deleteUserById(int id) throws SQLException, IOException {
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = conn.prepareStatement(
                    "DELETE FROM user WHERE id = ?")) {
                ps.setInt(1, id);
                return ps.execute();
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
