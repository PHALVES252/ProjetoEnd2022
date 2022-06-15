/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.awt.Image;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.xml.registry.infomodel.User;
import util.BancodeDados;

/**
 *
 * @author João Victor Pereira Miranda
 */
public class Cliente {

    /**
     * @return the id
     */
    public long getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(long id) {
        this.id = id;
    }


    public String getLogradouro() {
        return logradouro;
    }

    /**
     * @param logradouro the logradouro to set
     */
    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }

    /**
     * @return the numero
     */
    public String getNumero() {
        return numero;
    }

    /**
     * @param numero the numero to set
     */
    public void setNumero(String numero) {
        this.numero = numero;
    }

    /**
     * @return the complemento
     */
    public String getComplemento() {
        return complemento;
    }

    /**
     * @param complemento the complemento to set
     */
    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    /**
     * @return the bairro
     */
    public String getBairro() {
        return bairro;
    }

    /**
     * @param bairro the bairro to set
     */
    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    /**
     * @return the cidade
     */
    public String getCidade() {
        return cidade;
    }

    /**
     * @param cidade the cidade to set
     */
    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    /**
     * @return the uf
     */
    public String getUf() {
        return uf;
    }

    /**
     * @param uf the uf to set
     */
    public void setUf(String uf) {
        this.uf = uf;
    }

    /**
     * @return the imagem
     */
    public String getImagem() {
        return imagem;
    }

    /**
     * @param imagem the imagem to set
     */
    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    /**
     * @return the dataCadastro
     */
    public Timestamp getDataCadastro() {
        return dataCadastro;
    }

    /**
     * @param dataCadastro the dataCadastro to set
     */
    public void setDataCadastro(Timestamp dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }
    
        public Usuario getUser() {
        return user;
    }

    public void setUser(Usuario user) {
        this.user = user;
    }

    private long id;
    private Usuario user;
    private String cep;
    private String logradouro;
    private String numero;
    private String complemento;
    private String bairro;
    private String cidade;
    private String uf;
    private String imagem;
    private Timestamp dataCadastro;

    public boolean Cadastrar() {
        try {

            Connection conn = BancodeDados.getConexao();
            String sql = "INSERT INTO `bdecoleta`.`tb_ponto` "
                    + "(idusuario, cep, logradouro, numero, complemento, bairro, cidade,"
                    + "uf, imagem)"
                    + "VALUES (?,?,?,?,?,?,?,?,?);";
            PreparedStatement ps = conn.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);

            ps.setLong(1, this.getUser().getId());
            ps.setString(2, this.getCep());
            ps.setString(3, this.getLogradouro());
            ps.setString(4, this.getNumero());
            ps.setString(5, this.getComplemento());
            ps.setString(6, this.getBairro());
            ps.setString(7, this.getCidade());
            ps.setString(8, this.getUf());
            ps.setString(9, this.getImagem());
            
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

    public List<Cliente> ListarTodos() {
        try {
            Connection conn = BancodeDados.getConexao();
            String sql = "SELECT * FROM tb_ponto; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            List<Cliente> clientes = new ArrayList();
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cliente c = new Cliente();
                c.setId(rs.getLong("id"));
                

                c.setUf(rs.getString("uf"));
                c.setBairro(rs.getString("bairro"));
                c.setCidade(rs.getString("cidade"));
                c.setComplemento(rs.getString("complemento"));
                c.setNumero(rs.getString("numero"));
                c.setCep(rs.getString("cep"));
                c.setLogradouro(rs.getString("logradouro"));
                c.setImagem(rs.getString("imagem"));
                c.setDataCadastro(rs.getTimestamp("dtcadastro"));

                clientes.add(c);
            }
            return clientes;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public boolean BuscarPorId(String id) {
        try {
            long idcli = Long.parseLong(id);
            Connection conn = BancodeDados.getConexao();
            String sql = "SELECT * FROM tb_ponto WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, idcli);
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                this.setId(rs.getInt("id"));

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

    public static boolean Excluir(long id) {
        try {
            Connection conn = BancodeDados.getConexao();
            String sql = "DELETE FROM tb_ponto  WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, id);
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

    public boolean Atualizar() {
        try {
            Connection conn = BancodeDados.getConexao();
            String sql = "UPDATE tb_ponto ";
            sql += " SET tprequerente = ?, ";
            sql += " nome = ?, ";
            sql += " documento = ?, ";
            sql += " ddd = ?, ";
            sql += " telefone = ?, ";
            sql += " email = ?, ";
            sql += " logradouro = ?, ";
            sql += " numero = ?, ";
            sql += " cep = ?, ";
            sql += " complemento = ?, ";
            sql += " bairro = ?, ";
            sql += " cidade = ?, ";
            sql += " uf = ?, ";
            sql += " imagem = ? ";
            sql += " WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);

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
}
