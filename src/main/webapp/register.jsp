<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription - Empire Galactique</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/theme.css?v=2">
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
                <div class="logo" style="font-size: 3rem; margin-bottom: 15px;">📝</div>
                <h1 style="margin: 0; font-size: 1.8rem; color: var(--accent-1);">Rejoindre la Galaxie</h1>
                <p class="subtitle" style="color: #888; margin-top: 5px;">Créez votre identifiant</p>
            </div>
            
            <% if ("exists".equals(request.getParameter("error"))) { %>
            <div class="error" style="background: rgba(255, 68, 68, 0.1); border: 1px solid var(--error); padding: 15px; border-radius: 8px; margin-bottom: 25px; text-align: center;">
                <strong style="color: var(--error); display: block; margin-bottom: 5px;">⚠️ Erreur</strong>
                <p style="margin: 5px 0; color: #d4d4d4; font-size: 0.9rem;">Ce nom d'utilisateur est déjà pris.</p>
            </div>
            <% } %>
            
            <form method="post" action="${pageContext.request.contextPath}/auth/register" class="login-form">
                <div class="form-group" style="margin-bottom: 20px;">
                    <label for="username" style="display: block; margin-bottom: 8px; color: var(--accent-1); font-weight: 600;">👤 Nouvel Utilisateur:</label>
                    <input type="text" id="username" name="username" placeholder="votre_pseudo" required autofocus style="width: 100%; padding: 12px; border-radius: 8px; border: 1px solid rgba(255,255,255,0.1); background: rgba(0,0,0,0.3); color: white;">
                </div>
                
                <div class="form-group" style="margin-bottom: 30px;">
                    <label for="password" style="display: block; margin-bottom: 8px; color: var(--accent-1); font-weight: 600;">🔒 Mot de passe:</label>
                    <input type="password" id="password" name="password" placeholder="••••••••" required style="width: 100%; padding: 12px; border-radius: 8px; border: 1px solid rgba(255,255,255,0.1); background: rgba(0,0,0,0.3); color: white;">
                </div>
                
                <input type="submit" value="S'inscrire" class="btn-primary" style="width: 100%; padding: 12px; font-size: 1rem; cursor: pointer;">
                <p style="text-align: center; margin-top: 15px; font-size: 0.9rem;">Déjà un compte ? <a href="login.jsp" style="color: var(--accent-1);">Se connecter</a></p>
            </form>
            
            <div class="footer" style="margin-top: 20px;">
                <a href="${pageContext.request.contextPath}/" class="btn-primary secondary" style="display: block; margin-top: 10px; width: 100%; text-align: center; text-decoration: none;">← Retour à l'accueil</a>
            </div>
            
            <script>
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
                                form.submit();
                            }
                        }
                    });
                });
            </script>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/assets/js/main.js?v=2"></script>
</body>
</html>
