package ictgradschool.project.DAO;

import ictgradschool.project.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    public static User getUserFromUserName(Connection connection, String userName) throws SQLException {
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
