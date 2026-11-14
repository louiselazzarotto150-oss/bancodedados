
package br.com.senai.projeto.model;

public class Tarefa {

    private int id;
    private String titulo;
    private boolean concluida;

    // Construtor vazio
    public Tarefa() {
    }

    // Getter e Setter do ID
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    // Getter e Setter do título
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    // Getter e Setter da conclusão
    public boolean isConcluida() {
        return concluida;
    }

    public void setConcluida(boolean concluida) {
        this.concluida = concluida;
    }
}
