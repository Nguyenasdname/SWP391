/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.service;

import dao.imp.ServiceDaoImp;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Service;

/**
 *
 * @author ACER
 */
@WebServlet(name = "GetServiceInfo", urlPatterns = {"/get-service"})
public class GetServiceInfo extends HttpServlet {

    private ServiceDaoImp serviceDaoImp;

    @Override
    public void init() throws ServletException {

        serviceDaoImp = new ServiceDaoImp();
    }

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
            out.println("<title>Servlet GetServiceInfo</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetServiceInfo at " + request.getContextPath() + "</h1>");
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

        String idService = (String) request.getParameter("id");

        try {
            int intId = Integer.valueOf(idService);

            Service service = serviceDaoImp.getServiceByID(intId);
            if (Objects.isNull(service)) {
                System.err.println("Service not founded..");
                request.setAttribute("message", "Service not founded !");
                request.getRequestDispatcher("servicedetail.jsp").forward(request, response);
            }
            
             request.setAttribute("service", service);
            request.getRequestDispatcher("servicedetail.jsp").forward(request, response);

        } catch (Exception e) {
            System.err.println("Has error in get service data by id process..");
            System.err.println(e.getMessage());

            request.setAttribute("message", "Has error in get service data by id process..");
            request.getRequestDispatcher("servicedetail.jsp").forward(request, response);
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
