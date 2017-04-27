<%-- 
    Document   : index
    Created on : 19/02/2016, 04:24:21
    Author     : Iña
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PapiFutbol Para todos</title>
       <link rel="StyleSheet" href="${pageContext.request.contextPath}/CSS/LoginStyle.css" type="text/css">
 
    </head>
    <body>
        <h1 align="Center">Pagina Oficial del Papifutbol - Fundación Dr Tangalanga</h1>
        <br>
        <h2 align="Center"> Ingresar </h2>
        <form action="Login">
        <br>
         <div id="inSquare">
            <div id="Square">
                <br>
                <h3>Soy administrador? <input type="checkBox" name="admin" value="admin" id="admin"></h3>
                    <br>                        
                    <div id="error"> <s:actionerror/>   </div>    
                    <label for="user">Usuario:   </label>      
                    <input type="text" name="user" height="30" id="tuser">
                    <br><br>
                     <label for="" id="admlabel">*Si no eres admin no es necesario contraseña</label>
                     <br><br>
                     <label for="pass">Password:</label>
                     <input class="pass" type="password" name ="pass" id="pass">
                     <br><br><br>
                     <input class="pass" type="submit" value="Ingresar" id="bing">
            </div>
         </div>         
                   <script>
                    var checker = document.getElementById('admin');
                    var passtext = document.getElementById('pass');
                    passtext.disabled=true;
                    checker.onchange = function() {
                        passtext.disabled = !this.checked;
                        if(!this.checked){
                            passtext.value="";
                        }
                    };
                   </script>
                     <%
                    String ruta=session.getServletContext().getRealPath("/");
                    session.setAttribute("path", ruta);
                    %>
        </form>
    </body>
</html>
