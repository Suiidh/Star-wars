package com.esgi.starwars.servlet;

import com.esgi.starwars.dao.ESGIVaisseauxDAO;
import com.esgi.starwars.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/init-data")
public class AdminInitServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        User user = (User) session.getAttribute("user");
        if (!"ADMIN".equals(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        // Force re-init (Logic needs to be added to DAO or handled here)
        // Since DAO.initData is private, we might need to expose a public method or
        // just call a method that triggers it.
        // Actually, let's expose a forceInit method in DAO for this purpose.

        ESGIVaisseauxDAO.forceInitData();

        response.sendRedirect(request.getContextPath() + "/profile.jsp?msg=reset_success");
    }
}
