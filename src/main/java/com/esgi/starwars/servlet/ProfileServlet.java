package com.esgi.starwars.servlet;

import com.esgi.starwars.dao.QuizDAO;
import com.esgi.starwars.entity.Score;
import com.esgi.starwars.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        List<Score> scores = QuizDAO.getUserScores(user);

        request.setAttribute("scores", scores);
        request.getRequestDispatcher("/profile.jsp").forward(request, response);
    }
}
