
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="br.com.senai.projeto.dao.TarefaDAO" %>

<%
String idParam = request.getParameter("id");

if (idParam == null || idParam.trim().isEmpty()) {
    response.sendRedirect("listagem.jsp");
    return;
}

int id;

try {
    id = Integer.parseInt(idParam);
} catch (NumberFormatException e) {
    response.sendRedirect("listagem.jsp");
    return;
}

if ("POST".equalsIgnoreCase(request.getMethod())) {

    TarefaDAO dao = new TarefaDAO();

    boolean excluido = dao.excluir(id);

    if (excluido) {
        response.sendRedirect("listagem.jsp?msg=excluido");
    } else {
        response.sendRedirect("listagem.jsp?msg=erro");
    }

    return;
}
%>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Excluir Tarefa</title>

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
            padding: 20px;
        }

        .container {
            background: white;
            width: 100%;
            max-width: 480px;
            padding: 40px;
            border-radius: 16px;
            text-align: center;
            box-shadow: 0 10px 35px rgba(0,0,0,0.3);
        }

        .icone {
            font-size: 65px;
            margin-bottom: 20px;
        }

        h1 {
            color: #243b55;
            margin-bottom: 15px;
            font-size: 28px;
        }

        .descricao {
            color: #666;
            line-height: 1.7;
            font-size: 15px;
            margin-bottom: 20px;
        }

        .id {
            display: inline-block;
            background: #f1f5f9;
            color: #243b55;
            padding: 8px 15px;
            border-radius: 8px;
            font-weight: bold;
            margin-bottom: 25px;
        }

        .aviso {
            background: #fee2e2;
            color: #991b1b;
            padding: 12px;
            border-radius: 8px;
            font-size: 13px;
            margin-bottom: 25px;
        }

        .botoes {
            display: flex;
            gap: 12px;
        }

        .btn-danger {
            flex: 1;
            background: #dc2626;
            color: white;
            border: none;
            padding: 14px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn-danger:hover {
            background: #b91c1c;
            transform: scale(1.03);
        }

        .btn-cancel {
            flex: 1;
            background: #e5e7eb;
            color: #333;
            padding: 14px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            font-size: 14px;
            transition: 0.3s;
        }

        .btn-cancel:hover {
            background: #d1d5db;
        }

        .rodape {
            margin-top: 25px;
            color: #999;
            font-size: 12px;
        }

        @media (max-width: 450px) {
            .container {
                padding: 25px;
            }

            .botoes {
                flex-direction: column;
            }
        }
    </style>

</head>

<body>

    <div class="container">

        <div class="icone">⚠️</div>

        <h1>Excluir Tarefa?</h1>

        <p class="descricao">
            Você está prestes a excluir uma tarefa do sistema.
            Tem certeza de que deseja continuar?
        </p>

        <div class="id">
            Tarefa ID: <%= id %>
        </div>

        <div class="aviso">
            Atenção! Essa ação não poderá ser desfeita.
        </div>

        <form action="excluir.jsp" method="post"
              onsubmit="return confirm('Tem certeza que deseja excluir esta tarefa permanentemente?');">

            <input type="hidden" name="id" value="<%= id %>">

            <div class="botoes">

                <button type="submit" class="btn-danger">
                    🗑 Confirmar exclusão
                </button>

                <a href="listagem.jsp" class="btn-cancel">
                    Cancelar
                </a>

            </div>

        </form>

        <div class="rodape">
            Sistema de Gerenciamento de Tarefas
        </div>

    </div>

</body>
</html>
