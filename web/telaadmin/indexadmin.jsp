
<%@page import="modelo.Usuario"%>
<%
    String nome = "";
    session = request.getSession();
    Usuario user = (Usuario) session.getAttribute("user");
    nome = "Administrador" + user.getNome();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ecovix</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../css/bootstrap.css" />
        <link rel="stylesheet" href="../css/estilo.css" />
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
            <tr>
                <td><div class="espaco2"></div></td>
                <td>
                    <div class="mainmsg">
                        <h1 class="msg">
                            <b>Seu marketplace de<br>coleta de resíduos</b>
                            <br>
                            <p>Ajudamos pessoas a encontrarem pontos de coleta<br> de forma eficiente</p>
                        </h1>
                        <br>
                        <a class="btn1 btn-success btn-lg" href="cadastrarponto.jsp" role="button"><b>Cadastre um ponto de coleta</b></a>
                        <a class="btn btn-success btn-lg" href="pesquisarponto.jsp" role="button"><b>Pesquise um ponto de coleta</b></a>
                    </div>
                </td>
                <td>
                    <div class="imgtemple">
                        <img src="../img/img01.jpg" />
                    </div>
                </td>
                <td><div class="espaco5"></div></td>
            </tr>
        </table>
        <script type="text/javascript" src="../js/bootstrap.js"></script>
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/jquery.mask.js"></script>
    </body>
</html>
