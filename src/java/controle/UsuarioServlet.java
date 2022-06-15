/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;

/**
 *
 * @author João Victor Pereira Miranda
 */
@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {

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

        if (request.getParameter("login") != null
                && request.getParameter("senha") != null) {

            String login = request.getParameter("login");
            String senha = request.getParameter("senha");

            Usuario user = new Usuario();
            user.setLogin(login);
            user.setSenha(senha);
            boolean talogado = user.TemUsuario();

            //talogado == true
            if (talogado) {

                HttpSession session = request.getSession();
                session.setAttribute("user", user);

                if (user.getAdmin().equals("A")) {
                    response.sendRedirect("telaadmin/indexadmin.jsp");
                } else if (user.getAdmin().equals("B")) {
                    response.sendRedirect("telauser/indexuser.jsp");
                }
                  
            } else {
                response.sendRedirect("tela/login.jsp?auth=false");
            }
        } else if (request.getParameter("acao").equals("editar")) {

            long idusuario = Long.parseLong(request.getParameter("idusuario"));
            String admin = request.getParameter("admin");
            String tipopessoa = request.getParameter("tipopessoa");
            String tprequerente = request.getParameter("tprequerente");
            String nome = request.getParameter("nome");
            String dddtelefone = request.getParameter("dddtelefone");
            String email = request.getParameter("email");
            String documento = request.getParameter("documento");
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            Date dtnascimento = Date.valueOf(
                    request.getParameter("datanascimento"));

            Usuario us = new Usuario();
            us.setAdmin(admin);
            us.setId(idusuario);
            us.setNome(nome);
            us.setSenha(senha);
            us.setLogin(login);
            us.setEmail(email);
            us.setDocumento(documento);
            us.setDtnascimento(dtnascimento);

            if (tipopessoa.equals("PF")) {
                us.setTprequerente(tprequerente);
            } else if (tipopessoa.equals("PJ")) {
                us.setTprequerente(tprequerente);
            } else {
                response.sendRedirect("index.jsp?erro=cadastrar");
            }

            String dddTelLimpo = dddtelefone.replace(" ", "")
                    .replace("-", "")
                    .replace("(", "")
                    .replace(")", "");
            String ddd = dddTelLimpo.substring(0, 2);
            String telefone = "";
            if (dddTelLimpo.length() == 10) {
                telefone = dddTelLimpo.substring(2, 6)
                        + "-" + dddTelLimpo.substring(6);
            } else {
                telefone = dddTelLimpo.substring(2, 7)
                        + "-" + dddTelLimpo.substring(7);
            }
            us.setDdd(ddd);
            us.setTelefone(telefone);

            boolean atualizou = us.Atualizar();
            if (atualizou) {
                response.sendRedirect("");
            } else {
                String mensagem
                        = "<h1>Atualização não Efetuado</h1>";
                response.getWriter().print(mensagem);
            }
        } else if (request.getParameter("acao").equals("deletar")) {

            Usuario us = new Usuario();
            us.setId(Long.parseLong(request.getParameter("idusuario")));

            boolean apagou = us.Excluir();

            if (apagou) {
                response.sendRedirect("");
            } else {
                String mensagem
                        = "<h1>Exclusão não Efetuado</h1>";
                response.getWriter().print(mensagem);
            }
        } else {
            String tipopessoa = request.getParameter("tipopessoa");
            String nome = request.getParameter("nomecad");
            String login = request.getParameter("logincad");
            String senha = request.getParameter("senhacad");
            String documento = request.getParameter("documento");
            String dddtelefone = request.getParameter("dddtelefone");
            String email = request.getParameter("email");
            Date dtnascimento = Date.valueOf(
                    request.getParameter("dtnascimento"));

            Usuario us = new Usuario();
            us.setAdmin("B");
            us.setNome(nome);
            us.setLogin(login);
            us.setSenha(senha);
            us.setDocumento(documento);
            us.setDtnascimento(dtnascimento);

            if (tipopessoa.equals("PF")) {
                us.setTprequerente(tipopessoa);
            } else if (tipopessoa.equals("PJ")) {
                us.setTprequerente(tipopessoa);
            } else {
                response.sendRedirect("cadastraruser.jsp?erro=cadastrar");
            }

            String dddTelLimpo = dddtelefone.replace(" ", "")
                    .replace("-", "")
                    .replace("(", "")
                    .replace(")", "");
            String ddd = dddTelLimpo.substring(0, 2);

            String telefone = "";
            if (dddTelLimpo.length() == 10) {
                telefone = dddTelLimpo.substring(2, 6)
                        + "-" + dddTelLimpo.substring(6);
            } else {
                telefone = dddTelLimpo.substring(2, 7)
                        + "-" + dddTelLimpo.substring(7);
            }

            us.setDdd(ddd);
            us.setTelefone(telefone);
            us.setEmail(email);

            long novoId = us.Cadastrar();
            //cadastrou == true 
            if (novoId > 0) {
                request.setAttribute("idusuario", us.getId());
                response.sendRedirect("telauser/indexuser.jsp");

            } else {
                request.setAttribute("idusuario", us.getId());
                request.getRequestDispatcher("tela/cadastraruser.jsp")//"tela/cadastrar.jsp"
                        .forward(request, response);
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
