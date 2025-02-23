/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.service;

import dao.BookingDao;
import dao.BookingServiceDao;
import dao.ServiceDao;
import dao.imp.BookingDaoImp;
import dao.imp.BookingServiceDaoImp;
import dao.imp.ServiceDaoImp;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Booking;
import model.BookingService;
import model.Service;

/**
 *
 * @author Admin
 */
@WebServlet("/confirmAddMoreService")
public class ConfirmAddMoreService extends HttpServlet {

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
            out.println("<title>Servlet ConfirmAddMoreService</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmAddMoreService at " + request.getContextPath() + "</h1>");
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
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));

        double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));

        String[] selectedServices = request.getParameterValues("selectedServices");

        BookingDao bookingDao = new BookingDaoImp();

        Booking booking = bookingDao.getBookingByID(bookingId);

        ServiceDao serviceDao = new ServiceDaoImp();

        BookingServiceDao bookingServiceDao = new BookingServiceDaoImp();

        if (selectedServices != null) {
            booking.setBookingTotal(totalPrice);
            bookingDao.updateBooking(booking);

            for (String serviceData : selectedServices) {
                String[] parts = serviceData.split("-");
                int serviceId = Integer.parseInt(parts[0]);
                int quantity = Integer.parseInt(parts[1]);
                Service s = serviceDao.getServiceByID(serviceId);

                double totalServicePrice = s.getServicePrice() * quantity;
                BookingService bookingService = new BookingService(booking.getBookingId(), serviceId, quantity, totalServicePrice);

                BookingService bsCheck = bookingServiceDao.getBookingServiceByID(bookingService.getBookingId(), bookingService.getServiceId());
                if (bsCheck != null) {
                    BookingService updateBookingService = new BookingService(bookingService.getBookingId(), bookingService.getServiceId(), bookingService.getQuantity() + bsCheck.getQuantity(), bookingService.getTotalPrice() + bsCheck.getTotalPrice());
                    bookingServiceDao.updateBookingService(updateBookingService);
                } else {
                    bookingServiceDao.addBookingService(bookingService);
                }
            }

            String alertMessage = "Add More Service Successfuly! Please Check Your Booking Details";
            response.sendRedirect("bookingDetails?bookingId="+bookingId +"&alertMessage=" + alertMessage);
        } else {
            response.sendRedirect("bookingDetails?bookingId="+bookingId);
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
