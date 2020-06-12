package ictgradschool.project.servlet.action;

import ictgradschool.project.DAO.ArticleDAO;
import ictgradschool.project.model.Article;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "PostArticle", urlPatterns = {"/postArticle"})
public class PostArticle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); // do not support
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idString = req.getParameter("id");
        Integer id;
        if (idString == null || idString.isEmpty()) {
            id = null;
        } else {
            id = Integer.parseInt(req.getParameter("id"));
        }
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String cover = req.getParameter("cover");
        String userName = req.getParameter("userName");
        Timestamp time = new Timestamp(System.currentTimeMillis());
        List<String> tags = Arrays.asList(req.getParameter("tags").split("\\s*,\\s*"));
        tags.removeIf(String::isEmpty);

        Article article = new Article(
                id,
                title,
                content,
                time,
                cover,
                userName,
                tags
        );

        try {
            ArticleDAO.insertOrEditArticle(article);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        resp.sendRedirect("./articlePage?id=" + article.getId());
    }
}
