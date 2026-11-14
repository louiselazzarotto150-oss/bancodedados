
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
    public TarefaDAO() {
        Conexao.createTable();
    }

    // LISTAR TAREFAS
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
            e.printStackTrace();
        }

        return lista;
    }

    // CADASTRAR TAREFA
    public boolean cadastrar(Tarefa tarefa) {

        String sql = "INSERT INTO tarefa (titulo, concluida) VALUES (?, ?)";

        try (Connection conn = Conexao.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, tarefa.getTitulo());
            stmt.setBoolean(2, tarefa.isConcluida());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // EXCLUIR TAREFA
    public boolean excluir(int id) {

        String sql = "DELETE FROM tarefa WHERE id = ?";

        try (Connection conn = Conexao.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // ATUALIZAR TAREFA
    public boolean atualizar(Tarefa tarefa) {

        String sql = "UPDATE tarefa SET titulo = ?, concluida = ? WHERE id = ?";

        try (Connection conn = Conexao.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, tarefa.getTitulo());
            stmt.setBoolean(2, tarefa.isConcluida());
            stmt.setInt(3, tarefa.getId());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // BUSCAR TAREFA PELO ID
    public Tarefa buscarPorId(int id) {

        String sql = "SELECT * FROM tarefa WHERE id = ?";

        try (Connection conn = Conexao.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {

                if (rs.next()) {

                    Tarefa tarefa = new Tarefa();

                    tarefa.setId(rs.getInt("id"));
                    tarefa.setTitulo(rs.getString("titulo"));
                    tarefa.setConcluida(rs.getBoolean("concluida"));

                    return tarefa;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
