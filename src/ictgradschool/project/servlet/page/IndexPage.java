package ictgradschool.project.servlet.page;

import ictgradschool.project.DAO.ArticleDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "IndexPage", urlPatterns = {"/indexPage", "/index", "/"})
public class IndexPage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession() == null || req.getSession().getAttribute("loggedInUserName") == null) {
            req.setAttribute("isUserLoggedIn", true);
        }
        req.setAttribute("articleSummaries", ArticleDAO.getAllArticleSummaries());
        req.getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
