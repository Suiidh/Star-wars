<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mon Profil - Star Wars</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/theme.css?v=2">
    <style>
        .profile-container { max-width: 900px; margin: 0 auto; padding: 20px; }
        .profile-header {
            background: rgba(22, 33, 62, 0.8);
            border: 1px solid var(--accent-1);
            border-radius: 12px;
            padding: 30px;
            text-align: center;
            margin-bottom: 40px;
            box-shadow: 0 0 40px rgba(0,0,0,0.5);
        }
        .profile-avatar { font-size: 4rem; margin-bottom: 15px; }
        .profile-name { font-size: 2rem; color: #fff; margin: 0; }
        .profile-role { color: var(--accent-1); font-weight: bold; text-transform: uppercase; letter-spacing: 2px; margin-top: 10px; display: inline-block; padding: 5px 15px; background: rgba(255, 215, 0, 0.1); border-radius: 20px; }
        
        .history-section {
            background: rgba(0,0,0,0.3);
            border-radius: 12px;
            padding: 30px;
        }
        .history-title { font-size: 1.5rem; color: #fff; margin-bottom: 20px; border-bottom: 1px solid rgba(255,255,255,0.1); padding-bottom: 10px; }
        
        .score-card {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: rgba(255,255,255,0.03);
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 8px;
            transition: transform 0.2s;
            border-left: 4px solid transparent;
        }
        .score-card:hover { transform: translateX(5px); background: rgba(255,255,255,0.05); }
        .score-card.perfect { border-left-color: #2ecc71; }
        .score-card.good { border-left-color: #f1c40f; }
        .score-card.bad { border-left-color: #e74c3c; }
        
        .quiz-type { font-weight: bold; color: #fff; font-size: 1.1rem; }
        .quiz-date { color: #888; font-size: 0.9rem; margin-top: 5px; }
        .quiz-score { font-size: 1.5rem; font-weight: 800; }
        .quiz-score span { font-size: 0.8rem; font-weight: normal; color: #888; }
        
        .empty-history { text-align: center; padding: 40px; color: #888; font-style: italic; }
    </style>
</head>
<body>

    <!-- NAVBAR -->
    <nav class="navbar">
        <a href="${pageContext.request.contextPath}/" class="nav-brand">
            <span class="nav-logo">🚀</span>
            <span>SW: Vaisseaux</span>
        </a>
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/" class="nav-link">Accueil</a>
            <a href="${pageContext.request.contextPath}/vaisseaux" class="nav-link">Catalogue</a>
            <a href="${pageContext.request.contextPath}/quiz" class="nav-link">Quiz</a>
             <c:if test="${not empty sessionScope.user and sessionScope.user.role == 'ADMIN'}">
                <a href="${pageContext.request.contextPath}/admin/vaisseaux" class="nav-link" style="color:var(--accent-1)">Admin</a>
            </c:if>
        </div>
        <div class="user-area">
            <c:if test="${not empty sessionScope.user}">
                <div class="user-snippet">
                    <span class="user-name">👤 ${sessionScope.user.username}</span>
                    <a href="${pageContext.request.contextPath}/auth/logout" class="logout-link">Déconnexion</a>
                </div>
            </c:if>
            <c:if test="${empty sessionScope.user}">
                <a href="${pageContext.request.contextPath}/login.jsp" class="btn-secondary" style="padding: 5px 15px; font-size: 0.85rem;">Connexion</a>
            </c:if>
        </div>
    </nav>

    <div class="main-container">
        
        <div class="profile-container">
            <div class="profile-header">
                <div class="profile-avatar">👨‍🚀</div>
                <h1 class="profile-name">${sessionScope.user.username}</h1>
                <span class="profile-role">${sessionScope.user.role}</span>
                
                <div style="margin-top: 20px; font-size: 0.9rem; color: #aaa;">
                    Membre depuis le: Aujourd'hui <!-- We could add created_at to User entity later -->
                </div>
            </div>
            
            <div class="history-section">
                <h2 class="history-title">📜 Historique des Épreuves</h2>
                
                <c:if test="${empty scores}">
                    <div class="empty-history">
                        Vous n'avez pas encore passé d'épreuve.<br>
                        <a href="quiz" style="color: var(--accent-1); margin-top: 10px; display: inline-block;">Commencer l'entraînement</a>
                    </div>
                </c:if>
                
                <c:forEach items="${scores}" var="score">
                    <c:set var="ratio" value="${score.score / score.totalQuestions}" />
                    <div class="score-card ${score.score == score.totalQuestions ? 'perfect' : (score.score >= score.totalQuestions/2 ? 'good' : 'bad')}">
                        <div>
                            <div class="quiz-type">Quiz: ${score.quizType}</div>
                            <div class="quiz-date">
                                <fmt:parseDate value="${score.playedAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate" type="both" />
                                <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy HH:mm" />
                            </div>
                        </div>
                        <div class="quiz-score" style="color: ${score.score == score.totalQuestions ? '#2ecc71' : (score.score >= score.totalQuestions/2 ? '#f1c40f' : '#e74c3c')}">
                            ${score.score} <span>/ ${score.totalQuestions}</span>
                        </div>
                    </div>
                </c:forEach>
            </div>
            
            <c:if test="${sessionScope.user.role == 'ADMIN'}">
                <div style="margin-top: 30px; text-align: center;">
                    <form action="admin/init-data" method="post" onsubmit="return confirm('Attention: Cela va réinitialiser toute la base de données des vaisseaux. Continuer ?');">
                        <button type="submit" class="btn-secondary" style="border-color: #e74c3c; color: #e74c3c;">⚠️ Forcer Réinitialisation Vaisseaux</button>
                    </form>
                </div>
            </c:if>

        </div>
        
    </div>

    <script src="${pageContext.request.contextPath}/assets/js/main.js?v=2"></script>
</body>
</html>
