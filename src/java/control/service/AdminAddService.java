package control.service;

import cloudinary.CloudinaryConfig;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import dao.imp.ServiceDaoImp;
import java.io.File;
import model.Service;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "AdminAddService", urlPatterns = {"/createServiceAction"})
public class AdminAddService extends HttpServlet {

    private ServiceDaoImp serviceDaoImp;

    @Override
    public void init() throws ServletException {
        serviceDaoImp = new ServiceDaoImp();
    }

    /**
     * Handles the HTTP POST method for adding a new service.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get parameters from the form
        String serviceName = "";
        String serviceDescription = "";
        double servicePrice = 0;
        String serviceIMG = "";

        try {
            DiskFileItemFactory dfif = new DiskFileItemFactory();
            dfif.setRepository(new File("D:\\code\\SWP-main\\web\\Images"));

            ServletFileUpload fileUpload = new ServletFileUpload(dfif);

            List<FileItem> fileItems = fileUpload.parseRequest(request);
            System.out.println(fileItems);
            for (FileItem fileItem : fileItems) {
                if (fileItem.isFormField()) {
                    if (fileItem.getFieldName().equals("serviceName")) {
                        serviceName = fileItem.getString("UTF-8");
                    } else if (fileItem.getFieldName().equals("servicePrice")) {
                        servicePrice = Double.parseDouble(fileItem.getString("UTF-8"));
                    } else if (fileItem.getFieldName().equals("serviceDescription")) {
                        serviceDescription = fileItem.getString("UTF-8");
                    }
                } else {
                    if (fileItem.getFieldName().equals("image") && fileItem.getSize() > 0) {
                        String fileName = serviceIMG + "_service_img.png";

                        try (InputStream fileContent = fileItem.getInputStream()) {
                            byte[] fileBytes = fileContent.readAllBytes();

                            Cloudinary cloudinary = CloudinaryConfig.getInstance();

                            Map uploadResult = cloudinary.uploader().upload(fileBytes, ObjectUtils.asMap(
                                    "public_id", "user_images/" + fileName,
                                    "overwrite", true,
                                    "resource_type", "image"
                            ));
                            System.out.println(uploadResult);
                            serviceIMG = (String) uploadResult.get("secure_url");
                        }
                    }
                }
            }

        // Create a new service object
        Service newService = new Service(0, serviceDescription, serviceName, servicePrice, new Date(), serviceIMG);

        // Add the service to the database using ServiceDao
        serviceDaoImp.addService(newService);

        // Redirect to the service management page (where services are listed)
        response.sendRedirect("./admin-get-services");

    }
    catch (Exception ex

    
        ) {
            System.err.println(ex.getMessage());
    }
}

@Override
public String getServletInfo() {
        return "Servlet for adding new services";
    }

    public static void main(String[] args) {
        String currentDir = System.getProperty("user.dir");
        System.out.println("Current dir using System:" + currentDir);
    }
}
