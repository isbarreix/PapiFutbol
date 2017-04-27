<%-- 
    Document   : home
    Created on : 24/02/2016, 03:33:15
    Author     : Iña
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
               <title>PapiFutbol Para todos</title>
               <link rel="StyleSheet" href="${pageContext.request.contextPath}/CSS/IndexStyle.css" type="text/css">
    </head>
    <body> 
       <h1 align="Center">Pagina oficial del Papifutbol - Fundación Dr Tangalanga</h1>
      <div id="menu">
          <br><br>
   <div class="hlink1"><s:a action="listado">Ver Partido de Fecha</s:a></div>
   <br>
   <div class="hlink2"><a href="/PapiFutbol/JSP/whowa.jsp" >¿Quienes somos?</a></div>
   <br>
   <div class="hlink3"><a href="/PapiFutbol/JSP/login.jsp" >Ingresar</a></div>
      </div>

    </body>
</html>
