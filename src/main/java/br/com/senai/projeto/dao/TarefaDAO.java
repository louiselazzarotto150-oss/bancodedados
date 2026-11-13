
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

    public boolean excluirProduto(int id) {
        String sql = "DELETE FROM produto WHERE id = ?";

        // O try-with-resources garante que conn e stmt sejam fechados automaticamente
        try (Connection conn = Conexao.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            int resultado = stmt.executeUpdate();

            if (resultado > 0) {
                System.out.println("Produto excluído com sucesso!");
                return true;
            } else {
                System.out.println("Produto não encontrado!");
                return false;
            }

        } catch (SQLException e) {
            System.err.println("Erro ao excluir produto: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }


}