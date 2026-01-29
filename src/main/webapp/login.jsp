<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion - Star Wars Vaisseaux</title>
    <link rel="stylesheet" href="/projet-star-wars/assets/css/theme.css?v=2">
    <style>
        .login-card {
            max-width: 450px;
            margin: 0 auto;
            background: rgba(22, 33, 62, 0.8);
            border: 1px solid var(--glass-border);
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
            backdrop-filter: blur(10px);
        }
    </style>
</head>
<body>
    <div class="main-container" style="min-height: 100vh; display: flex; align-items: center; justify-content: center; padding: 20px;">
        <div class="login-card">
            <div class="header" style="text-align: center; margin-bottom: 30px;">
                <div class="logo" style="font-size: 3rem; margin-bottom: 15px;">🚀</div>
                <h1 style="margin: 0; font-size: 1.8rem; color: var(--accent-1);">Star Wars Vaisseaux</h1>
                <p class="subtitle" style="color: #888; margin-top: 5px;">Portail d'Administration</p>
            </div>
            
            <div class="content">
                <p style="margin-bottom: 30px; color: #d4d4d4; text-align: center; font-size: 0.95rem;">Connectez-vous avec vos identifiants pour accéder à la zone d'administration.</p>
            </div>
            
            <form method="post" action="j_security_check" class="login-form">
                <div class="form-group" style="margin-bottom: 20px;">
                    <label for="j_username" style="display: block; margin-bottom: 8px; color: var(--accent-1); font-weight: 600;">👤 Utilisateur:</label>
                    <input type="text" id="j_username" name="j_username" placeholder="admin" required autofocus style="width: 100%; padding: 12px; border-radius: 8px; border: 1px solid rgba(255,255,255,0.1); background: rgba(0,0,0,0.3); color: white;">
                </div>
                
                <div class="form-group" style="margin-bottom: 30px;">
                    <label for="j_password" style="display: block; margin-bottom: 8px; color: var(--accent-1); font-weight: 600;">🔒 Mot de passe:</label>
                    <input type="password" id="j_password" name="j_password" placeholder="••••••••" required style="width: 100%; padding: 12px; border-radius: 8px; border: 1px solid rgba(255,255,255,0.1); background: rgba(0,0,0,0.3); color: white;">
                </div>
                
                <input type="submit" value="Se connecter" class="btn-primary" style="width: 100%; padding: 12px; font-size: 1rem; cursor: pointer;">
            </form>
            
            <div class="footer" style="margin-top: 40px; padding-top: 20px; border-top: 1px solid rgba(255,215,0,0.1);">
                <p style="font-size: 0.85rem; color: #888; margin-bottom: 10px; text-align: center;">Identifiants de test</p>
                <div style="background: rgba(255,215,0,0.05); padding: 15px; border-radius: 8px; border: 1px solid rgba(255,215,0,0.1); text-align: center;">
                    <p style="margin: 5px 0; color: #d4d4d4; font-size: 0.9rem;">Utilisateur: <span id="user" style="color: #aaa; font-family: monospace;">••••••••</span></p>
                    <p style="margin: 5px 0; color: #d4d4d4; font-size: 0.9rem;">Mot de passe: <span id="pass" style="color: #aaa; font-family: monospace;">••••••••</span></p>
                    <button type="button" onclick="toggleCreds()" style="margin-top: 10px; padding: 6px 12px; background: rgba(255,215,0,0.1); border: 1px solid var(--accent-1); color: var(--accent-1); border-radius: 4px; cursor: pointer; font-size: 0.8rem; transition: all 0.2s;">👁️ Afficher</button>
                </div>
                <a href="/projet-star-wars/" class="btn-primary secondary" style="display: block; margin-top: 20px; width: 100%; text-align: center; text-decoration: none;">← Retour à l'accueil</a>
            </div>
            <script>
                // Toggle Credentials Display
                let shown = false;
                function toggleCreds() {
                    const userEl = document.getElementById('user');
                    const passEl = document.getElementById('pass');
                    const btn = event.target;
                    if (!shown) {
                        userEl.textContent = 'admin';
                        passEl.textContent = 'admin123';
                        btn.textContent = '🙈 Masquer';
                        btn.style.background = 'rgba(255,215,0,0.2)';
                        shown = true;
                    } else {
                        userEl.textContent = '••••••••';
                        passEl.textContent = '••••••••';
                        btn.textContent = '👁️ Afficher';
                        btn.style.background = 'rgba(255,215,0,0.1)';
                        shown = false;
                    }
                }

                // Force Enter key submission
                document.addEventListener("DOMContentLoaded", function() {
                    const form = document.querySelector('.login-form');
                    if (!form) return;

                    form.addEventListener('keydown', function(e) {
                        if (e.key === 'Enter') {
                            e.preventDefault(); 
                            const submitBtn = form.querySelector('input[type="submit"]');
                            if (submitBtn) {
                                submitBtn.click();
                            } else {
                                form.submit(); // Fallback
                            }
                        }
                    });
                });
            </script>
        </div>
    </div>
    <!-- Main JS for Sith Mode -->
    <script src="/projet-star-wars/assets/js/main.js?v=2"></script>
</body>
</html>