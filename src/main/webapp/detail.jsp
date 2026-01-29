<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Détails - ${vaisseau.name}</title>
    <link rel="stylesheet" href="/projet-star-wars/assets/css/theme.css?v=2">
    <style>
        .detail-info { margin: 30px 0; }
        .detail-info h3 { color: #fff; margin-bottom: 10px; font-size: 1.2em; }
        .detail-info p { color: #bdc3c7; line-height: 1.6; font-size: 1.05em; }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 20px;
            margin: 30px 0;
        }
        
        .stat-box {
            background: rgba(255, 215, 0, 0.05);
            border: 1px solid rgba(255, 215, 0, 0.3);
            border-radius: 10px;
            padding: 20px;
            text-align: center;
        }
        
        .stat-label { color: var(--accent-1); font-size: 0.9em; text-transform: uppercase; margin-bottom: 10px; }
        .stat-value { color: #fff; font-size: 2em; font-weight: bold; }
        
        .progress-bar {
            width: 100%; height: 8px; background: rgba(255, 255, 255, 0.1);
            border-radius: 5px; overflow: hidden; margin-top: 8px;
        }
        
        .progress-fill {
            height: 100%; background: linear-gradient(90deg, var(--accent-1), var(--accent-2));
            border-radius: 5px; transition: width 0.3s;
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
            <div style="text-align: center; margin-bottom: 30px;">
                <h1 class="page-title" style="font-size: 3.5rem;">${vaisseau.name}</h1>
                <span class="faction-badge faction-${vaisseau.faction.replace(' ', '-')}">${vaisseau.faction}</span>
            </div>
            
            <div class="detail-info">
                <h3>Type</h3>
                <p>🚀 ${vaisseau.type}</p>
            </div>
            
            <div class="detail-info">
                <h3>Description</h3>
                <p>${vaisseau.description}</p>
            </div>
            
            <div class="stats-grid">
                <div class="stat-box">
                    <div class="stat-label">⚡ Puissance</div>
                    <div class="stat-value">${vaisseau.power}</div>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width: ${vaisseau.power}%"></div>
                    </div>
                </div>
                
                <div class="stat-box">
                    <div class="stat-label">💨 Vitesse</div>
                    <div class="stat-value">${vaisseau.speed}</div>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width: ${vaisseau.speed}%"></div>
                    </div>
                </div>
                
                <div class="stat-box">
                    <div class="stat-label">🛡️ Armure</div>
                    <div class="stat-value">${vaisseau.armor}</div>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width: ${vaisseau.armor}%"></div>
                    </div>
                </div>
            </div>
            
            <div style="background: rgba(0,0,0,0.3); padding: 20px; border-radius: 12px; text-align: center; margin: 30px 0; border: 1px solid var(--accent-1);">
                <div style="color: #bbb; margin-bottom: 5px;">Coût d'acquisition</div>
                <div style="font-size: 2.5rem; color: var(--accent-1); font-weight: 800; text-shadow: 0 0 10px rgba(255,215,0,0.3);">
                    ${String.format("%,.0f", vaisseau.price)} <span style="font-size: 1rem;">crédits</span>
                </div>
            </div>
            
            <div style="display: flex; gap: 15px; justify-content: center; flex-wrap: wrap;">
                <a href="/projet-star-wars/vaisseaux" class="btn-primary secondary">← Retour au catalogue</a>
                <c:if test="${not empty pageContext.request.userPrincipal}">
                    <a href="/projet-star-wars/admin/vaisseaux" class="btn-primary">🛠️ Modifier (Admin)</a>
                </c:if>
            </div>
        </div>
    </div>
    <!-- Main JS for Sith Mode -->
    <script src="/projet-star-wars/assets/js/main.js?v=2"></script>
</body>
</html>
