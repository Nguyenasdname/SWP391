/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.payment;

import dao.BookingDao;
import dao.PaymentDao;
import dao.imp.BookingDaoImp;
import dao.imp.PaymentDaoImp;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Booking;
import model.Payment;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet("/confirmDeposit")
public class ConfirmDeposit extends HttpServlet {

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
            out.println("<title>Servlet ConfirmDeposit</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmDeposit at " + request.getContextPath() + "</h1>");
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
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        String bankNumber = request.getParameter("bankNumber");
        String depositCode = request.getParameter("depositCode");
        String bankBin = request.getParameter("bankBin");
        double depositAmount = Double.parseDouble(request.getParameter("depositAmount"));
        
        String paymentDescription = depositCode+"-"+bankNumber+"-"+bankBin;
        
        PaymentDao paymentDao = new PaymentDaoImp();
        
        BookingDao bookingDao = new BookingDaoImp();
        
        Booking booking = bookingDao.getBookingByID(bookingId);
        
        double price = booking.getBookingTotal();
        
        booking.setBookingTotal(price - depositAmount);
        booking.setBookingStatus("Confirmed");
        
        Payment payment = new Payment(1, user.getUserId(), bookingId, depositAmount, "Bank Transfer", "Completed", null, 0, paymentDescription);
        
        paymentDao.addPayment(payment);
        
        bookingDao.updateBooking(booking);
        
        response.sendRedirect("index.jsp?alertMessage=Booking successful! Please check your email or booking history.");
        
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
