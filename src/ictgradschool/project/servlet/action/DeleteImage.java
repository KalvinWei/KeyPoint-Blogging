package ictgradschool.project.servlet.action;

import ictgradschool.project.util.JSONResponse;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@WebServlet(name = "deleteImage", urlPatterns = {"/deleteImage"})
public class DeleteImage extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String usage = req.getParameter("usage");
        String filename = req.getParameter("filename");
        File avatarFile = new File(getServletContext().getRealPath("./images/avatar"),filename);
        File coverFile =  new File(getServletContext().getRealPath("./images/cover"),filename);

        if(usage.equals("avatar") && filename.contains("default")) avatarFile.delete();
        else if(usage.equals("cover") && filename.contains("default")) coverFile.delete();

        JSONResponse.send(resp,new Object(){
            private boolean status = true;
        });
    }
}
