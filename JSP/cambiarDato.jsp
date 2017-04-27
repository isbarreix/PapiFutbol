<%-- 
    Document   : 
    Created on : 21/02/2016, 13:43:25
    Author     : Iña
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
               <title>PapiFutbol Para Todos</title>
               <link rel="StyleSheet" href="${pageContext.request.contextPath}/CSS/cambiardatoStyle.css" type="text/css">
    </head>
    <body> 
       <h1 align="Center">Pagina Oficial del Papifutbol - Fundación Dr Tangalanga</h1>
       <br><br>
       <%-- hasActionErrors() method is defined in ActionSupport --%>
     
        <s:if test="hasActionMessages()">
            <h2>Se confirmo modificación</h2><hr>
            <div class="confirmated">
                <strong> <s:actionmessage/></strong>
             </div>
        </s:if>
         
        <s:if test="hasActionErrors()">
            <h2>PIRIPITIFLAUTICO!</h2><hr>
            <div class="errors">
                <strong> <s:actionerror/></strong>
            </div>
        </s:if>
            <hr>    
            <br> <br><br> <br>
            <table class="tabButtons" align="center">
                <tr>
                    <td><div class="hlink1"> <s:a action="listado">Ver Listado Partido Fecha</s:a></div></td> 
                    <td><div class="hlink2"><s:a href="/PapiFutbol/JSP/index.jsp"> Volver Pag. Principal</s:a></div></td>
            </tr>
            </table>
    </body>
</html>
