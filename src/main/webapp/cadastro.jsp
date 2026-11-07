<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="br.com.senai.projeto.model.Tarefa" %>
<%@ page import="br.com.senai.projeto.dao.TarefaDAO" %>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {

    String descricao = request.getParameter("descricao");
    String status = request.getParameter("status");

    Tarefa tarefa = new Tarefa(descricao, status);

    TarefaDAO dao = new TarefaDAO();
    dao.cadastrar(tarefa);

    response.sendRedirect("listagem.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Lista de Tarefas</title>


</head>
<body>

    <h1>Cadastrar Tarefa</h1>

    <form action="cadastro.jsp" method="post">

        <label>Descrição:</label>
        <input type="text" name="descricao" required>

        <br><br>

        <label>Status:</label>
        <select name="status">
            <option value="Pendente">Pendente</option>
            <option value="Concluída">Concluída</option>
        </select>

        <br><br>

        <button type="submit">Cadastrar</button>

    </form>

</body>
</html>