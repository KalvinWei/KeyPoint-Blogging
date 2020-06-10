package ictgradschool.project.DAO;

import ictgradschool.project.model.User;
import ictgradschool.project.util.DBConnectionUtils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
                            resultSet.getString("passwordHash"),
                            resultSet.getString("salt"),
                            resultSet.getInt("iteration")
                    );
                }
            }
        }
    }


}
