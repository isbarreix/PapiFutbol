
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PapiFutbol Para todos</title>
         <link rel="StyleSheet" href="${pageContext.request.contextPath}/CSS/SuccessStyle.css" type="text/css">
    </head>
    <body> 
        <br>
        <h1 align="Center" > Bienvenido </h1>
        <br><br>
        <hr>
        <s:actionmessage/> 
        <% if((Boolean)session.getAttribute("admin")) { %>
             <%-- Solo para admin --%>
             <h2 id="hadmin">Genial <s:property value="user"/>, estas listo?</h2>

        <%} else{%>
       
            <h2 id="huser"><p>Que haces pibe?: <s:property value="user"/>, are you ready?</h2>
              
        <%}%>
        <hr>
        <br><br>
            <h3 align="Center"> <s:a action="listado">Ver Listado Partido Fecha</s:a> </h3>
    </body>
</html>