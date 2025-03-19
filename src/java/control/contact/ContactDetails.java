/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.contact;

import dao.ContactDao;
import dao.PaymentDao;
import dao.imp.ContactDaoImp;
import dao.imp.PaymentDaoImp;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Contact;
import model.Payment;

/**
 *
 * @author Admin
 */
@WebServlet("/contactDetails")
public class ContactDetails extends HttpServlet {

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
            out.println("<title>Servlet ContactDetails</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ContactDetails at " + request.getContextPath() + "</h1>");
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
        int contactId = Integer.parseInt(request.getParameter("contactId"));

        ContactDao contactDao = new ContactDaoImp();
        Contact contact = contactDao.getDetailsContactByContactID(contactId);
        String refundStatus = contact.getRefundStatus() != null ? contact.getRefundStatus() : null;
        String description;

        if (refundStatus != null && refundStatus.equals("NotRefunded")) {
            PaymentDao paymentDao = new PaymentDaoImp();

            String parts[] = contact.getContactTitle().split("_");

            int userContactId = 0;
            int bookingContactId = 0;
            for (int i = 0; i < parts.length; i++) {
                if (parts[i].equals("User")) {
                    userContactId = Integer.parseInt(parts[i + 1]);
                }
                if (parts[i].equals("BookingID")) {
                    bookingContactId = Integer.parseInt(parts[i + 1]);
                }
            }
            String paymentDescriptionCheck = "DEPOSITBOOKING" + bookingContactId + "USER" + userContactId;

            Payment payment = paymentDao.getPaymentByPaymentDesc(paymentDescriptionCheck);

            if (payment != null) {
                String partsPayment[] = payment.getPaymentDescription().split("-");

                String userAccountNo = partsPayment[1];
                String userBankId = partsPayment[2];
                
                description = "REFUNDCANCELBOOKING"+bookingContactId+"USER"+userContactId;
                

                int amountRefund = (int) Math.round(payment.getPaymentAmount() * 0.7);

                String qrRefund = "https://img.vietqr.io/image/" + userBankId + "-" + userAccountNo + "-compact.png?amount=" + amountRefund + "&addInfo="+ description;

                contact.setQrRefund(qrRefund);
                
                request.setAttribute("description", description);
                request.setAttribute("amountRefund", amountRefund);
            }
            
            request.setAttribute("bookingContactId", bookingContactId);
            request.setAttribute("contact", contact);
            request.getRequestDispatcher("contactDetails.jsp").forward(request, response);
            
            
        } else {
            request.setAttribute("contact", contact);
            request.getRequestDispatcher("contactDetails.jsp").forward(request, response);
        }

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
        processRequest(request, response);
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
