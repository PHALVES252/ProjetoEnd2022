/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;
import modelo.Usuario;

/**
 *
 * @author sala305b
 */
/**
 *
 * @author sala305b
 */
@WebServlet(name = "ClienteServlet", urlPatterns = {"/ClienteServlet"})
public class ClienteServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("acao") != null) {
            if (request.getParameter("acao").equals("cadastrar")) {

                String idusuario = request.getParameter("idusuario");
                String cep = request.getParameter("cep");
                String logradouro = request.getParameter("logradouro");
                String numero = request.getParameter("numero");
                String complemento = request.getParameter("complemento");
                String bairro = request.getParameter("bairro");
                String cidade = request.getParameter("cidade");
                String uf = request.getParameter("estado");
                String imagem = request.getParameter("imagem");

                Cliente cli = new Cliente();
                cli.setCep(cep);
                cli.setLogradouro(logradouro);
                cli.setNumero(numero);
                cli.setComplemento(complemento);
                cli.setBairro(bairro);
                cli.setCidade(cidade);
                cli.setUf(uf);
                cli.setImagem(imagem);

                Usuario us = new Usuario();
                us.setId(Long.parseLong(idusuario));
                cli.setUser(us);

                boolean cadastrou = cli.Cadastrar();
                if (cadastrou) {
                    request.setAttribute("idusuario", cli.getUser().getId());
                    response.sendRedirect("telauser/indexuser.jsp");
                } else {
                    request.setAttribute("idusuario", cli.getUser());
                    request.getRequestDispatcher("telauser/cadastraruser.jsp")//"tela/cadastrar.jsp"
                            .forward(request, response);
                }
            } else if (request.getParameter("acao").equals("editar")) {

                Cliente cli = new Cliente();

                boolean atualizou = cli.Atualizar();
                if (atualizou) {
                    response.sendRedirect("tela/listar.jsp");
                } else {
                    String mensagem
                            = "<h1>Edição não Efetuado com Sucesso</h1>";
                    response.getWriter().print(mensagem);
                }
            } else if (request.getParameter("acao").equals("deletar")) {
                int client = Integer.parseInt(request.getParameter("icliente"));
                Cliente.Excluir(client);
                String mensagem
                        = "<h1>Produto Apagado com Sucesso</h1>";
                response.getWriter().print(mensagem);
            }
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
