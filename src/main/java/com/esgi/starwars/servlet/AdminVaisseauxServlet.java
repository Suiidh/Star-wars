package com.esgi.starwars.servlet;

import java.io.IOException;

import com.esgi.starwars.dao.ESGIVaisseauxDAO;
import com.esgi.starwars.entity.ESGIVaisseaux;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet admin pour gérer les vaisseaux (CRUD)
 * Accès restreint aux utilisateurs avec le rôle 'admin'
 */
@WebServlet("/admin/vaisseaux")
public class AdminVaisseauxServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");

            if ("add".equals(action)) {
                // Afficher le formulaire d'ajout
                request.getRequestDispatcher("/admin/add-vaisseaux.jsp").forward(request, response);

            } else if ("edit".equals(action)) {
                // Afficher le formulaire d'édition
                Long id = Long.parseLong(request.getParameter("id"));
                ESGIVaisseaux vaisseaux = ESGIVaisseauxDAO.findVaisseaux(id);

                if (vaisseaux == null) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Vaisseau non trouvé");
                    return;
                }
                request.setAttribute("vaisseaux", vaisseaux);
                request.getRequestDispatcher("/admin/edit-vaisseaux.jsp").forward(request, response);

            } else if ("delete".equals(action)) {
                // Supprimer un vaisseau
                Long id = Long.parseLong(request.getParameter("id"));
                ESGIVaisseauxDAO.removeVaisseaux(id);
                response.sendRedirect(request.getContextPath() + "/admin/vaisseaux");

            } else {
                // Lister tous les vaisseaux
                var vaisseaux = ESGIVaisseauxDAO.getAllVaisseaux();
                request.setAttribute("vaisseaux", vaisseaux);
                request.setAttribute("totalVaisseaux", vaisseaux.size());
                request.getRequestDispatcher("/admin/list-vaisseaux.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de vaisseau invalide");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Erreur interne du serveur");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String priceStr = request.getParameter("price");
            String speedStr = request.getParameter("speed");
            String powerStr = request.getParameter("power");
            String armorStr = request.getParameter("armor");
            String type = request.getParameter("type");
            String faction = request.getParameter("faction");

            // Validation des données
            if (name == null || name.trim().isEmpty() ||
                    description == null || description.trim().isEmpty() ||
                    priceStr == null || priceStr.trim().isEmpty() ||
                    speedStr == null || speedStr.trim().isEmpty() ||
                    powerStr == null || powerStr.trim().isEmpty() ||
                    armorStr == null || armorStr.trim().isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Tous les champs sont obligatoires");
                return;
            }

            float price = Float.parseFloat(priceStr);
            int speed = Integer.parseInt(speedStr);
            int power = Integer.parseInt(powerStr);
            int armor = Integer.parseInt(armorStr);

            if (price < 0 || speed < 0 || power < 0 || armor < 0) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Les valeurs ne peuvent pas être négatives");
                return;
            }

            if ("add".equals(action)) {
                // Ajouter un nouveau vaisseau
                ESGIVaisseaux v = new ESGIVaisseaux(name.trim(), description.trim(), price, power, speed, armor, type,
                        faction);
                ESGIVaisseauxDAO.addVaisseaux(v);

            } else if ("update".equals(action)) {
                // Mettre à jour un vaisseau existant
                Long id = Long.parseLong(request.getParameter("id"));
                ESGIVaisseaux v = new ESGIVaisseaux(id, name.trim(), description.trim(), price, power, speed, armor,
                        type, faction);
                ESGIVaisseauxDAO.updateVaisseaux(v);
            }

            response.sendRedirect(request.getContextPath() + "/admin/vaisseaux");

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Données invalides");
        } catch (IllegalArgumentException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().println("<html><body><h1>Erreur 500</h1><pre>");
            e.printStackTrace(response.getWriter());
            response.getWriter().println("</pre></body></html>");
        }
    }
}