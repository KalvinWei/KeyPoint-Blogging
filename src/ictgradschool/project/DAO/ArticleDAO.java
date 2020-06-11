package ictgradschool.project.DAO;

import ictgradschool.project.model.Article;
import ictgradschool.project.model.ArticleSummary;
import ictgradschool.project.util.DBConnectionUtils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ArticleDAO {
    public static List<ArticleSummary> getAllArticleSummaries() throws IOException, SQLException {
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = conn.prepareStatement(
                    "select distinct a.id as id,title,content,cover,u.id as userId,nickname,avatar,time,likes\n" +
                            "    from article as a\n" +
                            "    inner join user as u on a.user = u.id\n" +
                            "    left join (select article, count(*) as likes from likeArticle group by article) as l on a.id = l.article")) {
                return assembleArticleSummaries(ps);
            }
        }
    }

    public static List<ArticleSummary> getArticleSummariesByUserName(String userName)throws IOException, SQLException  {
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = conn.prepareStatement(
                    "select distinct a.id as id,title,content,cover,u.id as userId,nickname,avatar,time,likes\n" +
                            "from article as a\n" +
                            "inner join user as u on a.user = u.id\n" +
                            "left join (select article, count(*) as likes from likeArticle group by article) as l on a.id = l.article\n" +
                            "where userName = ? ")) {
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
                        rs.getInt("userId"),
                        rs.getString("nickname"),
                        rs.getString("avatar"),
                        rs.getTimestamp("time"),
                        rs.getInt("likes")
                );
                articleSummaries.add(summary);
            }
            return articleSummaries;
        }
    }

    public static Article getArticleByArticleId(int id) throws IOException, SQLException  {
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
            try (PreparedStatement ps = conn.prepareStatement(
                    "select distinct a.id as id,title,content,time,cover,u.id as userId,nickname,avatar,likes,tag\n" +
                            "from article as a\n" +
                            "inner join user as u on a.user = u.id\n" +
                            "left join (select article, count(*) as likes from likeArticle group by article) as l on a.id = l.article\n" +
                            "left join tag as t on a.id = t.article\n" +
                            "where id = ?")) {
                ps.setInt(1,id);
                try(ResultSet rs = ps.executeQuery()){
                    if(rs.next()) return new Article(
                            rs.getInt("id"),
                            rs.getString("title"),
                            rs.getString("content"),
                            rs.getTimestamp("time"),
                            rs.getString("cover"),
                            rs.getInt("userId"),
                            rs.getString("nickname"),
                            rs.getString("avatar"),
                            rs.getInt("likes"),
                            getTagsByArticleId(id),
                            CommentDAO.getCommentsByArticleId(id)
                    );
                    else return null;
                }
            }
        }
    }

    private static List<String> getTagsByArticleId(int articleId) throws IOException, SQLException{
        try (Connection conn = DBConnectionUtils.getConnectionFromClasspath("connection.properties")) {
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
    }

    public static boolean insertOrEditArticle(Article article) throws IOException, SQLException {
        if (article.getId() == null) {
            return insertArticle(article);
        } else {
            return editArticle(article);
        }
    }

    private static boolean insertArticle(Article article) throws IOException, SQLException  {
        return false;
    }

    private static boolean editArticle(Article article) throws IOException, SQLException  {
        return false;
    }

    public static boolean deleteArticleByArticleId(int id) throws IOException, SQLException  {
        return false;
    }
}
