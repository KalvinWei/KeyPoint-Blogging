package ictgradschool.project.DAO;

import ictgradschool.project.util.DBConnectionUtils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class TagDAO {
    public static boolean insertTags(int article, List<String> tags) throws IOException, SQLException {
        boolean result = false;
        removeAllTagsByArticle(article);
        for (String tag : tags) {
            result = result || insertTag(article, tag);
        }
        return result;
    }

    private static void removeAllTagsByArticle(int article) throws IOException, SQLException {
        try (Connection connection = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = connection.prepareStatement("DELETE FROM tag WHERE article = ?")) {
                ps.setInt(1, article);
                ps.executeUpdate();
            }
        }
    }

    private static boolean insertTag(int article, String tag) throws IOException, SQLException {
        try (Connection connection = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = connection.prepareStatement("INSERT INTO tag VALUES (?, ?)")) {
                ps.setInt(1, article);
                ps.setString(2, tag);
                return ps.executeUpdate() != 0;
            }
        }
    }
}
