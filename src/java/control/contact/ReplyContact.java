/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.contact;

import dao.ContactDao;
import dao.UserDao;
import dao.imp.ContactDaoImp;
import dao.imp.UserDaoImp;
import emailService.JavaMail;
import emailService.JavaMailImp;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Contact;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet("/replyContact")
public class ReplyContact extends HttpServlet {

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
            out.println("<title>Servlet ReplyContact</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReplyContact at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        
        int contactId = Integer.parseInt(request.getParameter("contactId"));
        
        String subtitle = request.getParameter("subtitle");
        
        String replyContent = request.getParameter("replyContent");
        
        ContactDao contactDao = new ContactDaoImp();
        
        UserDao userDao = new UserDaoImp();
        
        JavaMail jvm = new JavaMailImp();
        
        Contact contact = contactDao.getContactByID(contactId);
        
        String userEmail = userDao.getUserByID(contact.getUserId()).getUserEmail();
        
        contactDao.setSeenContactByID(contactId);
        boolean sendEmail = jvm.sendReplyContact(subtitle, replyContent, userEmail, contact.getContactContent());
        
        if(sendEmail){
            response.sendRedirect("contactDetails?contactId="+contactId);
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
