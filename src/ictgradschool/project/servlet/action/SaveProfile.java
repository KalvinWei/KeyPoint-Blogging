package ictgradschool.project.servlet.action;

import ictgradschool.project.DAO.UserDAO;
import ictgradschool.project.model.UserProfile;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "SaveProfile", urlPatterns = {"/saveProfile"})
public class SaveProfile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); // do not support
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String nickname = req.getParameter("nickname");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String signature = req.getParameter("signature");
        String description = req.getParameter("description");
        String avatar = req.getParameter("avatar");
        String dateOfBirthString = req.getParameter("dateOfBirth");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-mm-dd");
        Date dateOfBirth = null;
        try {
            dateOfBirth = simpleDateFormat.parse(dateOfBirthString);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        UserProfile userProfile = new UserProfile(
                null,
                userName,
                nickname,
                firstName,
                lastName,
                dateOfBirth,
                email,
                signature,
                description,
                avatar
        );

        try {
            UserDAO.saveProfile(userProfile);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        resp.sendRedirect("./articlesPage?userName=" + userName);
    }
}
