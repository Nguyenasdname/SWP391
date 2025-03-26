package control.service;

import cloudinary.CloudinaryConfig;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import dao.imp.ServiceDaoImp;
import java.io.File;
import model.Service;
import java.io.IOException;
import java.io.InputStream;
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

@WebServlet(name = "AdminEditService", urlPatterns = {"/admin-edit-service"})
public class AdminEditService extends HttpServlet {

    private ServiceDaoImp serviceDaoImp;

    @Override
    public void init() throws ServletException {
        serviceDaoImp = new ServiceDaoImp();
    }

    /**
     * Handles the HTTP GET method. Fetches service data and forwards it to the
     * edit form.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the service ID from the request
        int serviceId = Integer.parseInt(request.getParameter("id"));

        // Fetch service details from the database
        Service service = serviceDaoImp.getServiceByID(serviceId);

        // Set the service object as an attribute to be used in the JSP
        request.setAttribute("service", service);

        // Forward to the editService.jsp page
        request.getRequestDispatcher("editService.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP POST method. Updates the service with new details.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get parameters from the form
        int serviceId = 0;
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
                    if (fileItem.getFieldName().equals("serviceId")) {
                        serviceName = fileItem.getString("UTF-8");
                    } else if (fileItem.getFieldName().equals("serviceName")) {
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
        } catch (FileUploadException ex) {
            Logger.getLogger(AdminEditService.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Create a Service object with the updated data
        Service Service = serviceDaoImp.getServiceByID(serviceId);

        if (Service == null) {
            request.setAttribute("error", "Service not fault");
            request.getRequestDispatcher("editService").forward(request, response);
        }

        try {

            // Update the service in the database
            serviceDaoImp.updateService(Service);

        } catch (Exception e) {
            request.setAttribute("error", e);
        }
        // Redirect to the service management page after updating
        response.sendRedirect("./admin-get-services");
    }

    @Override
    public String getServletInfo() {
        return "Servlet for editing services";
    }
}
