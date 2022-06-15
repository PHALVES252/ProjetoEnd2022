<%-- 
    Document   : contato.jsp
    Created on : 18/04/2022, 12:29:40
    Author     : cdi
--%>
<%@page import="modelo.Usuario"%>
<%
    String nome = "";
    session = request.getSession();
    Usuario user = (Usuario) session.getAttribute("user");
    nome = "Bem-Vindo(a)," + user.getNome();

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Ponto</title>
        <!--Bootsrap 4 CDN-->
        <link rel="stylesheet" href="../css/bootstrap.css" >

        <!--Fontawesome CDN-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <!--Custom styles-->
        <link rel="stylesheet" type="text/css" href="../css/estilocadastrar.css">
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
                        <td width="4px"><a class="user " href="#" role="button"><b><%=nome%></b></a></td>

                    </table>
                </td>
                <td><div class="espaco"></div></td>
            </tr>
            <form action="ClienteServlet" method="POST">
                <h1>Fale conosco</h1> 
                <div class="form-group row">
                    <label for="inputnome" class="col-sm-2 col-form-label">Nome</label>
                    <div class="col-sm-7">
                        <input type="text" name="nomerazao" class="form-control" id="inputEmail3">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-6">
                        <input type="text"  name="endereco" class="form-control" id="inputEmail3">
                    </div>
                    <label for="inputEmail3" class="col-sm-2 col-form-label">Telefone</label>
                    <div class="col-sm-2">
                        <input type="text"  name="numero" class="form-control" id="inputEmail3">
                    </div>
                    <label for="inputEmail3" class="col-sm-2 col-form-label">Mensagem</label>
                    <div class="col-sm-20" class="rol-sm-10" ><br/>
                        <input type="text-area"  name="Mensagem" class="form-control2" id="inputEmail3" size="100">
                    </div>
                </div>
                <label for="sltEscolaridade" class="col-sm-2 col-form-label">Assunto:</label>
                <div class="col-sm-3">
                    <select class="form-control" id="sltEscolaridade" name="uf" placeholder="escolha um assunto">
                        <option value="ES">Elogios </option>
                        <option value="MG">Sugestões </option>
                        <option value="SP">Reclamações </option>
                        <option value="RJ"> Solicitações</option>
                    </select>
                </div>
                <button type="submit" class="botaocad">Enviar</button>
            </form 
        </table>
        <script type="text/javascript" src="../js/bootstrap.js"></script>
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/jquery.mask.js"></script>
    </body>
</html>
