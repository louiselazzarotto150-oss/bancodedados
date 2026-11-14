
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="br.com.senai.projeto.model.Tarefa" %>
<%@ page import="br.com.senai.projeto.dao.TarefaDAO" %>

<%
TarefaDAO dao = new TarefaDAO();
List<Tarefa> tarefas = dao.listar();

String msg = request.getParameter("msg");
%>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Minhas Tarefas</title>

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
            padding: 40px 20px;
        }

        .container {
            max-width: 1100px;
            margin: auto;
            background: white;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 10px 35px rgba(0,0,0,0.3);
        }

        .topo {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 30px;
        }

        h1 {
            color: #243b55;
            font-size: 30px;
        }

        .subtitulo {
            color: #777;
            margin-top: 8px;
        }

        .novo {
            background: #2563eb;
            color: white;
            padding: 13px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }

        .novo:hover {
            background: #1d4ed8;
            transform: scale(1.04);
        }

        .alert-sucesso {
            background: #d1fae5;
            color: #065f46;
            padding: 14px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .alert-erro {
            background: #fee2e2;
            color: #991b1b;
            padding: 14px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .tabela-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }

        th {
            background: #243b55;
            color: white;
            padding: 16px;
            text-align: center;
        }

        td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #eee;
            color: #444;
        }

        tr:hover td {
            background: #f3f6fa;
        }

        .status {
            padding: 7px 13px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: bold;
            display: inline-block;
        }

        .pendente {
            background: #fef3c7;
            color: #92400e;
        }

        .concluida {
            background: #d1fae5;
            color: #065f46;
        }

        .btn {
            display: inline-block;
            padding: 8px 13px;
            text-decoration: none;
            border-radius: 6px;
            color: white;
            font-size: 13px;
            font-weight: bold;
            margin: 3px;
            transition: 0.2s;
        }

        .editar {
            background: #2563eb;
        }

        .editar:hover {
            background: #1d4ed8;
        }

        .excluir {
            background: #dc2626;
        }

        .excluir:hover {
            background: #b91c1c;
        }

        .vazio {
            padding: 30px;
            color: #888;
            font-size: 16px;
        }

        .rodape {
            text-align: center;
            margin-top: 25px;
            color: #999;
            font-size: 13px;
        }

        .voltar {
            display: inline-block;
            margin-top: 20px;
            color: #2563eb;
            text-decoration: none;
            font-weight: bold;
        }

        @media (max-width: 600px) {
            .container {
                padding: 20px 12px;
            }

            h1 {
                font-size: 23px;
            }

            .topo {
                flex-direction: column;
                align-items: flex-start;
            }
        }
    </style>

</head>

<body>

    <div class="container">

        <div class="topo">

            <div>
                <h1>📋 Minhas Tarefas</h1>
                <p class="subtitulo">
                    Organize suas atividades e acompanhe seu progresso.
                </p>
            </div>

            <a href="cadastro.jsp" class="novo">
                + Nova Tarefa
            </a>

        </div>

        <% if ("excluido".equals(msg)) { %>

            <div class="alert-sucesso">
                ✓ Tarefa excluída com sucesso!
            </div>

        <% } else if ("atualizado".equals(msg)) { %>

            <div class="alert-sucesso">
                ✓ Tarefa atualizada com sucesso!
            </div>

        <% } else if ("erro".equals(msg)) { %>

            <div class="alert-erro">
                ✕ Ocorreu um erro ao realizar a operação.
            </div>

        <% } %>

        <div class="tabela-container">

            <table>

                <tr>
                    <th>ID</th>
                    <th>Título</th>
                    <th>Status</th>
                    <th>Ações</th>
                </tr>

                <% for (Tarefa tarefa : tarefas) { %>

                <tr>

                    <td><%= tarefa.getId() %></td>

                    <td><%= tarefa.getTitulo() %></td>

                    <td>
                        <% if (tarefa.isConcluida()) { %>
                            <span class="status concluida">
                                ✓ Concluída
                            </span>
                        <% } else { %>
                            <span class="status pendente">
                                ◷ Pendente
                            </span>
                        <% } %>
                    </td>

                    <td>

                        <a href="editar.jsp?id=<%= tarefa.getId() %>"
                           class="btn editar">
                            ✎ Editar
                        </a>

                        <a href="excluir.jsp?id=<%= tarefa.getId() %>"
                           class="btn excluir">
                            ✕ Excluir
                        </a>

                    </td>

                </tr>

                <% } %>

                <% if (tarefas.isEmpty()) { %>

                <tr>
                    <td colspan="4" class="vazio">
                        📭 Nenhuma tarefa cadastrada ainda.
                        <br><br>
                        Clique em "Nova Tarefa" para começar!
                    </td>
                </tr>

                <% } %>

            </table>

        </div>

        <a href="index.jsp" class="voltar">
            ← Voltar ao início
        </a>

        <div class="rodape">
            Sistema de Gerenciamento de Tarefas
        </div>

    </div>

</body>
</html>
