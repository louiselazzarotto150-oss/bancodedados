package br.com.senai.projeto.config;

import java.sql.*;

public class Conexao {
    private static final String URL =
            "jdbc:h2:file:./data/banco";

    private static final String USUARIO = "sa";
    private static final String SENHA = "";

    public static Connection conectar() throws SQLException {
        try {
            Class.forName("org.h2.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Driver H2 não encontrado!", e);
        }
        return DriverManager.getConnection(
                URL, USUARIO, SENHA
        );
    }

    public static void createTable() {
        String sql = "    CREATE TABLE IF NOT EXISTS usuarios (\n" +
                "        id int PRIMARY KEY not null,\n" +
                "        descricao VARCHAR(150) NOT NULL,\n" +
                "        status VARCHAR(20) NOT NULL\n" +
                "    )\n";

        try (Connection conn = conectar();
             Statement stmt = conn.createStatement()){
            stmt.execute(sql);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}