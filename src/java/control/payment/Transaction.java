/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.payment;

import dao.PaymentDao;
import dao.imp.PaymentDaoImp;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet("/transaction")
public class Transaction extends HttpServlet {

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
            out.println("<title>Servlet Transaction</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Transaction at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        PaymentDao paymentDao = new PaymentDaoImp();

        ArrayList<Payment> paymentList = paymentDao.getListPaymentByUserId(user.getUserId());

        for (Payment payment : paymentList) {
            String temp[] = payment.getPaymentDescription().split("-");

            int firstWordLength = 0;
            if (temp[0].contains("PAYMENT")) {
                firstWordLength = 7;
            } else if (temp[0].contains("DEPOSIT")) {
                firstWordLength = 7;
            } else if (temp[0].contains("REFUND")) {
                firstWordLength = 6;
            }
            
            String firstWord = temp[0].substring(0, firstWordLength).toLowerCase();
            firstWord = firstWord.substring(0, 1).toUpperCase() + firstWord.substring(1);
            
            payment.setPaymentType(firstWord);
            payment.setPaymentDescription(temp[0]);
        }

        request.setAttribute("paymentList", paymentList);
        request.getRequestDispatcher("transaction.jsp").forward(request, response);
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
