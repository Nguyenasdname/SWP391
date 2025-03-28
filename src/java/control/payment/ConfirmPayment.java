/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.payment;

import dao.BookingDao;
import dao.BookingServiceDao;
import dao.PaymentDao;
import dao.imp.BookingDaoImp;
import dao.imp.BookingServiceDaoImp;
import dao.imp.PaymentDaoImp;
import emailService.JavaMail;
import emailService.JavaMailImp;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Booking;
import model.BookingService;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet("/confirmPayment")
public class ConfirmPayment extends HttpServlet {

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
            out.println("<title>Servlet ConfirmPayment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmPayment at " + request.getContextPath() + "</h1>");
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
        String paymentCode = request.getParameter("paymentCode");
        String bankBin = request.getParameter("bankBin");
        double paymentAmount = Double.parseDouble(request.getParameter("paymentAmount"));
        int promotionId = Integer.parseInt(request.getParameter("promotionId"));

        String paymentDescription = paymentCode + "-" + bankNumber + "-" + bankBin;

        PaymentDao paymentDao = new PaymentDaoImp();

        BookingDao bookingDao = new BookingDaoImp();

        Booking booking = bookingDao.getBookingByID(bookingId);

        booking.setBookingStatus("Completed");

        model.Payment payment = new model.Payment(1, user.getUserId(), bookingId, paymentAmount, "Bank Transfer", "Completed", null, promotionId, paymentDescription);

        paymentDao.addPayment(payment);

        bookingDao.updateBooking(booking);

        BookingServiceDao bookingServiceDao = new BookingServiceDaoImp();
        Booking bookingMail = bookingDao.getBookingDetailByID(bookingId);
        ArrayList<BookingService> bookingServiceList = bookingServiceDao.getListBookingServiceDetailsByBookingId(bookingId);

        new Thread(() -> {
            JavaMail jvm = new JavaMailImp();
            boolean sendEmail = jvm.sendPaymentConfirmation(bookingMail, user, bookingServiceList);
            if (!sendEmail) {
                System.out.println("Failed to send confirmation email for booking ID: " + bookingId);
            }
        }).start();

        request.setAttribute("villaId", booking.getVillaId());

        request.getRequestDispatcher("feedback.jsp").forward(request, response);
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
