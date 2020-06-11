package ictgradschool.project.servlet.action;

import ictgradschool.project.DAO.ArticleDAO;
import ictgradschool.project.model.Article;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
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
        int user = Integer.parseInt(req.getParameter("user"));
        Timestamp time = new Timestamp(System.currentTimeMillis());
        List<String> tags = List.of(req.getParameter("tags").split("\\s*,\\s*"));


        Article article = new Article(
                id,
                title,
                content,
                time,
                cover,
                user,
                tags
        );

        ArticleDAO.insertOrEditArticle(article);

        resp.sendRedirect("/articlePage?id=" +id);
    }
}
