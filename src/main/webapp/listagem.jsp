<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Listagem de Jogos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }
        .alert-sucesso {
            padding: 12px;
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            border-radius: 4px;
            margin-bottom: 20px;
            max-width: 600px;
        }
        .alert-erro {
            padding: 12px;
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            border-radius: 4px;
            margin-bottom: 20px;
            max-width: 600px;
        }
    </style>
</head>
<body>

    <%
    String msg = request.getParameter("msg");
    if ("excluido".equals(msg)) {
    %>
        <div class="alert-sucesso">
            Jogo excluído com sucesso!
        </div>
    <%
    } else if ("erro".equals(msg)) {
    %>
        <div class="alert-erro">
            Ocorreu um erro ao tentar excluir o jogo.
        </div>
    <%
    }
    %>

    <h1>Lista de Jogos</h1>

    <!-- Exemplo de link chamando a página de exclusão -->
    <!-- Na sua tabela real, substitua o '1' pelo ID do loop (ex: <%= jogo.getId() %>) -->
    <a href="excluir.jsp?id=1">Excluir Jogo ID 1</a>

</body>
</html>