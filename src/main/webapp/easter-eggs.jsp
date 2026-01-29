<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Secrets & Easter Eggs - Star Wars</title>
    <link rel="stylesheet" href="/projet-star-wars/assets/css/theme.css?v=2">
    <style>
        .easter-container {
            padding: 40px 20px;
            color: #fff;
            transition: all 1s ease;
        }
        
        .easter-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
            margin: 30px 0;
        }
        
        .easter-item {
            background: rgba(255, 215, 0, 0.05);
            border: 1px solid rgba(255, 215, 0, 0.3);
            border-radius: 12px;
            padding: 25px;
            text-align: center;
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
        }
        
        .easter-item:hover {
            background: rgba(255, 215, 0, 0.2);
            border-color: #ffd700;
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 10px 30px rgba(255, 215, 0, 0.3);
        }
        
        .easter-emoji {
            font-size: 3.5em;
            margin-bottom: 15px;
            display: inline-block;
            transition: transform 0.3s;
        }
        
        .easter-item:hover .easter-emoji {
            transform: scale(1.2) rotate(10deg);
            animation: bounce 0.5s ease infinite alternate;
        }
        @keyframes bounce { from { transform: translateY(0) scale(1.2); } to { transform: translateY(-5px) scale(1.2); } }
        
        .easter-title {
            color: #ffd700;
            font-weight: 800;
            margin-bottom: 10px;
            font-size: 1.2em;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .easter-description {
            color: #bdc3c7;
            font-size: 0.95em;
            font-style: italic;
        }
        
        .secret-message {
            display: none;
            margin-top: 15px;
            padding: 15px;
            background: rgba(255, 215, 0, 0.15);
            border-left: 4px solid #ffd700;
            color: #fff;
            border-radius: 8px;
            animation: slide-in 0.4s ease-out;
            text-align: left;
            font-size: 0.9em;
            line-height: 1.5;
        }
        
        .easter-item.revealed .secret-message {
            display: block;
        }
        
        .konami-hint {
            margin-top: 50px;
            text-align: center;
            opacity: 0.3;
            font-size: 0.8em;
            font-family: monospace;
            cursor: help;
        }
        
        .konami-hint:hover {
            opacity: 0.8;
            color: #ffd700;
        }
        
        /* Konami Mode Styles */
        body.konami-active {
            background: linear-gradient(135deg, #2c0000 0%, #4a0000 100%) !important;
        }
        
        body.konami-active .navbar, 
        body.konami-active .detail-card-lg {
             border-color: #ff3333;
             box-shadow: 0 0 50px rgba(255, 0, 0, 0.4);
        }
        
        body.konami-active h1, 
        body.konami-active .easter-title,
        body.konami-active .easter-item:hover {
            color: #ff3333;
            border-color: #ff3333;
        }
        
        body.konami-active .secret-message {
            border-left-color: #ff3333;
            background: rgba(255, 0, 0, 0.2);
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

    <div class="main-container">
        <div class="detail-card-lg">
            <h1 class="page-title">🕵️ Secrets & Fun Facts 🕵️</h1>
            <p style="text-align: center; color: #bdc3c7; margin-bottom: 40px; font-size: 1.1em;">
                Cliquez sur les cartes pour révéler la vérité cachée...
            </p>
            
            <div class="easter-grid">
                <!-- Fact 1 -->
                <div class="easter-item" onclick="this.classList.toggle('revealed')">
                    <div class="easter-emoji">🐘</div>
                    <div class="easter-title">Le cri du TIE Fighter</div>
                    <div class="easter-description">Un son iconique... mais d'où vient-il ?</div>
                    <div class="secret-message">
                        <strong>Le saviez-vous ?</strong> Le son strident des chasseurs TIE est en réalité un mélange du barrissement d'un éléphant et du bruit de pneus de voiture roulant sur du bitume mouillé ! 🚗
                    </div>
                </div>

                <!-- Fact 2 -->
                <div class="easter-item" onclick="this.classList.toggle('revealed')">
                    <div class="easter-emoji">⚔️</div>
                    <div class="easter-title">Bruitages à la bouche</div>
                    <div class="easter-description">Obi-Wan ne pouvait pas s'en empêcher</div>
                    <div class="secret-message">
                        Durant le tournage de l'Épisode I, <strong>Ewan McGregor</strong> faisait constamment les bruits de sabre laser ("Vvvvzt!") avec sa bouche pendant les combats. Ils ont dû être effacés en post-production ! 😂
                    </div>
                </div>

                <!-- Fact 3 -->
                <div class="easter-item" onclick="this.classList.toggle('revealed')">
                    <div class="easter-emoji">🤥</div>
                    <div class="easter-title">Le plus grand secret</div>
                    <div class="easter-description">Même les acteurs ne savaient pas</div>
                    <div class="secret-message">
                        Pour garder le secret de "Je suis ton père", David Prowse (l'acteur sous le costume de Vador) a dit sur le plateau : <em>"Obi-Wan a tué ton père"</em>. Seul Mark Hamill connaissait la vraie réplique, ajoutée plus tard en doublage par James Earl Jones !
                    </div>
                </div>

                <!-- Fact 4 -->
                <div class="easter-item" onclick="this.classList.toggle('revealed')">
                    <div class="easter-emoji">👽</div>
                    <div class="easter-title">L'espèce de Yoda</div>
                    <div class="easter-description">Un mystère total</div>
                    <div class="secret-message">
                        L'espèce de Yoda n'a <strong>jamais</strong> été nommée dans le canon officiel. George Lucas a toujours voulu garder ce mystère intact. On l'appelle simplement "L'espèce de Yoda".
                    </div>
                </div>

                <!-- Fact 5 -->
                <div class="easter-item" onclick="this.classList.toggle('revealed')">
                    <div class="easter-emoji">🥶</div>
                    <div class="easter-title">Han Solo Improvisateur</div>
                    <div class="easter-description">"Je t'aime" - "..."</div>
                    <div class="secret-message">
                        La réplique culte "Je sais" de Han Solo n'était pas dans le script ! Harrison Ford devait répondre "Moi aussi je t'aime", mais il trouvait ça trop mielleux et a improvisé.
                    </div>
                </div>
                
                 <!-- Fact 6 -->
                <div class="easter-item" onclick="this.classList.toggle('revealed')">
                    <div class="easter-emoji">📐</div>
                    <div class="easter-title">Trop grand pour le décor</div>
                    <div class="easter-description">Problème de Jedi</div>
                    <div class="secret-message">
                        Liam Neeson (Qui-Gon Jinn) était si grand (1m93) que l'équipe a dû reconstruire tous les décors de portes du vaisseau Naboo pour qu'il ne se cogne pas la tête ! 🤕
                    </div>
                </div>
            </div>

            <div style="text-align: center;">
                <a href="/projet-star-wars/" class="btn-primary secondary">← Retour au Hangar</a>
            </div>
            
            <div class="konami-hint" title="Essayez le Konami Code...">
                ⬆️ ⬆️ ⬇️ ⬇️ ⬅️ ➡️ ⬅️ ➡️ B A
            </div>
        </div>
    </div>

    <!-- Script Konami Code -->
    <script src="/projet-star-wars/assets/js/main.js?v=2"></script>
    <script>
        const konamiCode = [
            "ArrowUp", "ArrowUp", 
            "ArrowDown", "ArrowDown", 
            "ArrowLeft", "ArrowRight", 
            "ArrowLeft", "ArrowRight", 
            "b", "a"
        ];
        let konamiIndex = 0;

        document.addEventListener('keydown', (e) => {
            if (e.key === konamiCode[konamiIndex]) {
                konamiIndex++;
                if (konamiIndex === konamiCode.length) {
                    enableSithMode(); // Calls function from main.js
                    konamiIndex = 0;
                }
            } else {
                konamiIndex = 0;
            }
        });
    </script>
</body>
</html>

