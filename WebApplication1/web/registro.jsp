<%-- 
    Document   : index
    Created on : 25-may-2013, 10:39:14
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
        
    </head>
    <body>
    <div id="a"></div>
    <div id="b">
        <a href="index.jsp">Volver</a>
    </div>
    <div align="center" class="registro">Registrarse</div>
    <form name="registro" id="registro" action="agregarCliente" method="get" />   
    <table align="center" class="datos">
            <tr>
                <td>
                     <br> <br>
                    Nombre 
                <td>
                    <br> <br>
                    <input type="text" size="20px" name="nom" id="nom" />
                </td>
                   
                </td>
                <td width="120">
                    
                </td>
                <td>
                     <br> <br>
                    Apellido 
                <td>
                    <br> <br>
                    <input type="text" size="20px" name="ape" id="ape" /> 
                    </td>
                </td>
                
            </tr>
            <tr>
                <td>
                     <br>
                  Dirección  
                <td>
                     <br>
                    <input type="text" size="20px" name="dire" id="dire" />
                    </td>
                </td>
                <td width="120">
                    
                </td>
                <td>
                     <br>
                    Código posal 
                    <td>
                         <br>
                        <input type="text" size="20px" name="cp" id="cp" />
                    </td>
                </td>
            </tr>
            <tr>
                <td>
                     <br>
                    Provincia 
                <td>
                     <br>
                    <input type="text" size="20px" name="prov" id="prov" />
                </td>
                </td>
                <td width="120">
                    
                </td>
                <td>
                     <br> 
                    DNI 
                    <td>
                         <br>
                        <input type="text" size="20px" name="dni" id="dni" />
                        </td>
                </td>
            </tr>
             <tr>
                <td>
                     <br>
                    Teléfono 
                    <td>
                         <br>
                    <input type="text" size="20px" name="telf" id="telf" />
                    </td>
                </td>
                <td width="120">
                    
                </td>
                <td>
                     <br>
                   Correo electrónico 
                <td>
                     <br>
                     <input type="text" size="20px" name="email" id="email" />
                    </td>
                </td>
            </tr>
            <tr>
                <td>
                     <br>
                    Contraseña 
                    <td>
                         <br>
                         <input type="password" size="20px" name="pass" id="pass" />
                        </td>
                </td>
                
                <td width="120">
                    
                </td>
                <td>
                     <br>
                   Repetir Contaseña 
                   <td>
                        <br>
                        <input type="password" size="20px" name="pass1" id="pass1" />
                       </td>
                </td>
            </tr>
        </table>
    </form>
    <br>
     <div align="center">
        <button class="boton" onclick="valida()">Confirmar datos</button>
        <%--<input type="button" class="boton" value="   Confirmar datos  " onClick="valida()"/> --%>
     </div>
     <div id="pie"></div>
    </body>
</html>

