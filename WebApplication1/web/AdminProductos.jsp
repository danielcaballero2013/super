<%-- 
    Document   : AdminProductos
    Created on : 25-may-2013, 12:03:14
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Productos</title>
        <link rel="stylesheet" media="all" href="Estilos/estilosProductos.css" type="text/css" />
    </head>
    <body>
        <div id="panelSuperioConfiguracion"><h4 id="tituloSuperior">Panel del productos</h4></div>
         <div id="botonesOpciones">
            <table>
                <tr>
                <select class="contenedor-select">
                    <option class="impar" value ="Volvo">Volvo</option>
                    <option class="par"  value ="Volvo">Volvo</option>
                    <option class="impar"  value ="Volvo">Volvo</option>
                    <option class="par"  value ="Volvo">Volvo</option>
                    
                </select>
                </tr>
                <tr>
                     <td><input  class="boton" type="button" id="botonGestionProductos" value="Alta" /></td>
                     <td><input  class="boton" type="button" id="botonGestionProductos" value="Baja" /></td>
                     <td><input  class="boton" type="button" id="botonGestionProductos" value="Modificac&oacute;n" /></td>
                </tr>
                
            </table>
        </div>
        <div id="decoration"></div>
    </body>
</html>
