package ictgradschool.project.servlet.action;

import ictgradschool.project.DAO.ArticleDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DeleteArticle", urlPatterns = {"/deleteArticle"})
public class DeleteArticle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); // do not support
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        try {
            ArticleDAO.deleteArticleByArticleId(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("./articlesPage");
    }
}
