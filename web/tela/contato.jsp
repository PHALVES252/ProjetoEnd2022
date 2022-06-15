<%-- 
    Document   : contato.jsp
    Created on : 18/04/2022, 12:29:40
    Author     : cdi
--%>



<%@page import="modelo.Contato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

    String acao = "cadastrar", nome = "", dddtelefone = "", email = "",
            idusuario = "", assunto = "", mensagem = "", dtcadastro = "", caminhoacao = "../ContatoServlet";;

    Contato co = new Contato();

    if (request.getParameter("acao") != null) {
        if (request.getParameter("acao").equals("editar")) {

            idusuario = request.getParameter("idusuario");
            caminhoacao = "../ContatoServlet";
            boolean achou = co.BuscarPorId(idusuario);
            if (!achou) {
                out.print("<script>"
                        + "window.alert('Cliente não Encontrado');"
                        + "</script>");
            } else {
                acao = "editar";
                idusuario = String.valueOf(co.getIdusuario());
                nome = co.getNome();
                email = co.getEmail();
                mensagem = co.getMensagem();
                assunto = co.getAssunto();
                dddtelefone = co.getTelefone();
                dtcadastro = String.valueOf(co.getDataCadastro());
            }
        }
    }


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Ponto</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" type="text/css" href="../css/estilocadastrar.css">
        <link rel="stylesheet" href="../css/estilo.css" />
        <link rel="stylesheet" href="../css/bootstrap.css" />
        <link rel="stylesheet" href="../css/estilocontato.css"/>

        <!--Fontawesome CDN-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">


    </head>
    <body>   
        <table class="tabela" width="100%">
            <tr>
                <td><div class="espaco"></div></td>
                <td>
                    <div class="imglogo">
                        <img src="../img/LogoVIX.png"/>
                    </div>
                </td>
                <td colspan="1">
                    <table cellpadding="15" class="tabela2" width="5%">
                        <td width="4px"><a class="btn btn-success" href="index.jsp" role="button"><b>Home</b></a></td>
                        <td width="4px"><a class="btn btn-success" href="sobre.jsp" role="button"><b>Sobre</b></a></td>
                        <td width="4px"><a class="btn btn-success" href="contato.jsp" role="button"><b>Contato</b></a></td>
                        <td width="4px"><a class="btn btn-success" href="login.jsp" role="button"><b>Login</b></a></td>

                    </table>
                </td>
                <td><div class="espaco"></div></td>
            </tr>
        </table>
        <br>
        <br>
        <br>
        <br>
        <div class="container">
            <form action="<%=caminhoacao%>" method="POST">
                <input type="hidden" name="acao" value="<%= acao%>"/>
                <input type="hidden" name="idusuario" value="<%= idusuario%>"/> 
                
                <div class="mainmsg msgcontato">
                    <h1 class="msg">Fale conosco</h1>
                </div>
                <br><br>
                <div class="centercont">

                    <div class="col-7">
                        <label for="txtNome" class="mainmsg" >Nome:</label>
                        <input type="text"  
                               value="<%= nome%>"
                               name="nome" class="form-control" id="txtNome">
                    </div>
                    <br>
                    <div class="col-7">
                        <label for="inputEmail">Email:</label>
                        <input type="email"  
                               value="<%= email%>"
                               name="email"  class="form-control" id="inputEmail">
                    </div>
                    <br>
                    <div class="col-7">
                        <label for="txtDddTelefone" >Telefone:</label>
                        <input type="text"  
                               value="<%= dddtelefone%>"
                               name="dddtelefone" class="form-control" id="txtDddTelefone">
                    </div>
                    <br>
                    <div class="form-group col-7">
                        <label id="sltAssunto" for="txtAssunto">Assunto da mensagem:</label>
                        <select required 
                                multiple 
                                id="sltAssunto"
                                name="assunto"
                                value="<%= assunto%>"
                                class="form-control">
                            <option <%= assunto.equals("") ? "selected" : ""%>
                                value="">Selecione</option>
                            <option <%= assunto.equals("Elogio") ? "selected" : ""%>
                                value="Elogio">Elogios</option>
                            <option <%= assunto.equals("Sugestao") ? "selected" : ""%>
                                value="Sugestao">Sugestoes</option>
                            <option <%= assunto.equals("Reclamacao") ? "selected" : ""%>
                                value="Reclamacao">Reclamacoes</option>
                            <option <%= assunto.equals("Solicitacao") ? "selected" : ""%>
                                value="Solicitacao">Solicitacoes</option>
                        </select>
                    </div>                   
                    <br>
                    <div class="form-group col-9">
                        <label for="txtMensagem">Mensagem:</label>
                        <textarea class="form-control" 
                                  id="txtMensagem"
                                  name="mensagem"
                                  value="<%=mensagem%>"
                                  rows="3"></textarea>
                    </div>  
                </div>
                <hr>
                <div class="btncontato">
                    <button type="submit" class="btn btn-success"><%=acao%></button>
                </div>
                <br>
                <br>
                <br>
                <br>
            </form> 
        </div>
        <script type="text/javascript" src="../js/bootstrap.js"></script>
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/jquery.mask.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {

                $("#txtDddTelefone").on("click", function (e) {
                    $("#txtDddTelefone").mask("(00) 00000-0000");
                });
            });

        </script>
    </body>
</html>
