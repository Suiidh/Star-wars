package com.esgi.starwars.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Déconnecter l'utilisateur
            request.logout();
        } catch (ServletException e) {
            e.printStackTrace();
        }
        
        // Rediriger vers l'accueil
        response.sendRedirect(request.getContextPath() + "/");
    }
}
