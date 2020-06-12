package ictgradschool.project.DAO;

import ictgradschool.project.model.Article;
import ictgradschool.project.model.ArticleSummary;
import ictgradschool.project.util.DBConnectionUtils;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ArticleDAO {
    public static List<ArticleSummary> getAllArticleSummaries() throws IOException, SQLException {
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = conn.prepareStatement(
                    "select distinct a.id as id,title,content,cover, u.userName,nickname,avatar,time,likes,isDeleted\n" +
                            "    from article as a\n" +
                            "    inner join user as u on a.userName = u.userName\n" +
                            "    left join (select article, count(*) as likes from likeArticle group by article) as l on a.id = l.article\n" +
                            "    where isDeleted = false")) {
                return assembleArticleSummaries(ps);
            }
        }
    }

    public static List<ArticleSummary> getArticleSummariesByUserName(String userName)throws IOException, SQLException  {
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = conn.prepareStatement(
                    "select distinct a.id as id,title,content,cover,u.userName,nickname,avatar,time,likes,isDeleted\n" +
                            "from article as a\n" +
                            "inner join user as u on a.userName = u.userName\n" +
                            "left join (select article, count(*) as likes from likeArticle group by article) as l on a.id = l.article\n" +
                            "where a.userName = ? and isDeleted = false")) {
                ps.setString(1, userName);
                return assembleArticleSummaries(ps);
            }
        }
    }

    private static List<ArticleSummary> assembleArticleSummaries(PreparedStatement ps) throws SQLException {
        try(ResultSet rs = ps.executeQuery()){
            List<ArticleSummary> articleSummaries = new ArrayList<>();
            while(rs.next()){
                String content = rs.getString("content");
                String contentSummary = content.length() > 300 ? content.substring(0,299) + "..." : content;
                ArticleSummary summary = new ArticleSummary(
                        rs.getInt("id"),
                        rs.getString("title"),
                        contentSummary,
                        rs.getString("cover"),
                        rs.getString("u.userName"),
                        rs.getString("nickname"),
                        rs.getString("avatar"),
                        rs.getTimestamp("time"),
                        rs.getInt("likes"),
                        null
                );
                articleSummaries.add(summary);
            }
            return articleSummaries;
        }
    }

    public static Article getArticleByArticleId(int id) throws IOException, SQLException  {
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = conn.prepareStatement(
                    "select distinct a.id as id,title,content,time,cover,u.userName,nickname,avatar,likes,isDeleted\n" +
                            "from article as a\n" +
                            "inner join user as u on a.userName = u.userName\n" +
                            "left join (select article, count(*) as likes from likeArticle group by article) as l on a.id = l.article\n" +
                            "where a.id = ? and isDeleted = false")) {
                ps.setInt(1,id);
                try(ResultSet rs = ps.executeQuery()){
                    if(rs.next()) return new Article(
                            rs.getInt("id"),
                            rs.getString("title"),
                            rs.getString("content"),
                            rs.getTimestamp("time"),
                            rs.getString("cover"),
                            rs.getString("userName"),
                            rs.getString("nickname"),
                            rs.getString("avatar"),
                            rs.getInt("likes"),
                            getTagsByArticleId(conn, id),
                            CommentDAO.getCommentsByArticleId(conn, id)
                    );
                    else return null;
                }
            }
        }
    }

    private static List<String> getTagsByArticleId(Connection conn, int articleId) throws IOException, SQLException{
            try (PreparedStatement ps = conn.prepareStatement(
                    "SELECT tag FROM tag WHERE article = ?")) {
                ps.setInt(1, articleId);
                try(ResultSet rs = ps.executeQuery()){
                    List<String> tags = new ArrayList<>();
                    while(rs.next()){
                        tags.add(rs.getString("tag"));
                    }
                    return tags;
                }
            }
    }

    public static boolean insertOrEditArticle(Article article) throws IOException, SQLException {
        if (article.getId() == null) {
            return insertArticle(article);
        } else {
            return editArticle(article);
        }
    }

    private static boolean insertArticle(Article article) throws IOException, SQLException  {
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            //insert article into table `article`
            boolean articleInsert = false;
            try (PreparedStatement ps = conn.prepareStatement(
                    "INSERT article VALUES (null,?,?,?,?,?,false)", Statement.RETURN_GENERATED_KEYS)) {
                ps.setString(1,article.getTitle());
                ps.setString(2,article.getContent());
                ps.setTimestamp(3,article.getTime());
                ps.setString(4,article.getCover());
                ps.setString(5,article.getUserName());

                int rowAffected = ps.executeUpdate();
                if(rowAffected != 0) {
                    try(ResultSet rs = ps.getGeneratedKeys()){
                        rs.next();
                        article.setId(rs.getInt(1));
                        articleInsert = true;
                    }
                }
            }
            //insert tags into table `tag`
            return articleInsert && TagDAO.insertTags(conn, article.getId(), article.getTags());
        }
    }

    private static boolean editArticle(Article article) throws IOException, SQLException  {
        boolean articleUpdate = false;
        boolean tagUpdate = false;
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            //insert article into table `article`
            try (PreparedStatement ps = conn.prepareStatement(
                    "UPDATE article set title = ?, content = ?, time = ?, cover = ? WHERE id = ?")) {
                ps.setString(1,article.getTitle());
                ps.setString(2,article.getContent());
                ps.setTimestamp(3,article.getTime());
                ps.setString(4,article.getCover());
                ps.setInt(5,article.getId());
                articleUpdate = (ps.executeUpdate() == 1);
            }

            //todo： update tags into table `tag`
            //
            /*try(PreparedStatement ps = conn.prepareStatement(
                    "create temporary table _tags as select * from tag where article = ?")){
                ps.setInt(1, article.getId());
                ps.executeQuery();
            }
            for (String tag : article.getTags()) {
                try(PreparedStatement ps = conn.prepareStatement(
                        "insert into _tags set tag = ?")){
                    ps.setString(1, tag);
                    ps.executeQuery();
                }
            }
            try(PreparedStatement ps = conn.prepareStatement(
                    "delete from tag where article = ? and tag not in (select  tag from _tags);\n" +
                            "    insert into tag (select * from _tags intersect select * from tag);")){
                ps.setInt(1, article.getId());
                ps.executeQuery();
            }*/
            tagUpdate = TagDAO.insertTags(conn, article.getId(), article.getTags());
        }

        return articleUpdate && tagUpdate;
    }

    public static boolean deleteArticleByArticleId(int id) throws IOException, SQLException  {
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = conn.prepareStatement(
                    "UPDATE article SET isDeleted = true WHERE id = ?")) {
                ps.setInt(1,id);
                return ps.executeUpdate() == 1;
            }
        }
    }

}
