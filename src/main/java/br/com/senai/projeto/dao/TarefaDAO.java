
package br.com.senai.projeto.dao;



import br.com.senai.projeto.config.Conexao;
import br.com.senai.projeto.model.Tarefa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TarefaDAO {

    public List<Tarefa> listar() {
        List<Tarefa> lista = new ArrayList<>();
        String sql = "SELECT * FROM tarefa";


        try (Connection conn = Conexao.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Tarefa t = new Tarefa();
                t.setId(rs.getInt("id"));
                t.setTitulo(rs.getString("titulo"));
                t.setConcluida(rs.getBoolean("concluida"));

                lista.add(t);
            }
        } catch (SQLException e) {
            System.err.println("Erro ao listar tarefas: " + e.getMessage());
        }

        return lista;
    }

    public void excluir (int id){

    }
}