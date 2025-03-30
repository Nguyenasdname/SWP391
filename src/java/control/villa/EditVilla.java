/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.villa;

import cloudinary.CloudinaryConfig;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import dao.VillaDao;
import dao.imp.VillaDaoImp;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Villa;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Admin
 */
@WebServlet("/editVilla")
public class EditVilla extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditVilla</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditVilla at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int villaId = Integer.parseInt(request.getParameter("villaId"));

        VillaDao villaDao = new VillaDaoImp();

        request.setAttribute("villa", villaDao.getVillaByID(villaId));
        request.getRequestDispatcher("editVilla.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int villaId = Integer.parseInt(request.getParameter("villaId"));
        
        VillaDao villaDao = new VillaDaoImp();
        
        Villa villa = villaDao.getVillaByID(villaId);
        
        String villaName = villa.getVillaName();
        double villaPrice = villa.getVillaPrice();
        String villaLocation = villa.getVillaLocation();
        int villaCapacity = villa.getVillaCapacity();
        String villaIMG = villa.getVillaIMG();
        String villaDescription = villa.getVillaDescription();

       

        try {
            DiskFileItemFactory dfif = new DiskFileItemFactory();
            dfif.setRepository(new File("D:\\code\\SWP-main\\web\\Images"));

            ServletFileUpload fileUpload = new ServletFileUpload(dfif);

            List<FileItem> fileItems = fileUpload.parseRequest(request);
            System.out.println(fileItems);
            for (FileItem fileItem : fileItems) {
                if (fileItem.isFormField()) {
                    if (fileItem.getFieldName().equals("villaName")) {
                        villaName = fileItem.getString("UTF-8");
                    } else if (fileItem.getFieldName().equals("villaPrice")) {
                        villaPrice = Double.parseDouble(fileItem.getString("UTF-8"));
                    } else if (fileItem.getFieldName().equals("villaLocation")) {
                        villaLocation = fileItem.getString("UTF-8");
                    } else if (fileItem.getFieldName().equals("villaDescription")) {
                        villaDescription = fileItem.getString("UTF-8");
                    } else if (fileItem.getFieldName().equals("villaCapacity")) {
                        villaCapacity = Integer.parseInt(fileItem.getString("UTF-8"));
                    }
                } else {

                    if (fileItem.getFieldName().equals("image") && fileItem.getSize() > 0) {
                        String fileName = villaName + "_villa_img.png";

                        try (InputStream fileContent = fileItem.getInputStream()) {
                            byte[] fileBytes = fileContent.readAllBytes();

                            Cloudinary cloudinary = CloudinaryConfig.getInstance();

                            Map uploadResult = cloudinary.uploader().upload(fileBytes, ObjectUtils.asMap(
                                    "public_id", "user_images/" + fileName,
                                    "overwrite", true,
                                    "resource_type", "image"
                            ));
                            villaIMG = (String) uploadResult.get("secure_url");
                        }

                    }
                }
            }
            
            villa.setVillaName(villaName);
            villa.setVillaCapacity(villaCapacity);
            villa.setVillaPrice(villaPrice);
            villa.setVillaDescription(villaDescription);
            villa.setVillaIMG(villaIMG);
            villa.setVillaLocation(villaLocation);
            
            villaDao.updateVilla(villa);
            
            response.sendRedirect("listVilla");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("File Upload Fail!" + e.getMessage());
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
