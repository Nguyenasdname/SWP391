/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.booking;

import dao.BookingDao;
import dao.ContactDao;
import dao.VillaDao;
import dao.imp.BookingDaoImp;
import dao.imp.ContactDaoImp;
import dao.imp.VillaDaoImp;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Contact;
import model.User;

/**
 *
 * @author Admin    
 */
@WebServlet("/cancelBooking")
public class CancelBooking extends HttpServlet {

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
            out.println("<title>Servlet CancelBooking</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CancelBooking at " + request.getContextPath() + "</h1>");
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

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        int bookingId = Integer.parseInt(request.getParameter("bookingId"));

        BookingDao bookingDao = new BookingDaoImp();

        VillaDao villaDao = new VillaDaoImp();

        ContactDao contactDao = new ContactDaoImp();

        Contact contact = new Contact();

        String contactTitle = "Cancel_Booking_User_"+ user.getUserId()+ "_" + user.getUserName() + "_BookingID_" + bookingId;

        String reasonCancel = request.getParameter("reason");
        String action = request.getParameter("action");

        contact.setUserId(user.getUserId());

        contact.setContactContent(reasonCancel);

        switch (action) {
            case "refund":
                contactTitle += "_Refund";
                contact.setContactTitle(contactTitle);
                contact.setRefundStatus("NotRefunded");
                
                contactDao.addContact(contact);
                
                bookingDao.setBookingStatusCancel(bookingId);

                villaDao.setAvailableVilla(bookingDao.getBookingByID(bookingId).getVillaId());

                response.sendRedirect("bookingHistory?alertMessage=Cancel Successfuly!");
                break;
            case "lose all":
                contactTitle += "_LoseAll";
                contact.setContactTitle(contactTitle);
                contactDao.addContact(contact);

                bookingDao.setBookingStatusCancel(bookingId);

                villaDao.setAvailableVilla(bookingDao.getBookingByID(bookingId).getVillaId());

                response.sendRedirect("bookingHistory?alertMessage=Cancel Successfuly!");
                break;
            default:
                break;
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
