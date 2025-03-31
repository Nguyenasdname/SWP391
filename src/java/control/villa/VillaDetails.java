/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.villa;

import dao.BookingDao;
import dao.FeedbackDao;
import dao.VillaDao;
import dao.WishlistDao;
import dao.imp.BookingDaoImp;
import dao.imp.FeedbackDaoImp;
import dao.imp.VillaDaoImp;
import dao.imp.WishlistDaoImp;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Feedback;
import model.User;
import model.Villa;
import model.Wishlist;

/**
 *
 * @author Admin
 */
@WebServlet("/villaDetails")
public class VillaDetails extends HttpServlet {

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
            out.println("<title>Servlet VillaDetails</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VillaDetails at " + request.getContextPath() + "</h1>");
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
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        String numberOfGuest = request.getParameter("numberOfGuest");
        String originalURL = request.getHeader("Referer");
        
        if(originalURL.contains("villaDetails?")){
            originalURL = "villaAvailable?action=listAll";
        }
        
        VillaDao villaDao = new VillaDaoImp();
        
        Villa villa = villaDao.getVillaByID(villaId);
        
        FeedbackDao feedbackDao = new FeedbackDaoImp();
        
        ArrayList<Feedback> feedbackList = feedbackDao.getAllFeedBackListByVillaID(villaId);
        
        WishlistDao wishlistDao = new WishlistDaoImp();
        
        ArrayList<Wishlist> wishlist = wishlistDao.getWishlistByVillaID(villaId);
        
        double averageRating = 0;
        int totalStart = 0;
        
        for(Feedback feedback : feedbackList){
            totalStart += feedback.getRating();
        }
        averageRating = (double) totalStart / feedbackList.size();
        averageRating = Math.round(averageRating * 10.0) / 10.0;

        
        request.setAttribute("villa", villa);
        request.setAttribute("feedbackList", feedbackList);
        request.setAttribute("fromDate", fromDate);
        request.setAttribute("toDate", toDate);
        request.setAttribute("averageRating", averageRating);
        request.setAttribute("numberOfGuest", numberOfGuest);
        request.setAttribute("reviews", feedbackList.size());
        request.setAttribute("originalURL", originalURL);
        request.setAttribute("wishlist", wishlist);
        
        request.getRequestDispatcher("villaDetails.jsp").forward(request, response);
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
