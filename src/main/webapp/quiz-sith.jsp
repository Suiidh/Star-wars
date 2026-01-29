<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz des Seigneurs Sith - Star Wars</title>
    <link rel="stylesheet" href="/projet-star-wars/assets/css/theme.css?v=2">
    <style>
        .page-title { color: #ff3333 !important; }
        .quiz-card { border-color: #ff3333; box-shadow: 0 0 20px rgba(255, 0, 0, 0.4); }
        .btn-primary { background: #ff3333; border-color: #cc0000; box-shadow: 0 0 10px rgba(255, 0, 0, 0.4); }
        .btn-primary:hover { background: #cc0000; }
        .option-input:checked + .option-label { border-color: #ff3333; background: rgba(255, 0, 0, 0.2); }
    </style>
</head>
<body class="konami-active">
    <!-- NAVBAR -->
    <nav class="navbar">
        <a href="/projet-star-wars/" class="nav-brand">
            <span class="nav-logo">🚀</span>
            <span>SW: Vaisseaux</span>
        </a>
        <div class="nav-links">
            <a href="/projet-star-wars/" class="nav-link">Accueil</a>
            <a href="/projet-star-wars/vaisseaux" class="nav-link">Catalogue</a>
            <a href="/projet-star-wars/quiz" class="nav-link active" style="color:var(--accent-1)">Quiz</a>
            <a href="/projet-star-wars/admin/vaisseaux" class="nav-link">Admin</a>
        </div>
        
        <div class="user-area">
             <div class="user-snippet">
                <span class="user-name">👤 ${pageContext.request.userPrincipal.name}</span>
                <a href="/projet-star-wars/logout" class="logout-link">Déconnexion</a>
            </div>
        </div>
    </nav>

    <div class="main-container">
        <div class="detail-card-lg quiz-card">
            <div style="text-align: center; margin-bottom: 30px;">
                <h1 class="page-title">☠️ L'Épreuve des Sith ☠️</h1>
                <p style="color: #ff8888; font-style: italic;">"La peur mène à la colère, la colère mène à la haine..."</p>
            </div>
            
            <form action="quiz" method="post">
                <input type="hidden" name="type" value="sith">
                
                <!-- Q1 -->
                <div class="quiz-question">
                    <h3>1. Qui est le maître de Dark Vador ?</h3>
                    <div class="quiz-options">
                        <label class="quiz-option">
                            <input type="radio" name="q1" value="a" class="option-input" required>
                            <span class="option-label">Dark Maul</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q1" value="b" class="option-input">
                            <span class="option-label">Darth Sidious</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q1" value="c" class="option-input">
                            <span class="option-label">Comte Dooku</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q1" value="d" class="option-input">
                            <span class="option-label">Snoke</span>
                        </label>
                    </div>
                </div>

                <!-- Q2 -->
                <div class="quiz-question">
                    <h3>2. Qui a tué Qui-Gon Jinn ?</h3>
                    <div class="quiz-options">
                        <label class="quiz-option">
                            <input type="radio" name="q2" value="a" class="option-input" required>
                            <span class="option-label">Dark Maul</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q2" value="b" class="option-input">
                            <span class="option-label">Jango Fett</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q2" value="c" class="option-input">
                            <span class="option-label">Général Grievous</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q2" value="d" class="option-input">
                            <span class="option-label">Boba Fett</span>
                        </label>
                    </div>
                </div>

                <!-- Q3 -->
                <div class="quiz-question">
                    <h3>3. Quelle est la règle absolue des Sith ?</h3>
                    <div class="quiz-options">
                        <label class="quiz-option">
                            <input type="radio" name="q3" value="a" class="option-input" required>
                            <span class="option-label">La Règle de Trois</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q3" value="b" class="option-input">
                            <span class="option-label">La Règle de l'Un</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q3" value="c" class="option-input">
                            <span class="option-label">La Règle des Deux</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q3" value="d" class="option-input">
                            <span class="option-label">La Règle du Plus Fort</span>
                        </label>
                    </div>
                </div>

                <!-- Q4 -->
                <div class="quiz-question">
                    <h3>4. Qui a enseigné à Palpatine tout ce qu'il sait ?</h3>
                    <div class="quiz-options">
                        <label class="quiz-option">
                            <input type="radio" name="q4" value="a" class="option-input" required>
                            <span class="option-label">Darth Bane</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q4" value="b" class="option-input">
                            <span class="option-label">Darth Revan</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q4" value="c" class="option-input">
                            <span class="option-label">Darth Tyranus</span>
                        </label>
                        <label class="quiz-option">
                            <input type="radio" name="q4" value="d" class="option-input">
                            <span class="option-label">Darth Plagueis le Sage</span>
                        </label>
                    </div>
                </div>

                <div style="text-align: center; margin-top: 40px;">
                    <button type="submit" class="btn-primary">Soumettre au Côté Obscur</button>
                    <a href="quiz" class="btn-primary">Renoncer</a>
                </div>
            </form>
        </div>
    </div>
    <!-- Main JS for Sith Mode -->
    <script src="/projet-star-wars/assets/js/main.js?v=2"></script>
</body>
</html>
