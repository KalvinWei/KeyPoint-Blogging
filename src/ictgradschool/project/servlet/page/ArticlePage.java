package ictgradschool.project.servlet.page;

import ictgradschool.project.DAO.ArticleDAO;
import ictgradschool.project.model.Article;
import ictgradschool.project.util.AuthenticationUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ArticlePage", urlPatterns = {"/articlePage"})
public class ArticlePage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AuthenticationUtil.checkLogInStatus(req);
        int id = Integer.parseInt(req.getParameter("id"));
        try {
            Article article = ArticleDAO.getArticleByArticleId(id);
            if (article == null) {
                resp.sendRedirect("./indexPage");
            }
            req.setAttribute("article", article);
            req.setAttribute("isOwner", article.getUserName().equals(AuthenticationUtil.getLoggedInUserName(req)));

        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.getRequestDispatcher("/WEB-INF/jsp/article.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
