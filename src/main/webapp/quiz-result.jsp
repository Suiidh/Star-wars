<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Résultat Quiz - Star Wars</title>
    <link rel="stylesheet" href="/projet-star-wars/assets/css/theme.css?v=2">
    <style>
        .result-centered {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }
        .score-box {
            background: rgba(255, 215, 0, 0.1);
            border: 2px solid #ffd700;
            border-radius: 15px;
            padding: 30px;
            margin: 30px 0;
            display: inline-block;
            min-width: 200px;
        }
        .score-value {
            font-size: 3.5em;
            font-weight: bold;
            color: #ffd700;
            text-shadow: 0 0 20px rgba(255, 215, 0, 0.5);
            margin-bottom: 5px;
        }
        .score-label {
            color: #bdc3c7;
            font-size: 1.1em;
            text-transform: uppercase;
        }
        .message {
            color: #fff;
            font-size: 1.3em;
            margin: 20px 0 40px;
            line-height: 1.6;
            max-width: 600px;
        }
        .perfect { color: #f1c40f; }
        .excellent { color: #2ecc71; }
        .good { color: #3498db; }
        .needs-work { color: #e74c3c; }
        
        .medal {
            font-size: 5em;
            margin: 20px 0;
            animation: bounce 2s infinite ease-in-out;
        }
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-15px); }
        }
    </style>
</head>
<body>
    
    <!-- NAVBAR -->
    <nav class="navbar">
        <a href="/projet-star-wars/" class="nav-brand">
            <span class="nav-logo">🚀</span>
            <span>SW: Vaisseaux</span>
        </a>
        <div class="nav-links">
            <a href="/projet-star-wars/" class="nav-link">Accueil</a>
            <a href="/projet-star-wars/vaisseaux" class="nav-link">Catalogue</a>
            <a href="/projet-star-wars/quiz" class="nav-link active">Quiz</a>
            <c:if test="${not empty pageContext.request.userPrincipal}">
                <a href="/projet-star-wars/admin/vaisseaux" class="nav-link" style="color:var(--accent-1)">Admin</a>
            </c:if>
        </div>
        
        <div class="user-area">
            <c:if test="${not empty pageContext.request.userPrincipal}">
                <div class="user-snippet">
                    <span class="user-name">👤 ${pageContext.request.userPrincipal.name}</span>
                    <a href="/projet-star-wars/logout" class="logout-link">Déconnexion</a>
                </div>
            </c:if>
            <c:if test="${empty pageContext.request.userPrincipal}">
                <a href="/projet-star-wars/admin/" class="btn-secondary" style="padding: 5px 15px; font-size: 0.85rem;">Connexion</a>
            </c:if>
        </div>
    </nav>

    <div class="main-container">
        <div class="detail-card-lg result-centered">
            <h1>🌟 Résultats 🌟</h1>
            
            <%
                int score = (Integer) request.getAttribute("score");
                int total = (Integer) request.getAttribute("total");
                String message = "";
                String messageClass = "";
                String medal = "";
                
                // Logic updated for 4 questions
                if (score == 4) {
                    message = "Parfait! Tu es un véritable Maître Jedi! La Force est puissante en toi. 🎓";
                    messageClass = "perfect";
                    medal = "👑";
                } else if (score == 3) {
                    message = "Excellent! Tu es un Chevalier Jedi accompli. Encore un peu d'entraînement! 🚀";
                    messageClass = "excellent";
                    medal = "🥇";
                } else if (score == 2) {
                    message = "Pas mal, Padawan! Mais attention au Côté Obscur de l'ignorance. 💪";
                    messageClass = "good";
                    medal = "🥈";
                } else {
                    message = "Hmmm... Beaucoup à apprendre tu as encore. Regarde les films à nouveau! 📺";
                    messageClass = "needs-work";
                    medal = "📚";
                }
            %>
            
            <div class="medal"><%= medal %></div>
            
            <div class="score-box">
                <div class="score-value"><%= score %>/<%= total %></div>
                <div class="score-label">Score Final</div>
            </div>
            
            <div class="message <%= messageClass %>"><%= message %></div>
            
            <!-- Corrections Section -->
            <div class="result-details" style="text-align: left; width: 100%; max-width: 600px; margin-bottom: 30px;">
                <h3 style="text-align: center; margin-bottom: 20px; color: var(--accent-1); border-bottom: 1px solid rgba(255,255,255,0.1); padding-bottom: 10px;">🔎 Analyse Tactique</h3>
                <% 
                    java.util.Map<String, String> userAnswers = (java.util.Map<String, String>) request.getAttribute("userAnswers");
                    java.util.Map<String, String> correctAnswers = (java.util.Map<String, String>) request.getAttribute("correctAnswers");
                    java.util.Map<String, String> explanations = (java.util.Map<String, String>) request.getAttribute("explanations");
                    
                    if (userAnswers != null && correctAnswers != null) {
                        for(int i=1; i<=4; i++) {
                            String qKey = "q"+i;
                            String uAns = userAnswers.get(qKey);
                            String cAns = correctAnswers.get(qKey);
                            String expl = explanations.get(qKey);
                            boolean isCorrect = cAns != null && cAns.equals(uAns);
                            String statusIcon = isCorrect ? "✅" : "❌";
                            String color = isCorrect ? "#4cd137" : "#e84118";
                            String bgColor = isCorrect ? "rgba(76, 209, 55, 0.1)" : "rgba(232, 65, 24, 0.1)";
                %>
                <div style="background: <%= bgColor %>; border-left: 4px solid <%= color %>; padding: 15px; margin-bottom: 15px; border-radius: 4px;">
                    <p style="margin:0; font-weight:bold; color:<%= color %>">Question <%= i %> <%= statusIcon %></p>
                    <% if(!isCorrect) { %>
                        <p style="margin:5px 0 0; font-size: 0.9em; color:rgba(255,255,255,0.7);">Votre réponse: <span style="font-family: monospace; background: rgba(0,0,0,0.3); padding: 2px 5px; border-radius: 3px;"><%= uAns %></span></p>
                    <% } %>
                    <p style="margin:5px 0 0; font-size: 0.95em; color:#fff;">Correction: <strong><%= expl %></strong></p>
                </div>
                <%      }
                    } 
                %>
            </div>
            
            <div style="display: flex; gap: 20px; flex-wrap: wrap; justify-content: center;">
                <a href="/projet-star-wars/quiz" class="btn-primary">🔄 Refaire le quiz</a>
                <a href="/projet-star-wars/" class="btn-primary secondary">← Retour à l'accueil</a>
            </div>
        </div>
    </div>
    <!-- Main JS for Sith Mode -->
    <script src="/projet-star-wars/assets/js/main.js?v=2"></script>
</body>
</html>
