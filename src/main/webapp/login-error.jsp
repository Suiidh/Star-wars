<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Erreur de Connexion</title>
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
                <div class="logo" style="font-size: 3rem; margin-bottom: 15px;">⚠️</div>
                <h1 style="margin: 0; font-size: 1.8rem; color: var(--error);">Erreur de Connexion</h1>
                <p class="subtitle" style="color: #888; margin-top: 5px;">Accès Refusé</p>
            </div>
            
            <div class="error" style="background: rgba(255, 68, 68, 0.1); border: 1px solid var(--error); padding: 15px; border-radius: 8px; margin-bottom: 25px; text-align: center;">
                <strong style="color: var(--error); display: block; margin-bottom: 5px;">❌ Identifiants Invalides</strong>
                <p style="margin: 5px 0; color: #d4d4d4; font-size: 0.9rem;">Le nom d'utilisateur ou le mot de passe est incorrect.</p>
            </div>
            
            <form method="post" action="${pageContext.request.contextPath}/auth/login" class="login-form">
                <div class="form-group" style="margin-bottom: 20px;">
                    <label for="username" style="display: block; margin-bottom: 8px; color: var(--accent-1); font-weight: 600;">👤 Utilisateur:</label>
                    <input type="text" id="username" name="username" placeholder="admin" required autofocus style="width: 100%; padding: 12px; border-radius: 8px; border: 1px solid rgba(255,255,255,0.1); background: rgba(0,0,0,0.3); color: white;">
                </div>
                
                <div class="form-group" style="margin-bottom: 30px;">
                    <label for="password" style="display: block; margin-bottom: 8px; color: var(--accent-1); font-weight: 600;">🔒 Mot de passe:</label>
                    <input type="password" id="password" name="password" placeholder="••••••••" required style="width: 100%; padding: 12px; border-radius: 8px; border: 1px solid rgba(255,255,255,0.1); background: rgba(0,0,0,0.3); color: white;">
                </div>
                
                <input type="submit" value="Réessayer" class="btn-primary" style="width: 100%; padding: 12px; font-size: 1rem; cursor: pointer;">
            </form>
            
            <div class="footer" style="margin-top: 40px; padding-top: 20px; border-top: 1px solid rgba(255,215,0,0.1);">
                <div style="background: rgba(81,207,102,0.1); padding: 15px; border-radius: 8px; border: 1px solid rgba(81,207,102,0.3); margin-bottom: 15px; text-align: center;">
                    <p style="color: #51cf66; margin: 5px 0; font-size: 0.9rem;"><strong>Identifiants de test:</strong></p>
                    <p style="color: #d4d4d4; margin: 5px 0; font-size: 0.9rem;">Utilisateur: <span id="user2" style="color: #aaa; font-family: monospace;">••••••••</span></p>
                    <p style="color: #d4d4d4; margin: 5px 0; font-size: 0.9rem;">Mot de passe: <span id="pass2" style="color: #aaa; font-family: monospace;">••••••••</span></p>
                    <button type="button" onclick="toggleCreds2()" style="margin-top: 10px; padding: 6px 12px; background: rgba(81,207,102,0.15); border: 1px solid #51cf66; color: #51cf66; border-radius: 4px; cursor: pointer; font-size: 0.8rem; transition: all 0.2s;">👁️ Afficher</button>
                </div>
                <a href="/projet-star-wars/" class="btn-primary secondary" style="display: block; margin-top: 15px; width: 100%; text-align: center; text-decoration: none;">← Retour à l'accueil</a>
            </div>
            <script>
                let shown2 = false;
                function toggleCreds2() {
                    const userEl = document.getElementById('user2');
                    const passEl = document.getElementById('pass2');
                    const btn = event.target;
                    if (!shown2) {
                        userEl.textContent = 'admin';
                        passEl.textContent = 'admin123';
                        btn.textContent = '🙈 Masquer';
                        btn.style.background = 'rgba(81,207,102,0.25)';
                        shown2 = true;
                    } else {
                        userEl.textContent = '••••••••';
                        passEl.textContent = '••••••••';
                        btn.textContent = '👁️ Afficher';
                        btn.style.background = 'rgba(81,207,102,0.15)';
                        shown2 = false;
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