<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz ${type} - Star Wars</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/theme.css?v=2">
    <style>
        .quiz-container { max-width: 800px; margin: 0 auto; padding: 20px; }
        .question-card {
            background: rgba(22, 33, 62, 0.8);
            border: 1px solid var(--glass-border);
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
        }
        .question-text { font-size: 1.2rem; margin-bottom: 20px; color: #fff; display: flex; align-items: center; gap: 10px; }
        .question-number { background: var(--accent-1); color: #000; padding: 5px 12px; border-radius: 50%; font-weight: bold; font-size: 0.9em; }
        
        .options-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; }
        .option-label {
            display: block;
            background: rgba(255,255,255,0.05);
            padding: 15px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            border: 1px solid transparent;
        }
        .option-label:hover { background: rgba(255,215,0,0.1); border-color: rgba(255,215,0,0.3); }
        .option-input { margin-right: 10px; transform: scale(1.2); }
        
        @media (max-width: 600px) { .options-grid { grid-template-columns: 1fr; } }
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
        <div class="header" style="text-align: center; margin-bottom: 40px;">
            <h1>Épreuve : ${type}</h1>
            <p class="subtitle">Répondez aux questions pour prouver votre valeur.</p>
        </div>
        
        <form action="quiz" method="post" class="quiz-container">
            <input type="hidden" name="type" value="${type}">
            
            <c:forEach items="${questions}" var="q" varStatus="status">
                <div class="question-card">
                    <div class="question-text">
                        <span class="question-number">${status.count}</span>
                        ${q.text}
                    </div>
                    
                    <div class="options-grid">
                        <label class="option-label">
                            <input type="radio" name="q${q.id}" value="A" class="option-input" required> 
                            ${q.choiceA}
                        </label>
                        <label class="option-label">
                            <input type="radio" name="q${q.id}" value="B" class="option-input"> 
                            ${q.choiceB}
                        </label>
                        <label class="option-label">
                            <input type="radio" name="q${q.id}" value="C" class="option-input"> 
                            ${q.choiceC}
                        </label>
                        <label class="option-label">
                            <input type="radio" name="q${q.id}" value="D" class="option-input"> 
                            ${q.choiceD}
                        </label>
                    </div>
                </div>
            </c:forEach>
            
            <div style="text-align: center; margin-top: 30px;">
                <button type="submit" class="btn-primary" style="padding: 15px 40px; font-size: 1.2rem;">Valider mes Réponses</button>
            </div>
        </form>
    </div>

    <script src="${pageContext.request.contextPath}/assets/js/main.js?v=2"></script>
</body>
</html>
