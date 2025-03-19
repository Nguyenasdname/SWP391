/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.booking;

import dao.PromotionDao;
import dao.ServiceDao;
import dao.VillaDao;
import dao.imp.PromotionDaoImp;
import dao.imp.ServiceDaoImp;
import dao.imp.VillaDaoImp;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Promotion;
import model.Service;
import model.Villa;

/**
 *
 * @author Admin
 */
@WebServlet("/booking")
public class Booking extends HttpServlet {

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
            out.println("<title>Servlet Booking</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Booking at " + request.getContextPath() + "</h1>");
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

        try {
            //lấy thông tin
            String villaId = request.getParameter("villaId");
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");
            String numberOfGuest = request.getParameter("numberOfGuest");

            //lấy ra cái villa đang đc booking
            VillaDao villaDao = new VillaDaoImp();

            Villa check = villaDao.getAvailableVilla(Integer.parseInt(villaId), fromDate, toDate);

            Villa villa = villaDao.getVillaByID(Integer.parseInt(villaId));

            if (check != null) {
                //tính ngày để tính giá tiền
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date checkInDate = sdf.parse(fromDate);
                Date checkOutDate = sdf.parse(toDate);

                long diff = checkOutDate.getTime() - checkInDate.getTime();
                int numOfNights = (int) (diff / (1000 * 60 * 60 * 24));

                double basePrice = villa.getVillaPrice() * numOfNights; //giá tiền

                //lấy hết service ra tí check để mà thêm vào
                ServiceDao serviceDao = new ServiceDaoImp();
                ArrayList<Service> listService = serviceDao.getAllServiceList();

                //lấy hết promotion ra để tính tiền 
                PromotionDao promotionDao = new PromotionDaoImp();
                ArrayList<Promotion> listPromotion = promotionDao.getAllPromotionList();

                request.setAttribute("villa", villa);
                request.setAttribute("fromDate", fromDate);
                request.setAttribute("toDate", toDate);
                request.setAttribute("numberOfGuest", numberOfGuest);
                request.setAttribute("numOfNights", numOfNights);
                request.setAttribute("basePrice", basePrice);
                request.setAttribute("listService", listService);
                request.setAttribute("listPromotion", listPromotion);

                request.getRequestDispatcher("booking.jsp").forward(request, response);
            } else {
                String referer = "villaAvailable?action=listAll";
                response.sendRedirect("check.jsp?action=noAvailableVilla&referer="+referer);
            }

        } catch (Exception e) {
            e.printStackTrace();
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
