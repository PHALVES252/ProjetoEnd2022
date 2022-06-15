    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import util.BancodeDados;

/**
 *
 * @author carro
 */
public class Contato {
    
    private long id;
    private int idusuario;
    private String nome;
    private String email;
    private String mensagem;
    private String assunto;
    private String ddd;
    private String telefone;
    private Timestamp dataCadastro;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public String getAssunto() {
        return assunto;
    }

    public void setAssunto(String assunto) {
        this.assunto = assunto;
    }

    public String getDdd() {
        return ddd;
    }

    public void setDdd(String ddd) {
        this.ddd = ddd;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public Timestamp getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Timestamp dataCadastro) {
        this.dataCadastro = dataCadastro;
    }
    
    public boolean Cadastrar() {
        try {

            Connection conn = BancodeDados.getConexao();
            String sql = "INSERT INTO `bdecoleta`.`tb_contato` "
                    + "(`nome`,`email`,`mensagem`,`assunto`,`ddd`,`telefone`)"
                    + "VALUES (?,?,?,?,?,?);";
            PreparedStatement ps = conn.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, this.getNome());
            ps.setString(2, this.getEmail());
            ps.setString(3, this.getMensagem());
            ps.setString(4, this.getAssunto());
            ps.setString(5, this.getDdd());
            ps.setString(6, this.getTelefone());

            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                final ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    final long lastId = rs.getLong(1);
                    System.out.println("O numero do id é:"
                            + lastId);
                    this.setId(lastId);
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
       
    public boolean BuscarPorId(String id) {
        try {
            Connection conn = BancodeDados.getConexao();
            String sql = "SELECT * FROM tb_contato WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, this.getId());
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                this.setId(rs.getInt("id"));
                this.setNome(rs.getString("nome"));
                this.setEmail(rs.getString("email"));
                this.setMensagem(rs.getString("mensagem"));
                this.setAssunto(rs.getString("assunto"));
                this.setDdd(rs.getString("ddd"));
                this.setTelefone(rs.getString("telefone"));
                this.setDataCadastro(rs.getTimestamp("dtcadastro"));
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
    
    public boolean Atualizar() {
        try {
            Connection conn = BancodeDados.getConexao(); //conectar com o bando de dados e enviar os dados salvos da classe Contato.
            String sql = "UPDATE tb_contato "
                    + " SET nome = ?, "
                    + " email = ?, "
                    + " mensagem = ?, "
                    + " assunto = ?, "
                    + " ddd = ?, "
                    + " telefone  =?, "
                    + " WHERE id = ?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, this.getNome());
            ps.setString(2, this.getEmail());
            ps.setString(3, this.getMensagem());
            ps.setString(4, this.getAssunto());
            ps.setString(5, this.getDdd());
            ps.setString(6, this.getTelefone());
            ps.setLong(7, this.getId());
            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                System.out.println("atualizou!");
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
            return false;
        }
    }
    
    public boolean Excluir() {
        try {
            Connection conn = BancodeDados.getConexao(); //conectar com o bando de dados e enviar os dados salvos da classe Contato.
            String sql = "DELETE FROM tb_contato WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, this.getId());
            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                System.out.println("Apagou!!");
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
            return false;
        }
    }
}

