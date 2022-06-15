<%-- 
    Document   : login
    Created on : 05/04/2022, 10:56:04
    Author     : sala306b
--%>

<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    String acao = "cadastrar", idusuario = "", login = "",
            senha = "", nome = "", dtcadastro = "", caminhoacao = "../UsuarioServlet", dddtelefone = "",
            email = "", documento = "", dtnascimento = "", tipopessoa = "";

    Usuario us = new Usuario();

    if (request.getParameter("acao") != null) {
        if (request.getParameter("acao").equals("editar")) {

            idusuario = request.getParameter("idusuario");
            caminhoacao = "../UsuarioServlet";
            boolean achou = us.BuscarPorId(idusuario);
            if (!achou) {
                out.print("<script>"
                        + "window.alert('Cliente não Encontrado');"
                        + "</script>");

            } else {
                acao = "editar";
                idusuario = String.valueOf(us.getId());
                tipopessoa = us.getTprequerente();
                dddtelefone = us.getTelefone();
                email = us.getEmail();
                documento = us.getDocumento();
                login = us.getLogin();
                senha = us.getSenha();
                nome = us.getNome();
                dtcadastro = String.valueOf(us.getDataCadastro());
                dtnascimento = String.valueOf(us.getDtnascimento());
            }
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Ponto</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../css/estilocadastraruser.css" />
        <link rel="stylesheet" href="../css/bootstrap.css" />

        <!--Custom styles-->
        <link rel="stylesheet" type="text/css" href="../css/estilocadastrar.css">
        <!--Fontawesome CDN-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    </head>
    <body>
        <table class="tabela" width="100%">
            <tr>
                <td><div class="espaco7"></div></td>
                <td>
                    <div class="imglogo divlogo">
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
        <div class="container">           
            <form action="<%= caminhoacao%>" method="POST">
                <input type="hidden" name="acao" value="<%= acao%>"/>
                <input type="hidden" name="idusuario" value="<%= idusuario%>"/>  


                <h1>Dados do usuario</h1> 
                <fieldset class="form-group row">
                    <legend class="col-form-label col-sm-2 float-sm-left pt-0">Tipo do Requerente</legend>
                    <div class="col-sm-10">
                        <div id="divfisica" class="form-check">
                            <input required id="pessoaF" class="form-check-input" 
                                   <%= tipopessoa.equals("PF") ? "checked" : ""%>
                                   type="radio" name="tipopessoa" value="PF"/>
                            <label id="text" class="form-check-label" for="pessoaF">
                                Pessoa Física
                            </label>
                        </div>
                        <div id="divjuridica" class="form-check">
                            <input required id="pessoaJ" class="form-check-input" 
                                   <%= tipopessoa.equals("PJ") ? "checked" : ""%>
                                   type="radio" name="tipopessoa" value="PJ"/>
                            <label id="text" class="form-check-label" for="pessoaJ">
                                Pessoa Jurídica
                            </label>
                        </div>
                    </div>
                </fieldset>

                <div class="row">
                    <div class="col">
                        <label id="lblnomecad" for="lblnome" >Nome:</label><br/>
                        <input class="form-control" required size="30"  value="<%=nome%>"
                               type="text" name="nomecad" />
                    </div>
                    <div class="col">
                        <label for="">Login:</label><br/>
                        <input class="form-control" required size="30"  value="<%=login%>"
                               type="text" name="logincad" />
                    </div>
                    <div class="col">
                        <label for="">Senha:</label><br/>
                        <input class="form-control" required size="30"  value="<%=senha%>"
                               type="password" name="senhacad" />
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col">
                        <label for="txtDddTelefone" >Telefone:</label>
                        <input type="text"  
                               value="<%= dddtelefone%>"
                               name="dddtelefone" class="form-control" id="txtDddTelefone">
                    </div>
                    <div class="col">
                        <label for="inputEmail">Email:</label>
                        <input type="email"  
                               value="<%= email%>"
                               name="email"  class="form-control" id="inputEmail">
                    </div>
                    <div class="col">
                        <label for="lblDocumento">Documento:</label>
                        <input type="text"  
                               value="<%= documento%>"
                               name="documento"  class="form-control" id="inputDocumento">
                    </div>
                </div>
                <br>
                <div class="">
                    <div class="row">
                        <div class="col-3">
                            <label for="dataNascimento">Data de Nascimento:</label>
                            <input type="date"  
                                   value="<%= dtnascimento%>"
                                   name="dtnascimento"  class="form-control" id="dataNascimento">
                        </div>
                    </div>
                </div>
                <br><br>
                <div class="container">
                    <div class="row">
                        <div class="col-2">
                            <button id="btn" type="submit" class="btn btn-success btn-lg btn-block"><%= acao%></button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/bootstrap.js"></script>
        <script type="text/javascript" src="../js/jquery.mask.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {

                $("#txtCpfCnpj").mask("000.000.000-00");

                $("#divfisica").on("click", function (e) {
                    $("#lblnomecad").html("Nome");
                });
                $("#divjuridica").on("click", function (e) {
                    $("#lblnomecad").html("Jurídica");
                });
                $("#divfisica").on("click", function (e) {
                    $("#inputDocumento").mask("000.000.000-00");
                    $("#lblDocumento").html("CPF");
                });
                $("#divjuridica").on("click", function (e) {
                    $("#txtCpfCnpj").mask("00000000000000000");
                    $("#lblCpfCnpj").html("CNPJ");
                });
                $("#txtDddTelefone").on("click", function (e) {
                    $("#txtDddTelefone").mask("(00) 00000-0000");
                });
            });
        </script>
    </body>
</html>
