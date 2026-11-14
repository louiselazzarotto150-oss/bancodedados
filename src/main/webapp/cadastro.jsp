
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="br.com.senai.projeto.model.Tarefa" %>
<%@ page import="br.com.senai.projeto.dao.TarefaDAO" %>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {

    String titulo = request.getParameter("titulo");
    boolean concluida = Boolean.parseBoolean(
        request.getParameter("concluida")
    );

    Tarefa tarefa = new Tarefa();
    tarefa.setTitulo(titulo);
    tarefa.setConcluida(concluida);

    TarefaDAO dao = new TarefaDAO();
    dao.cadastrar(tarefa);

    response.sendRedirect("listagem.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Cadastrar Tarefa</title>

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
            margin-bottom: 30px;
            font-size: 14px;
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

        .botoes {
            display: flex;
            gap: 12px;
            margin-top: 10px;
        }

        button {
            flex: 1;
            background: #2563eb;
            color: white;
            border: none;
            padding: 14px;
            border-radius: 8px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background: #1d4ed8;
            transform: scale(1.03);
        }

        .cancelar {
            flex: 1;
            text-align: center;
            background: #e5e7eb;
            color: #333;
            padding: 14px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            font-size: 15px;
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

        <div class="icone">📝</div>

        <h1>Nova Tarefa</h1>

        <p class="subtitulo">
            Preencha os campos abaixo para cadastrar uma nova tarefa.
        </p>

        <form action="cadastro.jsp" method="post">

            <label for="titulo">Título da tarefa:</label>

            <input
                type="text"
                id="titulo"
                name="titulo"
                placeholder="Digite o título da tarefa..."
                maxlength="150"
                required
            >

            <label for="concluida">Status da tarefa:</label>

            <select id="concluida" name="concluida">
                <option value="false">⏳ Pendente</option>
                <option value="true">✓ Concluída</option>
            </select>

            <div class="botoes">

                <button type="submit">
                    + Cadastrar tarefa
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
