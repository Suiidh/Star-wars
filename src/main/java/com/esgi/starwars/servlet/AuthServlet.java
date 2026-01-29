package com.esgi.starwars.servlet;

import com.esgi.starwars.dao.UserDAO;
import com.esgi.starwars.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AuthServlet", urlPatterns = { "/auth/*" })
public class AuthServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getPathInfo();

        if ("/login".equals(path)) {
            handleLogin(request, response);
        } else if ("/register".equals(path)) {
            handleRegister(request, response);
        } else if ("/logout".equals(path)) {
            handleLogout(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getPathInfo();
        if ("/logout".equals(path)) {
            handleLogout(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (UserDAO.validateCredentials(username, password)) {
            User user = UserDAO.findByUsername(username);
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Redirect based on role
            if ("ADMIN".equals(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/admin/vaisseaux");
            } else {
                response.sendRedirect(request.getContextPath() + "/vaisseaux");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/login-error.jsp");
        }
    }

    private void handleRegister(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (UserDAO.findByUsername(username) != null) {
            // User already exists
            response.sendRedirect(request.getContextPath() + "/register.jsp?error=exists");
            return;
        }

        User newUser = new User(username, password, "USER");
        UserDAO.createUser(newUser);

        // Auto login
        HttpSession session = request.getSession();
        session.setAttribute("user", newUser);

        response.sendRedirect(request.getContextPath() + "/vaisseaux");
    }

    private void handleLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
}
