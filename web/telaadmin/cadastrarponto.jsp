<%-- 
    Document   : cadastrar2.jsp
    Created on : 16/04/2022, 18:52:18
    Author     : Paulo Henrique
--%>

<%@page import="modelo.Cliente"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    
    String acao = "cadastrar";
    String idusuario = "",
            numero = "", complemento = "",
            cidade = "", logradouro = "", bairro = "",
            uf = "", img = "", cep = "", caminhoacao = "../ClienteServlet", dtcadastro = "",
            responsavel = "";

    Cliente cli = new Cliente();
    if (request.getParameter("acao") != null) {
        if (request.getParameter("acao").equals("editar")) {

            caminhoacao = "../ClienteServlet";
            acao = request.getParameter("acao");
            idusuario = request.getParameter("idusuario");
            //cli.setId(Integer.parseInt(idusuario));

            boolean achou = cli.BuscarPorId(idusuario);

            if (achou) {
                idusuario = String.valueOf(cli.getId());
                responsavel = String.valueOf(cli.getUser().getNome());
                cep = cli.getCep();
                cidade = cli.getCidade();
                complemento = cli.getComplemento();
                logradouro = cli.getLogradouro();
                numero = cli.getNumero();
                bairro = cli.getBairro();
                uf = cli.getUf();
                img = cli.getImagem();
                dtcadastro = String.valueOf(cli.getDataCadastro());
            }
        }
    }
