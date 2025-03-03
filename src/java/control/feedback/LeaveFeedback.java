/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.feedback;

import dao.BookingDao;
import dao.FeedbackDao;
import dao.imp.BookingDaoImp;
import dao.imp.FeedbackDaoImp;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Booking;
import model.Feedback;

/**
 *
 * @author Admin
 */
@WebServlet("/leaveFeedback")
public class LeaveFeedback extends HttpServlet {

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
            out.println("<title>Servlet LeaveFeedback</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LeaveFeedback at " + request.getContextPath() + "</h1>");
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
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        int villaId = Integer.parseInt(request.getParameter("villaId"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        int rating = Integer.parseInt(request.getParameter("rating"));

        String comment = request.getParameter("comment");
        String action = request.getParameter("action");
        FeedbackDao feedbackDao = new FeedbackDaoImp();
        BookingDao bookingDao = new BookingDaoImp();
        Feedback feedback;

        String referer = request.getHeader("referer");

        switch (action) {
            case "feedbackInVilla":

                Booking booking = bookingDao.getUserBookingVilla(userId, villaId, "Completed");

                if (booking != null) {

                    feedback = new Feedback(1, userId, villaId, rating, comment, null);

                    feedbackDao.addFeedback(feedback);

                    response.sendRedirect(referer);
                } else {
                    response.sendRedirect("check.jsp?action=feedbackHandle&referer=" + referer);
                }
                break;
            case "feedbackAfterPayment":
                feedback = new Feedback(1, userId, villaId, rating, comment, null);

                feedbackDao.addFeedback(feedback);

                response.sendRedirect("index.jsp");
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
