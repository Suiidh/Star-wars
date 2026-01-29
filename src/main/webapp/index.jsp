<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil - Star Wars Vaisseaux</title>
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
            <a href="/projet-star-wars/" class="nav-link active">Accueil</a>
            <a href="/projet-star-wars/vaisseaux" class="nav-link">Catalogue</a>
            <a href="/projet-star-wars/quiz" class="nav-link">Quiz</a>
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

    <!-- HERO SECTION -->
    <div class="hero-section">
        <div class="hero-logo">🌌</div>
        <h1>Star Wars Vaisseaux</h1>
        <p class="subtitle">Explorez les véhicules légendaires de la galaxie</p>
        
        <div style="margin-top: 30px;">
            <p style="color: #ccc; max-width: 600px; margin: 0 auto; line-height: 1.6;">
                Bienvenue dans notre base de données impériale... ou rebelle ? Découvrez les statistiques détaillées, l'histoire et les capacités des plus grands vaisseaux de l'univers.
            </p>
        </div>
    </div>
    
    <!-- MAIN CONTENT -->
    <div class="main-container">
        <div class="grid-container">
            <a href="/projet-star-wars/vaisseaux" class="feature-card">
                <div class="feature-icon">📋</div>
                <h3 class="feature-title">Catalogue</h3>
                <p class="feature-desc">Parcourez notre liste complète de vaisseaux, du X-Wing au Star Destroyer.</p>
                <span class="btn-primary" style="margin-top: auto;">Explorer</span>
            </a>
            
            <a href="/projet-star-wars/quiz" class="feature-card">
                <div class="feature-icon">🎓</div>
                <h3 class="feature-title">Quiz Galactique</h3>
                <p class="feature-desc">Testez vos connaissances et prouvez que vous êtes un vrai fan.</p>
                <span class="btn-primary" style="margin-top: auto;">Jouer</span>
            </a>
            
            <a href="/projet-star-wars/easter-eggs.jsp" class="feature-card">
                <div class="feature-icon">🪐</div>
                <h3 class="feature-title">Secrets</h3>
                <p class="feature-desc">Découvrez les mystères cachés de notre application.</p>
                <span class="btn-primary" style="margin-top: auto;">Découvrir</span>
            </a>
            

        </div>
        
        <div class="footer">
            <p>✨ Que la Force soit avec vous ✨</p>
            <p style="font-size: 0.8em; margin-top: 10px; opacity: 0.6;">Projet JEE - Star Wars Ships</p>
        </div>
    </div>

    <!-- Main JS for Sith Mode -->
    <script src="/projet-star-wars/assets/js/main.js?v=2"></script>
</body>
</html>