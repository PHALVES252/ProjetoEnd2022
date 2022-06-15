<%-- 
    Document   : listar
    Created on : 22/04/2022, 19:58:02
    Author     : carro
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Cliente"%>
<%
    Cliente p = new Cliente();
    List<Cliente> clientes = p.ListarTodos();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

        <title>Hello, world!</title>
    </head>
    <body>

        <div class="container">
            <div class="row">
                <div class="col-md-2">                </div>
                <div class="col-md-8">


                    <table class="table table-bordered">
                        <tr>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>DDD</th>
                            <th>Telefone</th>
                            <th>Documento</th>
                            <th>Cidade</th>
                            <th>Email</th>
                        </tr>
                        <%
                            //for (int i = 0; i < 10; i++) {
                            for (Cliente pr : clientes) {
                                out.print("<tr>");

                                out.print("<td>");
                                out.print(pr.getId());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(pr.getNome());
                                out.print("</td>");
                                
                                out.print("<td>");
                                out.print(pr.getDdd());
                                out.print("</td>");
                                
                                out.print("<td>");
                                out.print(pr.getTelefone());
                                out.print("</td>");
                                
                                out.print("<td>");
                                out.print(pr.getDocumento());
                                out.print("</td>");
                                
                                out.print("<td>");
                                out.print(pr.getCidade());
                                out.print("</td>");
                                
                                out.print("<td>");
                                out.print(pr.getEmail());
                                out.print("</td>");
                                
                                out.print("</tr>");
                            }
                        %>
                    </table>
                </div>
                <div class="col-md-2">                </div>
            </div>
        </div>


        <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.11.2/jquery.mask.js"></script>


    </body>
</html>
