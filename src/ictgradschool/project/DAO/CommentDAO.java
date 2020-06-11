package ictgradschool.project.DAO;

import ictgradschool.project.model.Comment;
import ictgradschool.project.util.DBConnectionUtils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {
    public static List<Comment> getCommentsByArticleId(int id)throws IOException, SQLException {
        return null;
    }

    private static List<Comment> getCommentsByParentId(int id) throws IOException, SQLException {
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = conn.prepareStatement(
                    "select distinct c.id as id,content,time,u.id as userId,nickname,avatar,likes\n" +
                            "from comment as c\n" +
                            "    inner join user as u on c.user = u.id\n" +
                            "    left join (select comment,count(*) as likes from likeComment group by comment) as l on c.id = l.comment\n" +
                            "    where c.parent = ?" +
                            "    order by time desc;")) {
                ps.setInt(1,id);
                try(ResultSet rs = ps.executeQuery()){
                    List<Comment> comments = new ArrayList<>();
                    while(rs.next()){
                        comments.add(new Comment(
                                rs.getInt("id"),
                                rs.getString("content"),
                                rs.getTimestamp("time"),
                                rs.getInt("userId"),
                                rs.getString("nickname"),
                                rs.getString("avatar"),
                                rs.getInt("likes"),
                                0,
                                null
                        ));
                    }
                    return comments;
                }
            }
        }
    }

    public static boolean deleteCommentByCommentId(int id)throws IOException, SQLException {
        return false;
    }
}
