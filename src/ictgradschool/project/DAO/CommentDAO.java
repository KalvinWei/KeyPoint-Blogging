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
    public static List<Comment> getCommentsByArticleId(int articleId)throws IOException, SQLException {
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = conn.prepareStatement(
                    "select distinct c.id as id,content,time,parent,u.id as userId,article,nickname,avatar,likes\n" +
                            "from comment as c\n" +
                            "    inner join user as u on c.user = u.id\n" +
                            "    left join (select comment,count(*) as likes from likeComment group by comment) as l on c.id = l.comment\n" +
                            "    where c.article = ?" +
                            "    order by time desc;")) {
                ps.setInt(1,articleId);
                try(ResultSet rs = ps.executeQuery()){
                    List<Comment> comments = new ArrayList<>();
                    while(rs.next()){
                        int this_id = rs.getInt("id");
                        comments.add(new Comment(
                                this_id,
                                rs.getString("content"),
                                rs.getTimestamp("time"),
                                rs.getInt("userId"),
                                rs.getInt("article"),
                                rs.getInt("parent"), //parentId
                                rs.getString("nickname"),
                                rs.getString("avatar"),
                                rs.getInt("likes"),
                                0, //level
                                getCommentsByParentId(this_id)

                        ));
                    }
                    return comments;
                }
            }
        }
    }

    private static List<Comment> getCommentsByParentId(int parentId) throws IOException, SQLException {
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = conn.prepareStatement(
                    "select distinct c.id as id,content,time,u.id as userId,article,nickname,avatar,likes\n" +
                            "from comment as c\n" +
                            "    inner join user as u on c.user = u.id\n" +
                            "    left join (select comment,count(*) as likes from likeComment group by comment) as l on c.id = l.comment\n" +
                            "    where c.parent = ?" +
                            "    order by time desc;")) {
                ps.setInt(1,parentId);
                try(ResultSet rs = ps.executeQuery()){
                    List<Comment> comments = new ArrayList<>();
                    while(rs.next()){
                        int this_id = rs.getInt("id");
                        comments.add(new Comment(
                                this_id,
                                rs.getString("content"),
                                rs.getTimestamp("time"),
                                rs.getInt("userId"),
                                rs.getInt("article"),
                                parentId, //parentId
                                rs.getString("nickname"),
                                rs.getString("avatar"),
                                rs.getInt("likes"),
                                0, //level
                                getCommentsByParentId(this_id)

                        ));
                    }
                    return comments;
                }
            }
        }
    }

    public static boolean deleteCommentByCommentId(int id)throws IOException, SQLException {
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = conn.prepareStatement(
                    "UPDATE comment SET isDeleted = true WHERE article = ?")){
                ps.setInt(1,id);
                return ps.executeUpdate() == 1;
            }
        }
    }

    public static boolean insertComment(Comment comment) {

    }
}
