package ictgradschool.project.util;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

public class FileUploadUtil {
    private static final int IMAGE_SIZE_THRESHOLD = 10 * 1024; //10MB
    private static final String TEMP_FOLDER_NAME = "/WEB-INF/temp";


    /**
     *
     * @param req from which image files are parsed.
     * @param targetDirectory to which folder images should be transferred.
     * @return uuid filename WITH extension, WITHOUT path.
     * @throws ServletException
     */
    public static String UploadImage(HttpServletRequest req, File targetDirectory) throws Exception {
        final List<String> acceptableMimeTypes = Arrays.asList("image/png", "image/jpeg");
        // Create the temporary folder that the file-upload mechanism needs.
        File tempFolder = new File(TEMP_FOLDER_NAME);
        if (!tempFolder.exists()) {
            tempFolder.mkdirs();
        }

        //configure specifications of image, claiming using "/temp" as temp repo for images
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //maximum acceptable image file size = 10 * 1024 bytes, that is, 10 Mb.
        factory.setSizeThreshold(IMAGE_SIZE_THRESHOLD);
        //take "/WEB-INF/temp" folder as register folder for uploading images
        factory.setRepository(tempFolder);

        //link disk repo to servlet upload action
        ServletFileUpload upload = new ServletFileUpload(factory);

        String uuidFilename = "";


            //parseRequest(): get uploaded files from http request
            for (FileItem fileItem : upload.parseRequest(req)) {
                if (!fileItem.isFormField() && acceptableMimeTypes.contains(fileItem.getContentType())) {
                    //write the file into /images folder
                    uuidFilename = UUID.randomUUID() + "." + FilenameUtils.getExtension(fileItem.getName());
                    fileItem.write(new File(targetDirectory, uuidFilename));
                }
            }

        return uuidFilename;
    }

    /**
     *
     * @param file file to delete.
     * @return true if successfully deleted, false otherwise.
     */
    public static boolean deleteImage(File file){
        return file.delete();
    }
}
