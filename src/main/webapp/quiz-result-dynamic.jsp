<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Résultat Quiz - Star Wars</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/theme.css?v=2">
    <style>
        .result-card {
            text-align: center;
            padding: 40px;
            background: rgba(22, 33, 62, 0.9);
            border-radius: 15px;
            max-width: 600px;
            margin: 0 auto 30px auto;
            border: 1px solid var(--accent-1);
            box-shadow: 0 0 30px rgba(255, 215, 0, 0.1);
        }
        .score-display { font-size: 4em; font-weight: 800; color: var(--accent-1); margin: 20px 0; }
        .correction-card {
            background: rgba(0,0,0,0.3);
            border-left: 4px solid #888;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 0 8px 8px 0;
        }
        .correction-card.correct { border-left-color: #2ecc71; background: rgba(46, 204, 113, 0.05); }
        .correction-card.wrong { border-left-color: #e74c3c; background: rgba(231, 76, 60, 0.05); }
        
        .user-answer { font-weight: bold; }
        .user-answer.correct { color: #2ecc71; }
        .user-answer.wrong { color: #e74c3c; }
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
            <a href="${pageContext.request.contextPath}/quiz" class="nav-link active">Quiz</a>
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
        
        <div class="result-card">
            <h1>Résultat de l'Épreuve</h1>
            <div class="score-display">${score} / ${total}</div>
            
            <c:choose>
                <c:when test="${score == total}">
                    <p style="color: #2ecc71; font-size: 1.2rem;">🌟 Excellent ! La Force est puissante en vous.</p>
                </c:when>
                <c:when test="${score >= total/2}">
                    <p style="color: #f1c40f; font-size: 1.2rem;">Bien joué, mais vous pouvez encore progresser.</p>
                </c:when>
                <c:otherwise>
                    <p style="color: #e74c3c; font-size: 1.2rem;">L'échec est le plus grand des maîtres. Réessayez.</p>
                </c:otherwise>
            </c:choose>
            
            <div style="margin-top: 20px;">
                <a href="quiz" class="btn-primary secondary">Autre Quiz</a>
                <c:if test="${not empty sessionScope.user}">
                    <a href="profile" class="btn-primary" style="display:none">Voir mon Profil</a> 
                    <!-- We'll implement profile later -->
                </c:if>
            </div>
        </div>

        <h2 style="text-align: center; margin-bottom: 30px;">Correction Détaillée</h2>
        
        <div style="max-width: 800px; margin: 0 auto;">
            <c:forEach items="${questions}" var="q">
                <c:set var="qid" value="q${q.id}" />
                <c:set var="userAns" value="${userAnswers[qid]}" />
                <c:set var="correctAns" value="${correctAnswers[qid]}" />
                <c:set var="isCorrect" value="${userAns eq correctAns}" />
                
                <div class="correction-card ${isCorrect ? 'correct' : 'wrong'}">
                    <h3 style="margin-top:0;">Quest. ${q.id}: ${q.text}</h3>
                    
                    <p>Votre réponse: 
                        <span class="user-answer ${isCorrect ? 'correct' : 'wrong'}">
                            ${userAns}
                        </span>
                    </p>
                    
                    <c:if test="${!isCorrect}">
                        <p style="color: #2ecc71;">Bonne réponse: <strong>${correctAns}</strong></p>
                    </c:if>
                    
                    <p style="font-style: italic; color: #ccc; margin-top: 10px;">
                        ℹ️ ${explanations[qid]}
                    </p>
                </div>
            </c:forEach>
        </div>
        
    </div>

    <script src="${pageContext.request.contextPath}/assets/js/main.js?v=2"></script>
</body>
</html>
