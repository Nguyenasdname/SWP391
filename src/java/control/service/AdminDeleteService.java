package control.service;

import dao.imp.ServiceDaoImp;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminDeleteService", urlPatterns = {"/admin-delete-service"})
public class AdminDeleteService extends HttpServlet {

    private ServiceDaoImp serviceDaoImp;

    @Override
    public void init() throws ServletException {
        serviceDaoImp = new ServiceDaoImp();
    }

    // POST method for deleting the service
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the service ID from the form parameter
        String idParam = request.getParameter("ID");

        if (idParam != null) {
            int id = Integer.parseInt(idParam); // Convert the ID to an integer

            // Call the DAO method to remove the service from the database
            serviceDaoImp.removeServiceById(id);
        }

        // After deleting, redirect the user to the service management page (list of services)
        response.sendRedirect("admin-get-services");
    }

    @Override
    public String getServletInfo() {
        return "Servlet for deleting a service";
    }
}