%>
<!DOCTYPE html>
<%
Usuario user = (Usuario) session.getAttribute("user");
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
                        <td width="4px"><a href="#" role="button"><b>teste</b></a></td>

                    </table>
                </td>
                <td><div class="espaco"></div></td>
            </tr>
        </table>


        <form action="<%= caminhoacao%>" method="POST">

            <input required type="hidden" name="idusuario" value="<%=user.getId()%>"> 
            <input required type="hidden" name="acao" value="<%= acao%>"/>


            <div class="container">
                <h1>Dados do seu ponto de coleta</h1> 

                <div class="form-group row">
                    <label for="txtcep" class="col-sm-2 col-form-label">CEP</label>
                    <div class="col-sm-10">
                        <input id="txtcep"
                               name="cep"
                               placeholder="Informe o seu CEP aqui.."
                               type="text"
                               class="form-control"
                               value="<%= cep%>"/>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="txtlogradouro" class="col-sm-2 col-form-label">Logradouro</label>
                    <div class="col-sm-6">
                        <input type="text" 
                               value="<%= logradouro%>"
                               name="logradouro" 
                               class="form-control" id="txtlogradouro"/>
                    </div>
                    <label for="txtnumero" class="col-sm-2 col-form-label">Número</label>
                    <div class="col-sm-2">
                        <input type="text"  
                               value="<%= numero%>"
                               name="numero" 
                               class="form-control" id="txtnumero"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="txtcidade" class="col-sm-2 col-form-label">Cidade</label>
                    <div class="col-sm-3">
                        <input type="text" 
                               value="<%= cidade%>"
                               name="cidade"
                               class="form-control" 
                               id="txtcidade"/>
                    </div>
                </div>


                <div class="form-group row">

                    <label for="txtbairro" class="col-sm-2 col-form-label">Bairro</label>
                    <div class="col-sm-3">
                        <input type="text"
                               name="bairro" 
                               class="form-control"
                               id="txtbairro"
                               value="<%=bairro%>"/>
                    </div>

                    <label for="txtcomplemento" class="col-sm-2 col-form-label">Complemento:</label>
                    <div class="col-sm-3">
                        <input type="text"
                               name="complemento" 
                               class="form-control"
                               id="txtcomplemento"
                               value="<%=complemento%>"/>
                    </div>

                </div>


                <div class="form-group row">

                    <label for="sltestado" class="col-sm-2 col-form-label">UF:</label>
                    <div class="col-sm-3">
                        <select class="form-control" id="sltestado" name="estado" value="<%=uf%>">
                            <option selected="" value="">Selecione o Estado (UF)</option>
                            <option value="">Selecione</option>
                            <option <%= uf.equals("AC") ? "selected" : ""%>
                                value="AC">Acre</option>
                            <option <%= uf.equals("AL") ? "selected" : ""%>
                                value="AL">Alagoas</option>
                            <option <%= uf.equals("AP") ? "selected" : ""%> 
                                value="AP">Amapá</option>
                            <option <%= uf.equals("AM") ? "selected" : ""%>
                                value="AM">Amazonas</option>
                            <option <%= uf.equals("BA") ? "selected" : ""%>
                                value="BA">Bahia</option>
                            <option <%= uf.equals("CE") ? "selected" : ""%>
                                value="CE">Ceará</option>
                            <option <%= uf.equals("DF") ? "selected" : ""%>
                                value="DF">Distrito Federal</option>
                            <option <%= uf.equals("ES") ? "selected" : ""%>
                                value="ES">Espirito Santo</option>
                            <option <%= uf.equals("GO") ? "selected" : ""%>
                                value="GO">Goiás</option>
                            <option <%= uf.equals("MA") ? "selected" : ""%>
                                value="MA">Maranhão</option>
                            <option <%= uf.equals("MS") ? "selected" : ""%>
                                value="MS">Mato Grosso do Sul</option>
                            <option <%= uf.equals("MT") ? "selected" : ""%> 
                                value="MT">Mato Grosso</option>
                            <option <%= uf.equals("MG") ? "selected" : ""%> 
                                value="MG">Minas Gerais</option>
                            <option <%= uf.equals("PA") ? "selected" : ""%> 
                                value="PA">Pará</option>
                            <option <%= uf.equals("PB") ? "selected" : ""%> 
                                value="PB">Paraíba</option>
                            <option <%= uf.equals("PR") ? "selected" : ""%> 
                                value="PR">Paraná</option>
                            <option <%= uf.equals("PE") ? "selected" : ""%>
                                value="PE">Pernambuco</option>
                            <option <%= uf.equals("PI") ? "selected" : ""%> 
                                value="PI">Piauí</option>
                            <option <%= uf.equals("RJ") ? "selected" : ""%> 
                                value="RJ">Rio de Janeiro</option>
                            <option <%= uf.equals("RN") ? "selected" : ""%> 
                                value="RN">Rio Grande do Norte</option>
                            <option <%= uf.equals("RS") ? "selected" : ""%> 
                                value="RS">Rio Grande do Sul</option>
                            <option <%= uf.equals("RO") ? "selected" : ""%> 
                                value="RO">Rondônia</option>
                            <option <%= uf.equals("RR") ? "selected" : ""%> 
                                value="RR">Roraima</option>
                            <option <%= uf.equals("SC") ? "selected" : ""%> 
                                value="SC">Santa Catarina</option>
                            <option <%= uf.equals("SP") ? "selected" : ""%> 
                                value="SP">São Paulo</option>
                            <option <%= uf.equals("SE") ? "selected" : ""%> 
                                value="SE">Sergipe</option>
                            <option <%= uf.equals("TO") ? "selected" : ""%> 
                                value="TO">Tocantins</option>
                        </select>
                    </div>
                    <label for="inputImgempresa" class="col-sm-2 col-form-label">Imagem da empresa </label>

                    <div class="col-sm-5">
                        <input type="file"  name="imagem" class="form-control" id="txtimagem" value="<%=img%>"/>
                    </div>
                </div>
                <br><br>
                <button type="submit" class="botaocad" value="<%=acao%>">Cadastrar ponto de coleta</button>
            </div>
        </form>

        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/bootstrap.js"></script>
        <script type="text/javascript" src="../js/jquery.mask.js"></script>
        <script type="text/javascript" src="../js/scriptmascara.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {

                $('#txtcep').on("blur", function (e) {

                    const cep = $("#txtcep").val();
                    const ceplimpo = String(cep)
                            .replace(".", "")
                            .replace("-", "");
                    const urlAJAX = "https://viacep.com.br/ws/" + ceplimpo + "/json/"
                    $.ajax({
                        url: urlAJAX,
                        method: "GET",
                        success: function (resp) {

                            console.log(resp);
                            const endereco = resp;

                            const bairro = endereco.bairro;
                            const logradouro = endereco.logradouro;
                            const cidade = endereco.localidade;
                            const estado = endereco.uf;
                            const complemento = endereco.complemento;

                            $("#txtlogradouro").val(logradouro);
                            $("#txtbairro").val(bairro);
                            $("#txtcidade").val(cidade);
                            $("#txtcomplemento").val(complemento);
                            $("#sltestado").val(estado);


                        },
                        error: function (err) {
                            alert("Erro ao buscar o CEP" + err.toString());
                        }
                    });
                });
            });
        </script>
    </body>
</html>
