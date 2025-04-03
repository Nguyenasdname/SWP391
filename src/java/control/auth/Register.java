/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.auth;

import dao.UserDao;
import dao.imp.UserDaoImp;
import emailService.JavaMail;
import emailService.JavaMailImp;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet("/register")
public class Register extends HttpServlet {

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
            out.println("<title>Servlet Register</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
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
    String confirmPass = request.getParameter("confirmPass");
    String userEmail = request.getParameter("userEmail");

    JavaMail jvm = new JavaMailImp();
    UserDao userDao = new UserDaoImp();

    User checkUser = null;
    User newUser = null;

    // Kiểm tra xem email có phải là @gmail.com không
    if (!userEmail.toLowerCase().endsWith("@gmail.com")) {
        request.setAttribute("errorMessage", "Email phải có đuôi @gmail.com!");
        request.setAttribute("thisUserName", userName);
        request.setAttribute("thisUserEmail", userEmail);
        request.getRequestDispatcher("register.jsp").forward(request, response);
        return;
    }

    if (!userPass.equals(confirmPass)) {
        request.setAttribute("confirmPassError", "Not Correct Password!");
        request.setAttribute("thisUserName", userName);
        request.setAttribute("thisUserEmail", userEmail);            
        request.getRequestDispatcher("register.jsp").forward(request, response);
    } else {
        checkUser = userDao.isUserExists(userName.toLowerCase(), userEmail.toLowerCase());

        if (checkUser != null) {
            if (userName.equals(checkUser.getUserName())) {
                request.setAttribute("errorMessage", "Already have this username, please choose another!");
            } else if (userEmail.equals(checkUser.getUserEmail())) {
                request.setAttribute("errorMessage", "Already have this email, please choose another!");
            }
            request.setAttribute("thisUserName", userName);
            request.setAttribute("thisUserEmail", userEmail);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            newUser = new User(1, userName.toLowerCase(), userEmail.toLowerCase(), userPass, null, null, "Active", 2, null, null, null, null);
            
            newUser.setUserIMG("https://www.whiskas.in/sites/g/files/fnmzdf2051/files/2024-10/cat-play.png");
            newUser.setUserCode(jvm.generatedOTP());

            boolean sendMail = jvm.sendVerifyOTP(newUser);

            if (sendMail) {
                HttpSession session = request.getSession();
                session.setAttribute("user", newUser);
                response.sendRedirect("verify.jsp?action=register");
            }
        }
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
