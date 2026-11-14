
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="br.com.senai.projeto.model.Tarefa" %>
<%@ page import="br.com.senai.projeto.dao.TarefaDAO" %>

<%
TarefaDAO dao = new TarefaDAO();

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

    String titulo = request.getParameter("titulo");
    boolean concluida = Boolean.parseBoolean(
        request.getParameter("concluida")
    );

    Tarefa tarefaAtualizada = new Tarefa();

    tarefaAtualizada.setId(id);
    tarefaAtualizada.setTitulo(titulo);
    tarefaAtualizada.setConcluida(concluida);

    boolean atualizado = dao.atualizar(tarefaAtualizada);

    if (atualizado) {
        response.sendRedirect("listagem.jsp?msg=atualizado");
    } else {
        response.sendRedirect("editar.jsp?id=" + id + "&msg=erro");
    }

    return;
}

Tarefa tarefa = dao.buscarPorId(id);

if (tarefa == null) {
    response.sendRedirect("listagem.jsp");
    return;
}

String msg = request.getParameter("msg");
%>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Editar Tarefa</title>

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
            max-width: 500px;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 10px 35px rgba(0,0,0,0.3);
        }

        .icone {
            text-align: center;
            font-size: 50px;
            margin-bottom: 15px;
        }

        h1 {
            text-align: center;
            color: #243b55;
            margin-bottom: 10px;
        }

        .subtitulo {
            text-align: center;
            color: #777;
            font-size: 14px;
            margin-bottom: 30px;
        }

        .identificacao {
            background: #f1f5f9;
            color: #243b55;
            padding: 12px;
            border-radius: 8px;
            text-align: center;
            font-weight: bold;
            margin-bottom: 25px;
        }

        label {
            display: block;
            color: #333;
            font-weight: bold;
            margin-bottom: 8px;
        }

        input, select {
            width: 100%;
            padding: 13px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            margin-bottom: 22px;
            outline: none;
            transition: 0.3s;
        }

        input:focus, select:focus {
            border-color: #2563eb;
            box-shadow: 0 0 5px rgba(37,99,235,0.3);
        }

        .alert-erro {
            background: #fee2e2;
            color: #991b1b;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
        }

        .botoes {
            display: flex;
            gap: 12px;
            margin-top: 10px;
        }

        .salvar {
            flex: 1;
            background: #2563eb;
            color: white;
            border: none;
            padding: 14px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .salvar:hover {
            background: #1d4ed8;
            transform: scale(1.03);
        }

        .cancelar {
            flex: 1;
            background: #e5e7eb;
            color: #333;
            padding: 14px;
            border-radius: 8px;
            text-align: center;
            text-decoration: none;
            font-weight: bold;
            font-size: 14px;
            transition: 0.3s;
        }

        .cancelar:hover {
            background: #d1d5db;
        }

        .rodape {
            text-align: center;
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

        <div class="icone">✏️</div>

        <h1>Editar Tarefa</h1>

        <p class="subtitulo">
            Altere as informações da sua tarefa.
        </p>

        <div class="identificacao">
            Tarefa ID: <%= tarefa.getId() %>
        </div>

        <% if ("erro".equals(msg)) { %>

            <div class="alert-erro">
                Não foi possível atualizar a tarefa. Tente novamente.
            </div>

        <% } %>

        <form action="editar.jsp" method="post">

            <input type="hidden"
                   name="id"
                   value="<%= tarefa.getId() %>">

            <label for="titulo">Título da tarefa:</label>

            <input
                type="text"
                id="titulo"
                name="titulo"
                value="<%= tarefa.getTitulo() %>"
                maxlength="150"
                placeholder="Digite o título da tarefa..."
                required
            >

            <label for="concluida">Status da tarefa:</label>

            <select id="concluida" name="concluida">

                <option value="false"
                    <%= !tarefa.isConcluida() ? "selected" : "" %>>
                    ⏳ Pendente
                </option>

                <option value="true"
                    <%= tarefa.isConcluida() ? "selected" : "" %>>
                    ✓ Concluída
                </option>

            </select>

            <div class="botoes">

                <button type="submit" class="salvar">
                    ✓ Salvar alterações
                </button>

                <a href="listagem.jsp" class="cancelar">
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
