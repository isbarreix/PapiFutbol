<%-- 
    Document   : listadoPartido
    Created on : 25/02/2016, 00:32:57
    Author     : Iñaki Barreix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PapiFutbol Para todos</title>
        <link rel="StyleSheet" href="${pageContext.request.contextPath}/CSS/ListadoStyle.css" type="text/css">
    </head>
    <body>
        
        <h1 align="Center">Pagina Oficial del Papifutbol - Fundación Dr Tangalanga</h1>
        
        
        <h2 align="Center"> Partido De La Fecha </h2>
        
        
        
            
        <span id="sfecha">     
        Fecha: <strong><s:property value="partido.dia" /></strong></span>
        <% if(session.getAttribute("usuario")!=null &&(Boolean)session.getAttribute("admin")) { %>
         <%-- Solo para admin --%>
            <form action="cambiarFecha" id="cambiarFecha" class="cambiarFecha">
                <table><tr>
                    <td><input  type="text" name="partido.Dia" var="srtDia" id="mifecha" maxlength="10" placeholder="dd/mm/yyyy" onkeypress="return isNumber(event)" onkeyup="formatDay()"></td>          
                    <td><input  type="submit" value="Cambiar Fecha!" id="bcambiarFecha" disabled="true"></td>   
                  </tr> </table> 
            </form>
        <%}%>
         <br>
        <span id="shora">Hora: <strong><s:property value="partido.hora"/></strong> </span>
        <% if(session.getAttribute("usuario")!=null &&(Boolean)session.getAttribute("admin")) { %>
         <%-- Solo para admin --%>
            <form action="cambiarFecha">
                <table><tr>
                    <td><input type="text" name="partido.Hora" var="srtHora" id="mihora" maxlength="5" placeholder="hh:mm" onkeypress="return isNumber(event)" onkeyup="formatHour()"></td>
                    <td><input type="submit" value="Cambiar Hora!" id="bcambiarHora" disabled="true"></td>
                 </tr> </table>
            </form>
        <%}%>
         <br>
         
        <span id="slugar">Lugar: <strong><s:property value="partido.lugar" /></strong></span>
        <% if(session.getAttribute("usuario")!=null &&(Boolean)session.getAttribute("admin")) { %>
            <%-- Solo para admin --%>
           <form action="cambiarLugar">
                 <table><tr>
                         <td><input type="text" name="partido.lugar" id="milugar" onkeypress="return isNotComma(event)" onkeyup="switchLugar()"></td>
                         <td><input type="submit" value="Cambiar Lugar!" id="bcambiarLugar" disabled="true"></td>
                     </tr></table>  
          </form>
        <%}%>
       <br>
        <span id="sprecio">Precio por persona: $<strong><s:property value="partido.precio" /></strong></span>
        <% if(session.getAttribute("usuario")!=null &&(Boolean)session.getAttribute("admin")) { %>
            <%-- Solo para admin --%>
          <form action="cambiarPrecio">
                <table><tr>
                    <td><input type="text" name="partido.precio" id="miprecio" maxlength="5" onkeypress="return isNumber(event)" onkeyup="switchPrecio()"></td>
                    <td><input type="submit" value="Cambiar Precio!" id="bcambiarPrecio" disabled="true"></td>
               </tr></table>
         </form>
        <%}%>
        
        
        <br>
        <span id="smaxj">Max. jugadores: <strong><s:property value="partido.cantJugadores" /> / </strong>
                Anotados: <strong><s:property value="players.size" /></strong> </span>
        <% if(session.getAttribute("usuario")!=null &&(Boolean)session.getAttribute("admin")) { %>
         <%-- Solo para admin --%>
            <form action="cambiarCantJugadores">
                <table><tr>
                        <td><input type="text" name="partido.cantJugadores" id="micant" maxlength="2" onkeypress="return isNumber(event)"onkeyup="switchCantJug()"></td>
                        <td><input type="submit" value="Cambiar Max. Jugadores!" id="bcambiarCant" disabled="true"></td>
                </tr></table>
           </form>
        <%}%>
        <h4 align="Center"> Lista de partido </h4>
        <table class="listaJug" id="listaJug">
            <tr><th>Nombre</th></tr>
            <ul> 
               <s:iterator value="players" var="jugador">
                   <tr><td><s:property value="jugador"/></td></tr>
                </s:iterator>
            </ul>  
       </table>
        <% if(session.getAttribute("usuario")!=null &&(Boolean)session.getAttribute("admin")) { %>
            <%-- Solo para admin --%>
            <br><br><br>
            <form action="eliminarJugador">
                <table id="tdremove"><tr>
                        <td>Eliminar a:  <input type="text" name="id" id="id" placeholder="-" readonly="readonly" >  ?</td>
                    <td>  <input type="submit" value="Eliminar"></td>
               </tr> </table>
           </form>
        <%}%>
     
     <% if(session.getAttribute("usuario")!=null){ %>
         <%-- Solo para admin y usuarios registrados--%>
        <br><br>
        <form action="agregarJugador">
             <table id="tadd"><tr>   
              <td> Agregarme como: <h7><%= session.getAttribute("usuario")%></h7>? </td>
                 <td>   <input type="submit" value="Agregarme" id="badd"></td>
             
       </tr></table>
         </form>
     <%}%>
     <br><br><br><br>
           <table class="tabButtons" align="center">
                <tr>
                    <% if(session.getAttribute("usuario")==null){ %>
                        <td><div class="hlink1"><a href="/PapiFutbol/JSP/login.jsp" >Ingresar</a></div></td> 
                    <%}%>
                    <td><div class="hlink2"><s:a href="/PapiFutbol/JSP/index.jsp"> Volver Pag. Principal</s:a></div></td>
            </tr>
      
           </table>
     
    <script>
    function isNumber(evt) {
        evt = (evt) ? evt : window.event;
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
            return true;
    }     
    </script>
    <script>
      function formatDay() {
        var inp = document.getElementById('mifecha');
        var but= document.getElementById('bcambiarFecha');
        if(inp.value.length===2 || inp.value.length===5)
            inp.value=inp.value+'/';           
        else
            if(inp.value.length===10)
                //comprobamos que la fecha sea valida
                    if (isValidate(inp.value))
                        but.disabled=false;
                    else{//mostramos cartel CAMBIAR
                        window.alert("fecha: "+inp.value+" no es válida");
                        inp.value="";
                    }
            else
                but.disabled = true;
    }      
      function isValidate(dateString){
        // Separamos todo
        var parts = dateString.split("/");
        var day = parseInt(parts[0], 10);
        var month = parseInt(parts[1], 10);
        var year = parseInt(parts[2], 10);
        // Verificamos el año y meses validos.
        if(year < 1000 || year > 3000 || month === 0 || month > 12)
            return false;

        var monthLength = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];

        // Años viciestos
        if(year % 400 === 0 || (year % 100 !== 0 && year % 4 === 0))
            monthLength[1] = 29;
        // rango del dia
        return day > 0 && day <= monthLength[month - 1];
    }
    
    </script>
    <script>
        function formatHour() {
            var inp = document.getElementById('mihora');
            var but= document.getElementById('bcambiarHora');
            if(inp.value.length===2)
                inp.value=inp.value+':';
            else
                if(inp.value.length===5)
                    if(isValidateH(inp.value))
                        but.disabled=false;
                    else{
                        window.alert("HORA INVALIDA");
                        inp.value="";
                    }
                else
                    but.disabled=true;
        }

        function isValidateH(dateString){
            // Separamos todo
            var parts = dateString.split(":");
            var hour = parseInt(parts[0], 10);
            var min = parseInt(parts[1], 10);
            if((min>=0 && min<=60)&&(hour>=0 && hour<=24) )
                return true;
            else
                return false;
        }
    </script>
    <script>
        function switchLugar() {   
            var inp = document.getElementById('milugar');
            var but= document.getElementById('bcambiarLugar');
            if(inp.value.length===0)
                but.disabled=true;
            else
                but.disabled=false;
        }
    </script>
    <script>
        function switchPrecio(){
            var inptext=document.getElementById('miprecio');
            var but= document.getElementById('bcambiarPrecio');         
            if(inptext.value.length===0)
                but.disabled=true;
            else
                but.disabled=false;
        }
    </script>
    <script>
        function switchCantJug(){
            var inptext=document.getElementById('micant');
            var but= document.getElementById('bcambiarCant');
            if(inptext.value.length===0)
                but.disabled=true;
            else
                but.disabled=false;
        }
    </script>
     <script>
        function isNotComma(evt){
        evt = (evt) ? evt : window.event;
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode===44) {
            return false;
        }
            return true;
        }         
    </script>
    <script>
        var table = document.getElementById('listaJug');
        var cells = table.getElementsByTagName("td");  
        for(var i = 0; i <= cells.length; i++){
            cells[i].addEventListener('click', clickHandler);
        }
        // detectamos la celda o lbl que se tocó
        function clickHandler(){
            document.getElementById("id").value=this.textContent;
        }
          
    </script>
    <script type="text/javascript"> 
        function stopRKey(evt) { 
        var evt = (evt) ? evt : ((event) ? event : null); 
        var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
        if ((evt.keyCode === 13) && (node.type==="text"))  {return false;} 
        } 

        document.onkeypress = stopRKey; 
    </script>
        
    </body>
</html>
