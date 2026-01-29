<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Erreur - Star Wars</title>
    <link rel="stylesheet" href="/projet-star-wars/assets/css/theme.css?v=2">
    <style>
        .error-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
        }
        .error-box {
            text-align: center;
            padding: 40px;
            background: rgba(0, 0, 0, 0.3);
            border-radius: 15px;
            border: 2px solid #ffd700;
            box-shadow: 0 0 20px rgba(255, 215, 0, 0.3);
        }
        .error-box h1 {
            color: #ff6b6b;
            font-size: 2.5em;
            margin-bottom: 20px;
            text-shadow: 0 0 10px rgba(255, 107, 107, 0.5);
        }
        .error-box p {
            color: #fff;
            font-size: 1.2em;
            margin-bottom: 30px;
        }
        .back-button {
            display: inline-block;
            padding: 12px 30px;
            background: linear-gradient(135deg, #ffd700, #ffed4e);
            color: #000;
            text-decoration: none;
            border-radius: 25px;
            font-weight: bold;
            transition: all 0.3s;
        }
        .back-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 20px rgba(255, 215, 0, 0.4);
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-box">
            <h1>⚠️ Erreur</h1>
            <p><%= request.getAttribute("error") != null ? request.getAttribute("error") : "Une erreur est survenue" %></p>
            <a href="/projet-star-wars/" class="back-button">Retour à l'accueil</a>
        </div>
    </div>
</body>
</html>
