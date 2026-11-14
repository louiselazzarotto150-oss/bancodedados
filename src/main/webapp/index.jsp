
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Sistema de Tarefas</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #141e30, #243b55);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: white;
            width: 90%;
            max-width: 600px;
            padding: 50px 35px;
            border-radius: 18px;
            text-align: center;
            box-shadow: 0 10px 35px rgba(0,0,0,0.3);
        }

        .icone {
            font-size: 55px;
            margin-bottom: 20px;
        }

        h1 {
            color: #243b55;
            font-size: 30px;
            margin-bottom: 15px;
        }

        p {
            color: #666;
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .botao {
            display: inline-block;
            background-color: #2563eb;
            color: white;
            padding: 15px 30px;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: 0.3s;
        }

        .botao:hover {
            background-color: #1d4ed8;
            transform: scale(1.05);
        }

        .rodape {
            margin-top: 35px;
            color: #999;
            font-size: 13px;
        }
    </style>
</head>

<body>

    <div class="container">

        <div class="icone">📋</div>

        <h1>Bem-vindo ao Sistema de Tarefas!</h1>

        <p>
            Organize suas atividades, acompanhe suas tarefas
            e controle o que já foi concluído.
            Tudo de maneira simples e rápida!
        </p>

        <a href="listagem.jsp" class="botao">
            Acessar minhas tarefas →
        </a>

        <div class="rodape">
            Sistema de Gerenciamento de Tarefas
        </div>

    </div>

</body>
</html>
