package ictgradschool.project.servlet.action;

import ictgradschool.project.DAO.UserDAO;
import ictgradschool.project.model.UserProfile;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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
        int id = Integer.parseInt(req.getParameter("id"));
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
                id,
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

        UserDAO.saveProfile(userProfile);

        resp.sendRedirect("/articles?id=" + id);
    }
}
