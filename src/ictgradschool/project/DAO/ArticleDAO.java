package ictgradschool.project.DAO;

import ictgradschool.project.model.Article;
import ictgradschool.project.model.ArticleSummary;

import java.util.List;

public class ArticleDAO {
    public static List<ArticleSummary> getAllArticleSummaries() {
        return null;
    }

    public static List<ArticleSummary> getArticleSummariesByUserName(String userName) {
        return null;
    }

    public static Article getArticleByArticleId(int id) {
        return null;
    }

    public static boolean insertOrEditArticle(Article article) {
        if (article.getId() == null) {
            return insertArticle(article);
        } else {
            return editArticle(article);
        }
    }

    public static boolean insertArticle(Article article) {
        return false;
    }

    public static boolean editArticle(Article article) {
        return false;
    }

    public static boolean deleteArticleByArticleId(int id) {
        return false;
    }
}
