package com.esgi.starwars.servlet;

import java.io.IOException;

import com.esgi.starwars.dao.ESGIVaisseauxDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet pour afficher la liste des vaisseaux publiquement
 */
@WebServlet("/vaisseaux")
public class VaisseauxServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            var vaisseaux = ESGIVaisseauxDAO.getAllVaisseaux();
            request.setAttribute("vaisseaux", vaisseaux);
            request.setAttribute("totalVaisseaux", vaisseaux.size());
            request.getRequestDispatcher("/vaisseaux.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Erreur lors de la récupération des vaisseaux");
        }
    }
}