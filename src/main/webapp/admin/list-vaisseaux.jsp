<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Vaisseaux - Admin</title>
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
            <a href="/projet-star-wars/quiz" class="nav-link">Quiz</a>
            <a href="/projet-star-wars/admin/vaisseaux" class="nav-link active" style="color:var(--accent-1)">Admin</a>
        </div>
        
        <div class="user-area">
             <div class="user-snippet">
                <span class="user-name">👤 ${pageContext.request.userPrincipal.name}</span>
                <a href="/projet-star-wars/logout" class="logout-link">Déconnexion</a>
            </div>
        </div>
    </nav>

    <div class="main-container">
        <div class="detail-card-lg">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; flex-wrap: wrap; gap: 15px;">
                <h1 class="page-title" style="margin: 0; text-align: left;">⚔️ Gestion des Vaisseaux</h1>
                <a href="?action=add" class="btn-primary">➕ Ajouter un vaisseau</a>
            </div>
            
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px; margin-bottom: 30px;">
                <div style="background: rgba(255, 215, 0, 0.05); border: 1px solid rgba(255, 215, 0, 0.2); padding: 20px; border-radius: 8px; text-align: center;">
                    <div style="font-size: 2em; font-weight: bold; color: var(--accent-1);">${totalVaisseaux}</div>
                    <div style="color: #888; text-transform: uppercase; font-size: 0.8rem; letter-spacing: 1px;">Vaisseaux Total</div>
                </div>
                <div style="background: rgba(255, 215, 0, 0.05); border: 1px solid rgba(255, 215, 0, 0.2); padding: 20px; border-radius: 8px; text-align: center;">
                    <div style="font-size: 2em; font-weight: bold; color: var(--accent-1);">${totalVaisseaux > 0 ? 'Actif' : 'Vide'}</div>
                    <div style="color: #888; text-transform: uppercase; font-size: 0.8rem; letter-spacing: 1px;">État du Catalogue</div>
                </div>
            </div>
        
            <c:if test="${empty vaisseaux}">
                <div style="text-align: center; padding: 40px; color: #888;">
                    <p style="font-size: 1.1rem; margin-bottom: 20px;">Aucun vaisseau dans le catalogue</p>
                    <a href="?action=add" class="btn-primary">Ajouter le premier vaisseau</a>
                </div>
            </c:if>
            
            <c:if test="${not empty vaisseaux}">
                <div style="overflow-x: auto;">
                    <table style="width: 100%; border-collapse: collapse; margin-top: 20px;">
                        <thead>
                            <tr style="border-bottom: 2px solid rgba(255,255,255,0.1); text-align: left;">
                                <th style="padding: 15px; color: #888;">ID</th>
                                <th style="padding: 15px; color: #888;">Nom</th>
                                <th style="padding: 15px; color: #888;">Vitesse</th>
                                <th style="padding: 15px; color: #888;">Prix</th>
                                <th style="padding: 15px; text-align: right; color: #888;">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="vaisseau" items="${vaisseaux}">
                                <tr style="border-bottom: 1px solid rgba(255,255,255,0.05);">
                                    <td style="padding: 15px;"><strong>${vaisseau.id}</strong></td>
                                    <td style="padding: 15px; font-weight: bold; color: var(--accent-1);">🛸 ${vaisseau.name}</td>
                                    <td style="padding: 15px;">${vaisseau.speed}</td>
                                    <td style="padding: 15px; color: var(--accent-2); font-weight: bold;">${vaisseau.price} cr</td>
                                    <td style="padding: 15px; text-align: right;">
                                        <div style="display: inline-flex; gap: 10px;">
                                            <a href="?action=edit&id=${vaisseau.id}" style="color: #3498db; text-decoration: none; padding: 5px 10px; border: 1px solid rgba(52, 152, 219, 0.3); border-radius: 4px; font-size: 0.9rem;">✏️</a>
                                            <a href="?action=delete&id=${vaisseau.id}" onclick="return confirm('Êtes-vous sûr?');" style="color: #ff6b6b; text-decoration: none; padding: 5px 10px; border: 1px solid rgba(255, 107, 107, 0.3); border-radius: 4px; font-size: 0.9rem;">🗑️</a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
            
             <div style="margin-top: 40px; text-align: center;">
                <a href="../" class="btn-primary secondary">← Retour à l'accueil</a>
            </div>
        </div>
    </div>
    <!-- Main JS for Sith Mode -->
    <script src="/projet-star-wars/assets/js/main.js?v=2"></script>
</body>
</html>