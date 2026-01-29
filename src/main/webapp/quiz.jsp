<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Star Wars</title>
    <link rel="stylesheet" href="/projet-star-wars/assets/css/theme.css?v=2">
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
        <div class="hero" style="min-height: auto; padding: 40px 20px; text-align: center; background: transparent;">
            <h1>🌟 Zone d'Entraînement 🌟</h1>
            <p style="color: #bdc3c7; font-size: 1.2rem; max-width: 600px; margin: 0 auto; margin-top: 10px;">
                Choisis ta voie et prouve tes connaissances sur l'univers Star Wars.
            </p>
        </div>

        <div class="grid-container" style="grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 30px; margin-top: 20px;">
            
            <!-- Quiz Jedi -->
            <a href="?type=jedi" class="feature-card" style="text-decoration: none;">
                <div class="feature-icon">🤺</div>
                <h3 class="feature-title">La Voie du Jedi</h3>
                <p class="feature-desc">Testez vos connaissances sur les personnages, la Force et l'histoire.</p>
                <div style="margin-top: auto; display: flex; gap: 10px; flex-wrap: wrap;">
                    <span style="background: rgba(46, 204, 113, 0.2); color: #2ecc71; padding: 5px 10px; border-radius: 4px; font-size: 0.8rem;">Facile</span>
                    <span style="background: rgba(255, 255, 255, 0.1); color: #fff; padding: 5px 10px; border-radius: 4px; font-size: 0.8rem;">4 Questions</span>
                </div>
                <span class="btn-primary" style="margin-top: 20px; width: 100%; text-align: center;">Commencer</span>
            </a>

            <!-- Quiz Vaisseaux -->
            <a href="?type=vaisseaux" class="feature-card" style="text-decoration: none; border-color: var(--accent-2);">
                <div class="feature-icon">🚀</div>
                <h3 class="feature-title">Pilote de l'Escadron</h3>
                <p class="feature-desc">Connaissez-vous les vaisseaux et les batailles légendaires?</p>
                <div style="margin-top: auto; display: flex; gap: 10px; flex-wrap: wrap;">
                    <span style="background: rgba(241, 196, 15, 0.2); color: #f1c40f; padding: 5px 10px; border-radius: 4px; font-size: 0.8rem;">Moyen</span>
                    <span style="background: rgba(255, 255, 255, 0.1); color: #fff; padding: 5px 10px; border-radius: 4px; font-size: 0.8rem;">4 Questions</span>
                </div>
                <span class="btn-primary" style="margin-top: 20px; width: 100%; text-align: center;">Décoller</span>
            </a>

            <!-- Quiz Sith (Hidden by default) -->
            <a href="?type=sith" id="sith-quiz-card" class="feature-card" style="text-decoration: none; border-color: #ff3333; display: none;">
                <div class="feature-icon">⚡</div>
                <h3 class="feature-title" style="color: #ff3333 !important;">L'Épreuve Sith</h3>
                <p class="feature-desc">Seuls les initiés du Côté Obscur peuvent tenter cette épreuve.</p>
                <div style="margin-top: auto; display: flex; gap: 10px; flex-wrap: wrap;">
                    <span style="background: rgba(255, 51, 51, 0.2); color: #ff3333; padding: 5px 10px; border-radius: 4px; font-size: 0.8rem;">Expert</span>
                    <span style="background: rgba(255, 255, 255, 0.1); color: #fff; padding: 5px 10px; border-radius: 4px; font-size: 0.8rem;">4 Questions</span>
                </div>
                <span class="btn-primary" style="margin-top: 20px; width: 100%; text-align: center; background: #ff3333; border-color: #cc0000;">Rejoindre l'Ordre</span>
            </a>

        </div>
    </div>
    <!-- Main JS for Sith Mode -->
    <script src="/projet-star-wars/assets/js/main.js?v=2"></script>
</body>
</html>
