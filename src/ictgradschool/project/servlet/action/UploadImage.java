package ictgradschool.project.servlet.action;

import ictgradschool.project.util.JSONResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "uploadImage", urlPatterns = {"/uploadImage"} )
public class UploadImage extends HttpServlet {
    private File avatarRepo;
    private File coverRepo;
    private File tempFolder;
    private String uuidFilename;
    private final List<String> acceptableMimeTypes = Arrays.asList("image/png", "image/jpeg","image/jpg");

    @Override
    public void init() throws ServletException {
        super.init();

        // Get the upload folder, ensure it exists.
        this.avatarRepo = new File(getServletContext().getRealPath("./images/avatar"));
        this.coverRepo =  new File(getServletContext().getRealPath("./images/cover"));

        // Create the temporary folder that the file-upload mechanism needs.
        this.tempFolder = new File(getServletContext().getRealPath("/WEB-INF/temp"));
        if (!tempFolder.exists()) {
            tempFolder.mkdirs();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String usage = req.getParameter("usage");

        //configure specifications of image, claiming using "/temp" as temp repo for images
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //maximum acceptable image file size = 10 * 1024 bytes, that is, 10 Mb.
        factory.setSizeThreshold(10 * 1024);
        //take "/WEB-INF/temp" folder as register folder for uploading images
        factory.setRepository(tempFolder);

        //link disk repo to servlet upload action
        ServletFileUpload upload = new ServletFileUpload(factory);

        try {
            //parseRequest(): get uploaded files from http request
            for (FileItem fileItem : upload.parseRequest(req)) {
                if (!fileItem.isFormField() && acceptableMimeTypes.contains(fileItem.getContentType())) {
                    //write the file into /images folder
                    uuidFilename = UUID.randomUUID() + "." + FilenameUtils.getExtension(fileItem.getName());
                    if(usage.equals("avatar"))
                        fileItem.write(new File(avatarRepo, uuidFilename));
                    if(usage.equals("cover"))
                        fileItem.write(new File(coverRepo, uuidFilename));
                }
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }

        class TempObj{
             String uuidFilename;
             TempObj(String uuidFilename) {
                 this.uuidFilename = uuidFilename;
             }
        }

        JSONResponse.send(resp,new TempObj(uuidFilename));

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
