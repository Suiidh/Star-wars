package com.esgi.starwars.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/quiz")
public class QuizServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String type = request.getParameter("type");

        if ("jedi".equals(type)) {
            request.getRequestDispatcher("/quiz-jedi.jsp").forward(request, response);
        } else if ("vaisseaux".equals(type)) {
            request.getRequestDispatcher("/quiz-vaisseaux.jsp").forward(request, response);
        } else if ("sith".equals(type)) {
            request.getRequestDispatcher("/quiz-sith.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/quiz.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String type = request.getParameter("type");
        int score = 0;
        int total = 4;

        java.util.Map<String, String> userAnswers = new java.util.HashMap<>();
        java.util.Map<String, String> correctAnswers = new java.util.HashMap<>();
        java.util.Map<String, String> explanations = new java.util.HashMap<>();

        userAnswers.put("q1", request.getParameter("q1"));
        userAnswers.put("q2", request.getParameter("q2"));
        userAnswers.put("q3", request.getParameter("q3"));
        userAnswers.put("q4", request.getParameter("q4"));

        if ("jedi".equals(type)) {
            // Jedi Quiz Grading
            correctAnswers.put("q1", "b"); // Obi-Wan
            correctAnswers.put("q2", "d"); // Green
            correctAnswers.put("q3", "a"); // Coruscant
            correctAnswers.put("q4", "b"); // Anakin

            explanations.put("q1", "Le maître d'Anakin Skywalker était Obi-Wan Kenobi.");
            explanations.put("q2", "La couleur du sabre de Luke dans le Retour du Jedi est verte.");
            explanations.put("q3", "La capitale de la République est Coruscant.");
            explanations.put("q4", "C'est Anakin Skywalker qui a construit C-3PO.");

        } else if ("vaisseaux".equals(type)) {
            // Vaisseaux Quiz Grading
            correctAnswers.put("q1", "c"); // Falcon
            correctAnswers.put("q2", "a"); // Slave I
            correctAnswers.put("q3", "b"); // TIE Fighter
            correctAnswers.put("q4", "a"); // X-Wing

            explanations.put("q1", "Le vaisseau de Han Solo est le Faucon Millenium.");
            explanations.put("q2", "Le vaisseau de Boba Fett est le Slave I.");
            explanations.put("q3", "Le chasseur standard de l'Empire est le TIE Fighter.");
            explanations.put("q4", "Luke a détruit l'Étoile de la Mort aux commandes d'un X-Wing.");

        } else if ("sith".equals(type)) {
            // Sith Quiz Grading
            correctAnswers.put("q1", "b"); // Sidious
            correctAnswers.put("q2", "a"); // Maul
            correctAnswers.put("q3", "c"); // Rule of Two
            correctAnswers.put("q4", "d"); // Plagueis

            explanations.put("q1", "Le maître de Dark Vador est Dark Sidious (Palpatine).");
            explanations.put("q2", "Qui-Gon Jinn a été tué par Dark Maul sur Naboo.");
            explanations.put("q3", "La Règle des Deux: un maître et un apprenti.");
            explanations.put("q4", "Darth Plagueis le Sage a tout enseigné à Palpatine.");
        }

        // Calculate Score
        for (int i = 1; i <= 4; i++) {
            String q = "q" + i;
            if (correctAnswers.containsKey(q) && correctAnswers.get(q).equals(userAnswers.get(q))) {
                score++;
            }
        }

        request.setAttribute("score", score);
        request.setAttribute("total", total);
        request.setAttribute("userAnswers", userAnswers);
        request.setAttribute("correctAnswers", correctAnswers);
        request.setAttribute("explanations", explanations);
        request.setAttribute("type", type);

        request.getRequestDispatcher("/quiz-result.jsp").forward(request, response);
    }
}
