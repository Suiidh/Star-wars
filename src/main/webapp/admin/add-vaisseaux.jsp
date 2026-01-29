<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un Vaisseau - Admin</title>
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
            <div class="header" style="margin-bottom: 30px; text-align: center;">
                <div class="logo">➕</div>
                <h1 class="page-title">Ajouter un Vaisseau</h1>
                <p class="subtitle" style="color: #888;">Enrichir le Catalogue Impérial</p>
            </div>
            
            <form method="post" action="vaisseaux">
                <input type="hidden" name="action" value="add">
                
                <div class="form-group" style="margin-bottom: 25px;">
                    <label for="name" style="display: block; margin-bottom: 10px; color: var(--accent-1); font-weight: bold;">🛸 Nom du Vaisseau:</label>
                    <input type="text" id="name" name="name" placeholder="Ex: X-Wing Amélioré" required style="width: 100%; padding: 12px; border-radius: 6px; border: 1px solid rgba(255,255,255,0.1); background: rgba(0,0,0,0.3); color: white;">
                </div>
                
                <div class="form-group" style="margin-bottom: 25px;">
                    <label for="description" style="display: block; margin-bottom: 10px; color: var(--accent-1); font-weight: bold;">📝 Description:</label>
                    <textarea id="description" name="description" placeholder="Décrivez les caractéristiques du vaisseau..." required style="width: 100%; padding: 12px; border-radius: 6px; border: 1px solid rgba(255,255,255,0.1); background: rgba(0,0,0,0.3); color: white; min-height: 120px; resize: vertical;"></textarea>
                </div>
                
                <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 20px; margin-bottom: 25px;">
                    <div class="form-group">
                        <label for="speed" style="display: block; margin-bottom: 10px; color: var(--accent-1); font-weight: bold;">⚡ Vitesse:</label>
                        <input type="number" id="speed" name="speed" placeholder="75" required style="width: 100%; padding: 12px; border-radius: 6px; border: 1px solid rgba(255,255,255,0.1); background: rgba(0,0,0,0.3); color: white;">
                    </div>
                    <div class="form-group">
                        <label for="power" style="display: block; margin-bottom: 10px; color: var(--accent-1); font-weight: bold;">🔥 Puissance:</label>
                        <input type="number" id="power" name="power" placeholder="75" required style="width: 100%; padding: 12px; border-radius: 6px; border: 1px solid rgba(255,255,255,0.1); background: rgba(0,0,0,0.3); color: white;">
                    </div>
                    <div class="form-group">
                        <label for="armor" style="display: block; margin-bottom: 10px; color: var(--accent-1); font-weight: bold;">🛡️ Armure:</label>
                        <input type="number" id="armor" name="armor" placeholder="75" required style="width: 100%; padding: 12px; border-radius: 6px; border: 1px solid rgba(255,255,255,0.1); background: rgba(0,0,0,0.3); color: white;">
                    </div>
                </div>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 25px;">
                    <div class="form-group">
                        <label for="type" style="display: block; margin-bottom: 10px; color: var(--accent-1); font-weight: bold;">🛠 Type:</label>
                        <select id="type" name="type" required style="width: 100%; padding: 12px; border-radius: 6px; border: 1px solid rgba(255,255,255,0.1); background: rgba(0,0,0,0.3); color: white;">
                            <option value="Chasseur">Chasseur</option>
                            <option value="Bombardier">Bombardier</option>
                            <option value="Croiseur">Croiseur</option>
                            <option value="Transport">Transport</option>
                            <option value="Générique" selected>Générique</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="faction" style="display: block; margin-bottom: 10px; color: var(--accent-1); font-weight: bold;">🏴 Faction:</label>
                        <select id="faction" name="faction" required style="width: 100%; padding: 12px; border-radius: 6px; border: 1px solid rgba(255,255,255,0.1); background: rgba(0,0,0,0.3); color: white;">
                            <option value="Rebellion">Rébellion</option>
                            <option value="Empire">Empire</option>
                            <option value="Premiere-Ordre">Premier Ordre</option>
                            <option value="Neutre" selected>Neutre</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-group" style="margin-bottom: 35px;">
                    <label for="price" style="display: block; margin-bottom: 10px; color: var(--accent-1); font-weight: bold;">💳 Prix (crédits):</label>
                    <input type="number" id="price" name="price" step="1000" placeholder="200000" min="0" required style="width: 100%; padding: 12px; border-radius: 6px; border: 1px solid rgba(255,255,255,0.1); background: rgba(0,0,0,0.3); color: white;">
                </div>
                
                <div style="display: flex; gap: 15px; justify-content: center; flex-wrap: wrap;">
                    <input type="submit" value="✅ Ajouter le Vaisseau" class="btn-primary" style="font-size: 1rem; cursor: pointer;">
                    <a href="vaisseaux" class="btn-primary secondary" style="text-decoration: none;">← Annuler</a>
                </div>
            </form>
            
        </div>
    </div>
    <!-- Main JS for Sith Mode -->
    <script src="/projet-star-wars/assets/js/main.js?v=2"></script>
</body>
</html>