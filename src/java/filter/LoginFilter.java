package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

@WebFilter({"/confirmBooking", "/bookingHistory", "/bookingDetails", "/showContact", "/login"}) // Chặn nhiều Servlet nếu cần
public class LoginFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            String originalURL = req.getHeader("Referer");
            if (session != null) {
                session.setAttribute("originalURL", originalURL);
            }
            res.sendRedirect("login.jsp?alertMessage=You Need To Login To Continue!&originalURL=" + originalURL);
            return;
        }

        // Lấy userStatus từ session

        chain.doFilter(request, response); // Cho phép request tiếp tục nếu đã đăng nhập hợp lệ
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void destroy() {
    }
}
