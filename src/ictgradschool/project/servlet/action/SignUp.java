package ictgradschool.project.servlet.action;

import ictgradschool.project.DAO.UserDAO;
import ictgradschool.project.model.User;
import ictgradschool.project.util.AuthenticationUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "SignUp", urlPatterns = {"/signUp"})
public class SignUp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); // do not support
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String nickname = req.getParameter("nickname");
        String password = req.getParameter("password");
        User user = AuthenticationUtil.createUser(userName, password);
        user.setNickname(nickname == null || nickname.isEmpty() ? userName : nickname);
        try {
            if (UserDAO.getUserFromUserName(userName) != null) {
                req.getRequestDispatcher("/signInPage");
            } else {
                UserDAO.insertUser(user);
                req.getRequestDispatcher("/signInPage");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
