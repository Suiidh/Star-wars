<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalogue des Vaisseaux</title>
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
            <a href="/projet-star-wars/vaisseaux" class="nav-link active">Catalogue</a>
            <a href="/projet-star-wars/quiz" class="nav-link">Quiz</a>
            <c:if test="${not empty sessionScope.user and sessionScope.user.role == 'ADMIN'}">
                <a href="/projet-star-wars/admin/vaisseaux" class="nav-link" style="color:var(--accent-1)">Admin</a>
            </c:if>
        </div>
        
        <div class="user-area">
            <c:if test="${not empty sessionScope.user}">
                <div class="user-snippet">
                    <a href="${pageContext.request.contextPath}/profile" class="user-name" style="color:white; text-decoration:none;">👤 ${sessionScope.user.username}</a>
                    <a href="/projet-star-wars/auth/logout" class="logout-link">Déconnexion</a>
                </div>
            </c:if>
            <c:if test="${empty sessionScope.user}">
                <a href="/projet-star-wars/login.jsp" class="btn-secondary" style="padding: 5px 15px; font-size: 0.85rem;">Connexion</a>
            </c:if>
        </div>
    </nav>

    <div class="main-container">
        <div class="header" style="text-align: center; margin-bottom: 50px;">
            <div class="logo">🌌</div>
            <h1>Catalogue des Vaisseaux</h1>
            <p class="subtitle">Flotte Galactique - ${totalVaisseaux} vaisseaux disponibles</p>
        </div>
        
        <!-- TOOLBAR -->
        <div class="top-toolbar">
            <div class="search-container">
                <i class="search-icon">🔍</i>
                <input type="text" id="searchInput" class="search-input" placeholder="Rechercher un vaisseau..." onkeyup="filterVaisseaux()">
            </div>
            
            <div style="display:flex; gap:10px;">
                <a href="/projet-star-wars/quiz" class="btn-primary secondary" style="margin:0; padding:10px 20px;">🎓 Quiz</a>
                <c:if test="${not empty pageContext.request.userPrincipal}">
                     <a href="/projet-star-wars/admin/vaisseaux" class="btn-primary" style="margin:0; padding:10px 20px;">+ Ajouter</a>
                </c:if>
            </div>
        </div>
        
        <c:if test="${empty vaisseaux}">
            <div class="error" style="text-align:center;">
                Aucun vaisseau disponible pour le moment.
            </div>
        </c:if>
        
        <c:if test="${not empty vaisseaux}">
            <div class="vaisseau-grid" id="vaisseauxGrid">
                <c:forEach var="vaisseau" items="${vaisseaux}">
                    <div class="vaisseau-card" data-name="${vaisseau.name.toLowerCase()}">
                        <div class="vaisseau-header">
                            <h3 class="vaisseau-name">${vaisseau.name}</h3>
                            <span class="faction-badge faction-${vaisseau.faction.replace(' ', '-')}">${vaisseau.faction}</span>
                        </div>
                        
                        <p style="color: #ccc; font-size: 0.9em; line-height: 1.5; flex: 1; margin-bottom: 15px;">
                            ${vaisseau.description}
                        </p>

                        <div class="vaisseau-stats">
                            <div class="stat-item">
                                <span>⚡ Puis.</span>
                                <span class="stat-val">${vaisseau.power}</span>
                            </div>
                            <div class="stat-item">
                                <span>💨 Vit.</span>
                                <span class="stat-val">${vaisseau.speed}</span>
                            </div>
                            <div class="stat-item">
                                <span>🛡️ Arm.</span>
                                <span class="stat-val">${vaisseau.armor}</span>
                            </div>
                        </div>
                        
                        <div class="vaisseau-price">
                            <span>💳</span> ${String.format("%,.0f", vaisseau.price)}
                        </div>
                        
                        <a href="/projet-star-wars/detail?id=${vaisseau.id}" class="btn-primary" style="text-align: center; display: block; text-decoration: none; margin-top: 0;">
                            Voir Détails
                        </a>
                    </div>
                </c:forEach>
            </div>
        </c:if>
        
        <div class="footer">
            <p>✨ Que la Force soit avec vous ✨</p>
        </div>
    </div>
    
    <script>
        function filterVaisseaux() {
            const searchValue = document.getElementById('searchInput').value.toLowerCase();
            const cards = document.querySelectorAll('.vaisseau-card');
            
            cards.forEach(card => {
                const name = card.getAttribute('data-name');
                if (name.includes(searchValue)) {
                    card.style.display = 'flex';
                } else {
                    card.style.display = 'none';
                }
            });
        }
    </script>
    <!-- Main JS for Sith Mode -->
    <script src="/projet-star-wars/assets/js/main.js?v=2"></script>
</body>
</html>