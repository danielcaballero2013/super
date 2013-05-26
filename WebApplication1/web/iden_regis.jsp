<%-- 
    Document   : iden_regis
    Created on : 25-may-2013, 16:39:30
    Author     : Andrea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Estilos/plantilla.css" type="text/css"/>
        <link rel="stylesheet" href="Estilos/EstiloRegistro.css" type="text/css"/>
        <script type="text/javascript" src="JavaScript/validar.js"></script>
        <script type="text/javascript" src="JS/confirmar.js"></script>
        <script type="text/javascript" src="JS/confirmar.js"></script>
        <script type="text/javascript" src="JS/registrar.js"></script>
        <script type="text/javascript" src="JS/ingresar.js"></script>
        
        
    </head>
    <body>
    <div id="a"></div>
    <div id="b"></div>
    
    </head>
    <body>
        <br><br><br>
        
        <table align="center" >
        <thead style ="background-color: #0B9AFF">
            <tr>
                <th class="login" style="width: 500px">Clientes Existentes</th>
                <th class="login" style="width: 500px">Nuevos Clientes - Registrarse Aquí</th> 
            </tr>
        </thead>
        <tbody style ="background-color: #CEE3F6">
        <br>
        
        <td  class="datos" align="center" >
            <form name="entrada" id="entrada" action="comprobarUsuario" method="get" /> 
            <br>
            Tu dirección de email:
            <br>
            <input type="text" size="50px" name="correo" id="correo" />
            <br><br>
            Contraseña:
            <br>
            <input type="password" size="50px" name="passw" id="passw" />
            <br><br>
            <button class="boton" onclick="comprobarDatos()">Ingresar</button>
            </form>
            <br><br>
        </td>
       <td align="center">
            <form name="regis" id="regis" action="registro.jsp" method="post">
            <button class="boton" onclick="irRegistro()">Registrarse</button>
            </form>
        </td>
        
        </tbody>
    </table>
       
        <div id="pie"></div>
    </body>
</html>
