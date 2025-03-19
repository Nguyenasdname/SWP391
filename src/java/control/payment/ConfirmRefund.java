/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.payment;

import dao.ContactDao;
import dao.PaymentDao;
import dao.imp.ContactDaoImp;
import dao.imp.PaymentDaoImp;
import emailService.JavaMail;
import emailService.JavaMailImp;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import model.Payment;

/**
 *
 * @author Admin
 */
@WebServlet("/confirmRefund")
public class ConfirmRefund extends HttpServlet {

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
            out.println("<title>Servlet ConfirmRefund</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmRefund at " + request.getContextPath() + "</h1>");
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

        String bankNumber = request.getParameter("bankNumber");
        String refundCode = request.getParameter("refundCode");
        String bankBin = request.getParameter("bankBin");
        double refundAmount = Double.parseDouble(request.getParameter("refundAmount"));
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        int contactId = Integer.parseInt(request.getParameter("contactId"));

        ContactDao contactDao = new ContactDaoImp();

        String refundDescription = refundCode + "-" + bankNumber + "-" + bankBin;

        PaymentDao paymentDao = new PaymentDaoImp();

        Payment payment = new Payment(1, user.getUserId(), bookingId, refundAmount, "Bank Transfer", "Completed", null, 0, refundDescription);

        paymentDao.addPayment(payment);

        String titleRefundMail = request.getParameter("title");

        String userContact = "Request refund 70% of deposit!";

        String userEmail = request.getParameter("userEmail");

        String contentRefund = "We have successfully processed your booking cancellation refund. Please check your bank account or transaction history.";
        contactDao.setSeenContactByID(contactId);
        contactDao.setRefundedContactByID(contactId);

        new Thread(() -> {
            JavaMail jvm = new JavaMailImp();
            boolean sendEmail = jvm.sendReplyContact(titleRefundMail, contentRefund, userEmail, userContact);
            if (!sendEmail) {
                System.out.println("Failed to send confirmation email for booking ID: " + bookingId);
            }
        }).start();
        
        response.sendRedirect("contactDetails?contactId=" + contactId);

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
