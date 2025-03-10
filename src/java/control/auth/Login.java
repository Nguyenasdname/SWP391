/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.auth;

import dao.UserDao;
import dao.imp.UserDaoImp;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet("/login")
public class Login extends HttpServlet {

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
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
        String userName = request.getParameter("userName");
        String userPass = request.getParameter("userPass");

        UserDao userDao = new UserDaoImp();

        User user = userDao.validateUser(userName.toLowerCase(), userPass);

        if (user == null) {
            request.setAttribute("accountMessage", "Wrong Username or Password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {

            if (user.getUserStatus() == "Banned") {
                request.setAttribute("accountMessage", "Your Account Has Been Banned!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {

                HttpSession session = request.getSession(false);
                if (session == null) {
                    session = request.getSession(true);
                }
                session.setAttribute("user", user);

                String remember = request.getParameter("remember");

                Cookie cUser = new Cookie("cUser", userName);
                Cookie cPass = new Cookie("cPass", userPass);
                Cookie cRem = new Cookie("cRem", remember);

                if (remember != null) {

                    cUser.setMaxAge(60 * 60 * 24); //1 day
                    cPass.setMaxAge(60 * 60 * 24);
                    cRem.setMaxAge(60 * 60 * 24);
                } else {
                    cUser.setMaxAge(0);
                    cPass.setMaxAge(0);
                    cRem.setMaxAge(0);
                }
                response.addCookie(cUser);
                response.addCookie(cPass);
                response.addCookie(cRem);

                String originalURL = (String) session.getAttribute("originalURL");
                if (originalURL != null) {
                    response.sendRedirect(originalURL);
                } else {
                    response.sendRedirect("index.jsp");
                }
            }
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
