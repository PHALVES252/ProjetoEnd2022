/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Contato;

/**
 *
 * @author carro
 */
@WebServlet(name = "ContatoServlet", urlPatterns = {"/ContatoServlet"})
public class ContatoServlet extends HttpServlet {

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

                Contato co = new Contato();

                String nome = request.getParameter("nome");
                String email = request.getParameter("email");
                String mensagem = request.getParameter("mensagem");
                String assunto = request.getParameter("assunto");
                String dddtelefone = request.getParameter("dddtelefone");

                co.setNome(nome);
                co.setEmail(email);
                co.setMensagem(mensagem);
                co.setAssunto(assunto);

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

                co.setDdd(ddd);
                co.setTelefone(telefone);

                boolean cadastrou = co.Cadastrar();

                if (cadastrou == true) {
                    response.sendRedirect("tela/index.jsp");

                } else {
                    response.sendRedirect("tela/contato.jsp?erro=cadastrar");
                }

            }
        }

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ContatoServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ContatoServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
