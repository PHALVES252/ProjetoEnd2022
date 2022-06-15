/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import util.BancodeDados;

/**
 *
 * @author sala305b
 */
public class Usuario {

    private long id;
    private String admin;
    private String tprequerente;
    private String nome;
    private String ddd;
    private String telefone;
    private String email;
    private String documento;
    private String login;
    private String senha;
    private Date dtnascimento;
    private Timestamp dataCadastro;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Timestamp getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Timestamp dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public String getTprequerente() {
        return tprequerente;
    }

    public void setTprequerente(String tprequerente) {
        this.tprequerente = tprequerente;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public Date getDtnascimento() {
        return dtnascimento;
    }

    public void setDtnascimento(Date dtnascimento) {
        this.dtnascimento = dtnascimento;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public long Cadastrar() {
        try {

            Connection conn = BancodeDados.getConexao();
            String sql = "INSERT INTO tb_usuario";
            sql += "(admin, tprequerente, nome, ddd, telefone, email, documento, dtnascimento, login, senha)";
            sql += "VALUES (?,?,?,?,?,?,?,?,?,?);";
            PreparedStatement ps = conn.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, this.getAdmin());
            ps.setString(2, this.getTprequerente());
            ps.setString(3, this.getNome());
            ps.setString(4, this.getDdd());
            ps.setString(5, this.getTelefone());
            ps.setString(6, this.getEmail());
            ps.setString(7, this.getDocumento());
            ps.setDate(8, this.getDtnascimento());
            ps.setString(9, this.getLogin());
            ps.setString(10, this.getSenha());

            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int lastId = rs.getInt(1);
                    //insere o id registrado no banco no objeto
                    this.setId(lastId);
                    System.out.println(
                            "O id do cliente é:" + lastId);
                    return lastId;
                } else {
                    return 0;
                }
            } else {
                return 0;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public boolean BuscarPorId(String id) {
        try {
            Connection conn = BancodeDados.getConexao();
            String sql = "SELECT * FROM tb_usuario WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, this.getId());
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                this.setId(rs.getInt("id"));
                this.setAdmin(rs.getString("admin"));
                this.setLogin(rs.getString("login"));
                this.setSenha(rs.getString("senha"));
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

    public boolean TemUsuario() {
        try {
            Connection conn = BancodeDados.getConexao();
            String sql = "SELECT id, admin, nome, dtcadastro "
                    + "FROM tb_usuario "
                    + "WHERE login = ? AND senha = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, this.getLogin());
            ps.setString(2, this.getSenha());
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                this.setId(rs.getLong("id"));
                this.setAdmin(rs.getString("admin"));
                this.setNome(rs.getString("nome"));
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
            String sql = "UPDATE tb_usuario "
                    + " SET tprequerente = ?, "
                    + " nome = ?, "
                    + " ddd = ?, "
                    + " telefone  =?, "
                    + " email = ?, "
                    + " documento = ?, "
                    + " dtnascimento = ?, "
                    + " login = ?, "
                    + " senha = ? "
                    + " WHERE id = ?;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, this.getNome());
            ps.setString(2, this.getDdd());
            ps.setString(3, this.getTelefone());
            ps.setString(4, this.getEmail());
            ps.setString(5, this.getDocumento());
            ps.setDate(6, this.getDtnascimento());
            ps.setString(7, this.getLogin());
            ps.setString(8, this.getSenha());
            ps.setLong(9, this.getId());
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
            String sql = "DELETE FROM tb_usuario WHERE id = ?; ";
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
