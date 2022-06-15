<%@page import="modelo.Usuario"%>
<%
    String nome = "";
    session = request.getSession();
    Usuario user = (Usuario) session.getAttribute("user");
    nome = "Olá," + user.getNome();
%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ecovix Login</title>
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

        <form  action="../UsuarioServlet" method="POST" >
            <table class="tabela" width="100%">
                <tr>
                    <td class="espaco"></td>
                    <td>
                        <div class="imglogo">
                            <img src="../img/LogoVIX.png"/>
                        </div>
                    </td>
                    <td colspan="1">
                        <table cellpadding="15" class="tabela2" width="5%">
                            <td width="4px"><a class="btn btn-success" href="#" role="button"><b>Home</b></a></td>
                            <td width="4px"><a class="btn btn-success" href="#" role="button"><b>Sobre</b></a></td>
                            <td width="4px"><a class="btn btn-success" href="#" role="button"><b>Contato</b></a></td>
                            <td width="4px"><a class="btn btn-success" href="login.jsp" role="button"><b>Login</b></a></td>
                            <td width="4px"><a class="btn btn-success" href="#" role="button"><b><%= nome%></b></a></td>
                        </table>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td class="espaco3"></td>
                    <td>
                        <div class="imglogin">
                            <img src="../img/LoginIMG.jpg" />
                        </div>
                    </td>
                </tr>
            </table>
            <div>
                <div class="row">
                    <div class="col-5"></div>
                    <div class="col-2">
                        <div class="form-group">
                            <label for="InputLogin"><scan style='color:black;'>Login</scan></label>
                            <input type="text" class="form-control" id="InputLogin" aria-describedby="loginHelp" name="login"/>
                            <small id="loginHelp" class="form-text text-muted"><scan style='color:black;'>Nunca compartilharemos seu login com mais ninguém.</scan></small>
                        </div>
                    </div>
                    <div class="col-5"></div>
                </div>
                <div class="row">
                    <div class="col-5"></div>
                    <div class="col-2">
                        <div class="form-group">
                            <label for="inputSenha"><scan style='color:black;'>Senha</scan></label>
                            <input type="password" class="form-control" id="inputSenha" name="senha"/>
                        </div>
                    </div>
                    <div class="col-5"></div>
                </div>
                <div class="row">
                    <div class="col-5"></div>
                    <div class="col-2">
                        <div class="form-group form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1"><scan style='color:black;'>Verificação</scan></label>
                        </div>
                        <div>
                            <button type="submit" class="loginrequest btn btn-success float-right"><b>Login</b></button>
                        </div>
                    </div>
                    <div class="col-5"></div>
                </div>
                <div class="row">
                    <div class="col-5"></div>
                    <div class="col-2">
                        <div class="d-flex justify-content-center links">
                            <scan style='color:black;'>Não possui uma conta?</scan><a href="#">Cadastre-se</a>
                        </div>
                        <div class="d-flex justify-content-center">
                            <a href="#">Esqueceu sua senha?</a>
                        </div>
                    </div>
                    <div class="col-5"></div>
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript" src="../js/bootstrap.js"></script>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/jquery.mask.js"></script>
</body>
</html>
