package ictgradschool.project.DAO;

import ictgradschool.project.model.User;
import ictgradschool.project.util.DBConnectionUtils;

import java.io.IOException;
import java.sql.*;

public class UserDAO {
    public static User getUserFromUserName(String userName) throws SQLException, IOException {
        try (Connection connection = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = connection.prepareStatement("SELECT * FROM user WHERE userName=?;");) {
                ps.setString(1, userName);
                try (ResultSet resultSet = ps.executeQuery()) {
                    if (!resultSet.next())
                        return null;
                    return new User(
                            resultSet.getInt("id"),
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
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO user VALUES (NULL, ?, ?, NULL, NULL, NULL, NULL, NULL, NULL, ?, ?, ?, ?);",
                    Statement.RETURN_GENERATED_KEYS)) {

                int rows = ps.executeUpdate();
                if (rows == 0)
                    return false;
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    rs.next();
                    user.setId(rs.getInt(1));
                    return true;
                }
            }
        }
    }

}
