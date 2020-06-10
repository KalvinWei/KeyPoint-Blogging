package ictgradschool.project.util;

import ictgradschool.project.DAO.UserDAO;
import ictgradschool.project.model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.sql.SQLException;
import java.util.Random;

public class AuthenticationUtil {

    public static User createUser(String userName, String password) {
        Random random = new Random();
        int iteration = Math.abs(random.nextInt() % 100_000) + 1;
        int salt_length = Math.abs(random.nextInt() % 100) + 1;
        byte[] salt = PasswordUtil.getNextSalt(salt_length);
        byte[] passwordHash = PasswordUtil.hash(password.toCharArray(), salt, iteration);
        return new User(
                null,
                userName,
                PasswordUtil.base64Encode(passwordHash),
                PasswordUtil.base64Encode(salt),
                iteration
        );
    }

    public static boolean authenticate(User user, String password) {
        if (user == null)
            return false;

        return PasswordUtil.isExpectedPassword(
                password.toCharArray(),
                PasswordUtil.base64Decode(user.getSalt()),
                user.getIteration(),
                PasswordUtil.base64Decode(user.getPasswordHash())
        );
    }
}
