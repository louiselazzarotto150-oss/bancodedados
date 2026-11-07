<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="br.com.senai.projeto.dao.JogoDAO" %>

<%
String idParam = request.getParameter("id");

// 1. Valida se o ID foi passado na requisição
if (idParam == null || idParam.trim().isEmpty()) {
    response.sendRedirect("listagem.jsp");
    return;
}

int id = 0;
try {
    id = Integer.parseInt(idParam);
} catch (NumberFormatException e) {
    // Se o ID não for um número válido, volta para a listagem
    response.sendRedirect("listagem.jsp");
    return;
}

// 2. Se a requisição for POST, executa a exclusão
if ("POST".equalsIgnoreCase(request.getMethod())) {
    try {
        JogoDAO dao = new JogoDAO();
        dao.excluir(id);

        // Redireciona de volta com o parâmetro de sucesso
        response.sendRedirect("listagem.jsp?msg=excluido");
        return;
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("listagem.jsp?msg=erro");
        return;
    }
}
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Excluir Jogo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }
        .card {
            border: 1px solid #ccc;
            padding: 20px;
            max-width: 400px;
            border-radius: 6px;
        }
        .btn-danger {
            background-color: #d9534f;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-danger:hover {
            background-color: #c9302c;
        }
        .btn-cancel {
            margin-left: 10px;
            color: #333;
            text-decoration: none;
        }
    </style>
</head>
<body>

    <div class="card">
        <h1>Excluir Jogo</h1>

        <p>Tem certeza que deseja excluir o jogo com <strong>ID <%= id %></strong>?</p>

        <form action="excluir.jsp" method="post" onsubmit="return confirm('Esta ação não poderá ser desfeita. Confirmar?');">
            <input type="hidden" name="id" value="<%= id %>">

            <button type="submit" class="btn-danger">Confirmar exclusão</button>
            <a href="listagem.jsp" class="btn-cancel">Cancelar</a>
        </form>
    </div>

</body>
</html>