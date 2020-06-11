package ictgradschool.project.servlet.action;

import ictgradschool.project.DAO.CommentDAO;
import ictgradschool.project.model.Comment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(name = "PostComment", urlPatterns = {"/postComment"})
public class PostComment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); // do not support
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String content = req.getParameter("content");
        int parent = Integer.parseInt(req.getParameter("parent"));
        int user = Integer.parseInt(req.getParameter("user"));
        int article = Integer.parseInt(req.getParameter("article"));
        Timestamp time = new Timestamp(System.currentTimeMillis());
        Comment comment = new Comment(null, content, time, user, article, parent);

        CommentDAO.insertComment(comment);

        resp.sendRedirect("/articlePage?id=" + article);
    }
}
