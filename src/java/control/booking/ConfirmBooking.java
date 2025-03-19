/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.booking;

import dao.BookingDao;
import dao.BookingServiceDao;
import dao.ServiceDao;
import dao.VillaDao;
import dao.imp.BookingDaoImp;
import dao.imp.BookingServiceDaoImp;
import dao.imp.ServiceDaoImp;
import dao.imp.VillaDaoImp;
import emailService.JavaMail;
import emailService.JavaMailImp;
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
import javax.servlet.http.HttpSession;
import model.User;
import model.Booking;
import model.BookingService;
import model.Service;

/**
 *
 * @author Admin
 */
@WebServlet("/confirmBooking")
public class ConfirmBooking extends HttpServlet {

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
            out.println("<title>Servlet ConfirmBooking</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmBooking at " + request.getContextPath() + "</h1>");
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

        BookingServiceDao bookingServiceDao = new BookingServiceDaoImp();
        BookingDao bookingDao = new BookingDaoImp();
        ServiceDao serviceDao = new ServiceDaoImp();

        try {

            int villaId = Integer.parseInt(request.getParameter("villaId"));

            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");

            Date fromDate = inputFormat.parse(request.getParameter("fromDate"));
            Date toDate = inputFormat.parse(request.getParameter("toDate"));

            double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));

            int numberOfGuest = Integer.parseInt(request.getParameter("numberOfGuest"));

            String[] selectedServices = request.getParameterValues("selectedServices");

            VillaDao villaDao = new VillaDaoImp();

            Booking newbooking = new Booking(1, user.getUserId(), villaId, fromDate, toDate, "Pending", null, totalPrice, numberOfGuest);

            boolean bookingCheck = bookingDao.addBooking(newbooking);

            ArrayList<BookingService> bookingServiceList = new ArrayList();

            if (bookingCheck) {
                Booking booking = bookingDao.getUserBookingVilla(newbooking.getUserId(), newbooking.getVillaId(), newbooking.getBookingStatus());
                booking.setVillaName(bookingDao.getVillaNameByBookingId(booking.getBookingId()));
                if (selectedServices != null) {
                    for (String serviceData : selectedServices) {
                        String[] parts = serviceData.split("-");
                        int serviceId = Integer.parseInt(parts[0]);
                        int quantity = Integer.parseInt(parts[1]);
                        Service s = serviceDao.getServiceByID(serviceId);

                        double totalServicePrice = s.getServicePrice() * quantity;
                        BookingService bookingService = new BookingService(booking.getBookingId(), serviceId, quantity, totalServicePrice);
                        bookingServiceDao.addBookingService(bookingService);
                    }
                } 
                villaDao.setBookedVilla(villaId);
                bookingServiceList = bookingServiceDao.getListBookingServiceDetailsByBookingId(booking.getBookingId());
                request.setAttribute("booking", booking);
                request.setAttribute("bookingServiceList", bookingServiceList);
                request.getRequestDispatcher("deposit.jsp").forward(request, response);

            } else {
                response.getWriter().print("Đéo được bro ơi");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
