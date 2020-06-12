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
                    "select distinct c.id as id,content,time,parent,article,nickname,avatar,likes\n" +
                            "from comment as c\n" +
                            "    inner join user as u on c.userName = u.userName\n" +
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
                                rs.getString("userName"),
                                rs.getInt("article"),
                                rs.getInt("parent"), //parentId
                                rs.getString("nickname"),
                                rs.getString("avatar"),
                                rs.getInt("likes"),
                                0, //level
                                getCommentsByParentId(this_id, 1)
                        ));
                    }
                    return comments;
                }
            }
        }
    }

    private static List<Comment> getCommentsByParentId(int parentId, int currentLevel) throws IOException, SQLException {
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = conn.prepareStatement(
                    "select distinct c.id as id,content,time,article,nickname,avatar,likes\n" +
                            "from comment as c\n" +
                            "    inner join user as u on c.userName = u.userName\n" +
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
                                rs.getString("userName"),
                                rs.getInt("article"),
                                parentId, //parentId
                                rs.getString("nickname"),
                                rs.getString("avatar"),
                                rs.getInt("likes"),
                                currentLevel, //level
                                getCommentsByParentId(this_id, currentLevel + 1)
                        ));
                    }
                    return comments;
                }
            }
        }
    }

    public static boolean deleteCommentByCommentId(int id) throws IOException, SQLException {
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = conn.prepareStatement(
                    "UPDATE comment SET isDeleted = true WHERE article = ?")){
                ps.setInt(1,id);
                return ps.executeUpdate() == 1;
            }
        }
    }

    public static boolean insertComment(Comment comment) throws IOException, SQLException{
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO comment VALUES (null,?,?,?,?,?,false)")) {
                ps.setString(1, comment.getContent());
                ps.setTimestamp(2, comment.getTime());
                ps.setInt(3,comment.getParent());
                ps.setString(4, comment.getUserName());
                ps.setInt(5,comment.getArticle());

                int rowAffected = ps.executeUpdate();
                if (rowAffected != 0) {
                    try (ResultSet rs = ps.getGeneratedKeys()) {
                        rs.next();
                        comment.setId(rs.getInt(1));
                        return true;
                    }
                }
            }
        }
        return false;
    }
}
