package ictgradschool.project.servlet.action;

import ictgradschool.project.DAO.UserDAO;
import ictgradschool.project.model.Article;
import ictgradschool.project.model.UserProfile;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@MultipartConfig
@WebServlet(name = "SaveProfile", urlPatterns = {"/saveProfile"})
public class SaveProfile extends HttpServlet {
    private File uploadsFolder;
    private File tempFolder;
    private final String imagesRelativePath = "/images/avatar";
    private final List<String> acceptableMimeTypes = Arrays.asList("image/png", "image/jpeg");

    @Override
    public void init() throws ServletException {
        super.init();

        this.uploadsFolder = new File(getServletContext().getRealPath(imagesRelativePath));
        if (!uploadsFolder.exists()) {
            uploadsFolder.mkdirs();
        }

        this.tempFolder = new File(getServletContext().getRealPath("/WEB-INF/temp"));
        if (!tempFolder.exists()) {
            tempFolder.mkdirs();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); // do not support
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(4 * 1024);
        factory.setRepository(tempFolder);
        ServletFileUpload upload = new ServletFileUpload(factory);

        UserProfile userProfile = new UserProfile();
        String userName = "";

        try {
            List<FileItem> fileItems = upload.parseRequest(req);
            File file;

            for (FileItem item : fileItems) {
                if (item.isFormField()) {
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString();
                    if (fieldName.equals("userName")) {
                        userName = fieldValue;
                    }
                    userProfile.setField(fieldName, fieldValue);
                } else if (!item.isFormField() && acceptableMimeTypes.contains(item.getContentType())) {
                    String fileName = UUID.randomUUID() + "." + FilenameUtils.getExtension(item.getName());
                    file = new File(uploadsFolder, fileName);
                    item.write(file);
                    userProfile.setField("avatar", fileName);
                }
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
        try {
            UserDAO.saveProfile(userProfile);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        resp.sendRedirect("./articlesPage?userName=" + userName);
    }
}
