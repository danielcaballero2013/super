<%-- 
    Document   : MiCuenta
    Created on : 20-feb-2013, 17:31:26
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mi cuenta</title>
        <link rel="stylesheet" href="Estilos/EstiloMiCuenta.css" type="text/css"/>
    </head>
    <body>
       <div id="cabecera1">
           <h4 id="nombreUsuario">Bienvenido nombre usuario</h4>
    </div>
        <div id="cabecera2">
       
       </div>
        
        <div id="tablaDatos">
            <table>
                <tr>
                    <td colspan="3">
                    <h4>Panel de configuraci&oacute;n</h4>
                </td>
                </tr>
                <tr>
                    <td class="cabecerasTabla">
                        <h5 class="estilosCabecerasTabla">Nombre</h5>
                    </td>
                    <td>
                        <input disabled="true" class="inp" type="text" id="txtNombre" name="tNombre" value="Nombre" />
                    </td>
                    <td>
                        <a href="#">Cambiar</a>
                    </td>
                </tr>
                <tr>
                    <td class="cabecerasTabla">
                        <h5 class="estilosCabecerasTabla">Apellidos</h5>
                    </td>
                    <td>
                        <input disabled="true" class="inp" type="text" id="txtApellidos" name="tApellidos" value="Apellidos" />
                    </td>
                    <td>
                        <a href="#">Cambiar</a>
                    </td>
                </tr>
               
            </table>
        </div>
      
     
           <div id="pie">
            
        </div>
    </body>
</html>
