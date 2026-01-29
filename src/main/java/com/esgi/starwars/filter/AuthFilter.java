package com.esgi.starwars.filter;

import com.esgi.starwars.entity.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);

        String path = request.getRequestURI().substring(request.getContextPath().length());

        User user = (session != null) ? (User) session.getAttribute("user") : null;

        // Protect Admin Area
        if (path.startsWith("/admin")) {
            if (user == null || !"ADMIN".equals(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/login.jsp");
                return;
            }
        }

        // Make user available in request scope for JSPs (e.g. navbar)
        if (user != null) {
            request.setAttribute("currentUser", user);
        }

        chain.doFilter(request, response);
    }
}
