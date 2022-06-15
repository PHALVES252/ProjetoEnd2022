<%-- 
    Document   : cadastraritem
    Created on : 15/06/2022, 10:38:18
    Author     : sala303b
--%>
<%@page import="java.util.List"%>
<%@page import="modelo.Itens"%>
<%
    Itens i = new Itens();
    List<Itens> itens = i.ListarTodos();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar item</title>
    </head>
    <body>
        <%
            for (int x = 0; x < 1; x++) {
                out.print("<div class='container'>");
                out.print("<div class='row'>");
                out.print("<div class='col'>");
                out.print(itens.get(x).getTitulo());
                out.print("<img src='../img/baterias.svg' alt='baterias'");
                out.print("</div>");
                out.print("</div>");
                out.print("</div>");
            }
            for (int x = 1; x < 2; x++) {
                out.print("<div class='container'>");
                out.print("<div class='row'>");
                out.print("<div class='col'>");
                out.print(itens.get(x).getTitulo());
                out.print("<img src='../img/eletronicos.svg' alt='baterias'");
                out.print("</div>");
                out.print("</div>");
                out.print("</div>");
            }
        %>
    </body>
</html>
