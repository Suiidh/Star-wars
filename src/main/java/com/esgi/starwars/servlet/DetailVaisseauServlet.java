package com.esgi.starwars.servlet;

import java.io.IOException;

import com.esgi.starwars.dao.ESGIVaisseauxDAO;
import com.esgi.starwars.entity.ESGIVaisseaux;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/detail")
public class DetailVaisseauServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String idParam = request.getParameter("id");

            if (idParam == null || idParam.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/vaisseaux");
                return;
            }

            Long id = Long.parseLong(idParam);
            ESGIVaisseaux vaisseau = ESGIVaisseauxDAO.findVaisseaux(id);

            if (vaisseau == null) {
                request.setAttribute("error", "Vaisseau non trouvé");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
                return;
            }

            request.setAttribute("vaisseau", vaisseau);
            request.getRequestDispatcher("/detail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "ID invalide");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
