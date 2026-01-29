package com.esgi.starwars.servlet;

import com.esgi.starwars.dao.QuizDAO;
import com.esgi.starwars.entity.Question;
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
import java.util.Map;
import java.util.HashMap;

@WebServlet("/quiz")
public class QuizServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String type = request.getParameter("type");

        if (type != null && !type.isEmpty()) {
            // Fetch questions from DB
            List<Question> questions = QuizDAO.getQuestionsByType(type);
            request.setAttribute("questions", questions);
            request.setAttribute("type", type);
            // Forward to a generic quiz page that iterates over questions
            request.getRequestDispatcher("/quiz-dynamic.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/quiz.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String type = request.getParameter("type");

        // Fetch original questions to verify answers
        List<Question> questions = QuizDAO.getQuestionsByType(type);

        int score = 0;
        int total = questions.size();

        Map<String, String> userAnswers = new HashMap<>();
        Map<String, String> correctAnswers = new HashMap<>(); // Key: QuestionText or ID
        Map<String, String> explanations = new HashMap<>();

        for (Question q : questions) {
            String paramName = "q" + q.getId(); // Use ID for stability
            String userAnswer = request.getParameter(paramName);

            userAnswers.put(paramName, userAnswer);
            correctAnswers.put(paramName, q.getCorrectChoice());
            explanations.put(paramName, q.getExplanation());

            if (q.getCorrectChoice().equalsIgnoreCase(userAnswer)) {
                score++;
            }
        }

        // Save Score if user is logged in
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            QuizDAO.saveScore(new Score(user, type, score, total));
        }

        request.setAttribute("score", score);
        request.setAttribute("total", total);
        request.setAttribute("userAnswers", userAnswers);
        request.setAttribute("correctAnswers", correctAnswers);
        request.setAttribute("explanations", explanations);
        request.setAttribute("type", type);
        request.setAttribute("questions", questions); // Pass back questions for display

        request.getRequestDispatcher("/quiz-result-dynamic.jsp").forward(request, response);
    }
}
