<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Vaisseaux - Star Wars</title>
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
        <div class="detail-card-lg">
            
            <h1 class="page-title">🚀 Pilote de l'Escadron</h1>
            <div style="text-align: center; color: #bdc3c7; margin-bottom: 40px; font-size: 1.1em;">
                Prouvez que vous connaissez les vaisseaux de la galaxie comme votre poche.
            </div>
            
            <form method="POST" action="/projet-star-wars/quiz">
                <input type="hidden" name="type" value="vaisseaux">
                
                <div class="form-group" style="margin-bottom: 30px;">
                    <label style="font-size: 1.2em; color: var(--accent-1); margin-bottom: 15px; display: block;">1. Quel vaisseau Han Solo pilote-t-il?</label>
                    <div style="display: flex; flex-direction: column; gap: 10px;">
                        <label class="quiz-option">
                            <input type="radio" name="q1" value="a"> <span>X-Wing</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q1" value="b"> <span>TIE Fighter</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q1" value="c"> <span>Millennium Falcon</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q1" value="d"> <span>Star Destroyer</span>
                        </label>
                    </div>
                </div>

                <div class="form-group" style="margin-bottom: 30px;">
                    <label style="font-size: 1.2em; color: var(--accent-1); margin-bottom: 15px; display: block;">2. Quel est le nom du vaisseau de Boba Fett?</label>
                    <div style="display: flex; flex-direction: column; gap: 10px;">
                        <label class="quiz-option">
                            <input type="radio" name="q2" value="a"> <span>Slave I (Firespray)</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q2" value="b"> <span>Razor Crest</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q2" value="c"> <span>Ghost</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q2" value="d"> <span>Ebon Hawk</span>
                        </label>
                    </div>
                </div>

                <div class="form-group" style="margin-bottom: 30px;">
                    <label style="font-size: 1.2em; color: var(--accent-1); margin-bottom: 15px; display: block;">3. Quel est le chasseur principal de l'Empire?</label>
                    <div style="display: flex; flex-direction: column; gap: 10px;">
                        <label class="quiz-option">
                            <input type="radio" name="q3" value="a"> <span>X-Wing</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q3" value="b"> <span>TIE Fighter</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q3" value="c"> <span>Y-Wing</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q3" value="d"> <span>Snowspeeder</span>
                        </label>
                    </div>
                </div>

                <div class="form-group" style="margin-bottom: 40px;">
                    <label style="font-size: 1.2em; color: var(--accent-1); margin-bottom: 15px; display: block;">4. Quel vaisseau Luke utilise-t-il pour détruire l'Étoile de la Mort?</label>
                    <div style="display: flex; flex-direction: column; gap: 10px;">
                        <label class="quiz-option">
                            <input type="radio" name="q4" value="a"> <span>T-65 X-Wing</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q4" value="b"> <span>A-Wing</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q4" value="c"> <span>B-Wing</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q4" value="d"> <span>Naboo Starfighter</span>
                        </label>
                    </div>
                </div>

                <button type="submit" class="btn-primary" style="width: 100%; font-size: 1.2rem; padding: 15px;">✨ Voir mon score ✨</button>
            </form>
            
             <div style="text-align: center; margin-top: 30px;">
                <a href="/projet-star-wars/quiz" class="btn-secondary">← Retour au choix</a>
            </div>
        </div>
    </div>
    <!-- Main JS for Sith Mode -->
    <script src="/projet-star-wars/assets/js/main.js?v=2"></script>
</body>
</html>
