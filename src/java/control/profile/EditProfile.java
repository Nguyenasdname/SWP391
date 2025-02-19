/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.profile;

import cloudinary.CloudinaryConfig;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import dao.UserDao;
import dao.imp.UserDaoImp;
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
import javax.servlet.http.HttpSession;
import model.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Admin
 */
@WebServlet("/editProfile")
public class EditProfile extends HttpServlet {

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
            out.println("<title>Servlet EditProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProfile at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        String userFirstName = user.getUserFirstName();
        String userLastName = user.getUserLastName();
        String userAddress = user.getUserAddress();
        String userPhone = user.getUserPhone();

        UserDao userDao = new UserDaoImp();

        String imgUrl = user.getUserIMG();
        try {
            DiskFileItemFactory dfif = new DiskFileItemFactory();
            dfif.setRepository(new File("D:\\code\\SWP-main\\web\\Images"));

            ServletFileUpload fileUpload = new ServletFileUpload(dfif);

            List<FileItem> fileItems = fileUpload.parseRequest(request);
            for (FileItem fileItem : fileItems) {
                if (fileItem.isFormField()) {
                    if (fileItem.getFieldName().equals("userFirstName")) {
                        userFirstName = fileItem.getString("UTF-8");
                    } else if (fileItem.getFieldName().equals("userLastName")) {
                        userLastName = fileItem.getString("UTF-8");
                    } else if (fileItem.getFieldName().equals("userAddress")) {
                        userAddress = fileItem.getString("UTF-8");
                    } else if (fileItem.getFieldName().equals("userPhone")) {
                        userPhone = fileItem.getString("UTF-8");
                    }
                } else {

                    if (fileItem.getFieldName().equals("image") && fileItem.getSize() > 0) {
                        String fileName = user.getUserName() + "_profile_img.png";

                        try (InputStream fileContent = fileItem.getInputStream()) {
                            byte[] fileBytes = fileContent.readAllBytes(); // Đọc toàn bộ dữ liệu ảnh

                            Cloudinary cloudinary = CloudinaryConfig.getInstance();

                            Map uploadResult = cloudinary.uploader().upload(fileBytes, ObjectUtils.asMap(
                                    "public_id", "user_images/" + fileName,
                                    "overwrite", true,
                                    "resource_type", "image"
                            ));
                            imgUrl = (String) uploadResult.get("secure_url");
                        }

                    }
                }
            }
            user.setUserFirstName(userFirstName);
            user.setUserLastName(userLastName);
            user.setUserAddress(userAddress);
            user.setUserPhone(userPhone);
            user.setUserIMG(imgUrl);

            userDao.updateUser(user);
            
            session.removeAttribute("user");
            session.setAttribute("user", user);

            response.sendRedirect("profile.jsp");

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
