/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.villa;

import dao.VillaDao;
import dao.imp.VillaDaoImp;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Villa;

/**
 *
 * @author Admin
 */
@WebServlet(name = "RoomAvailableServlet", urlPatterns = {"/roomAvailable"})
public class VillaAvailable extends HttpServlet {

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
            out.println("<title>Servlet RoomAvailable</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RoomAvailable at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");

        VillaDao villaDao = new VillaDaoImp();
        
        ArrayList<Villa> availableVillas = new ArrayList();
        
        switch (action) {
            case "listAll":
                
                availableVillas = villaDao.getAllVillaList();
                request.setAttribute("availableVillas", availableVillas);
                request.getRequestDispatcher("rooms.jsp").forward(request, response);
                
                break;
            case "listCondition":
                String villaCapacity = request.getParameter("numofpeople");
                String fromDate = request.getParameter("fromDate");
                String toDate = request.getParameter("toDate");

                availableVillas = villaDao.getAllVillaAvailable(Integer.parseInt(villaCapacity));

                request.setAttribute("availableVillas", availableVillas);
                request.setAttribute("fromDate", fromDate);
                request.setAttribute("toDate", toDate);
                request.setAttribute("numofpeople", villaCapacity);
                request.setAttribute("action", action);

                request.getRequestDispatcher("rooms.jsp").forward(request, response);
                break;
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
