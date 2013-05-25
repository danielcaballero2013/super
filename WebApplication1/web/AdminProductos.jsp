<%-- 
    Document   : AdminProductos
    Created on : 25-may-2013, 12:03:14
    Author     : Daniel
--%>
<%@page import="com.sun.crypto.provider.RSACipher"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Productos</title>
        <link rel="stylesheet" media="all" href="Estilos/estilosProductos.css" type="text/css" />
    </head>
    <body>
         <%
              
        Connection con = null;
        String url=new String("jdbc:odbc:supermercado");
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con=DriverManager.getConnection(url,"","");
        Statement st = con.createStatement();
        ResultSet rs=null;
        rs=st.executeQuery("select id,nombre from producto;");
        %>
        <div id="panelSuperioConfiguracion"><h4 id="tituloSuperior">Panel del productos</h4></div>
         <div id="botonesOpciones">
            <table>
                <tr>
                     <select class="contenedor-select">
                    <% 
                        int id;
                        String nombre;
                        int contador=1;
                        String par="";
                        while(rs.next())
                        {
                            id=rs.getInt("id");
                            nombre=rs.getString("nombre");
                            if(contador%2==0)
                            {
                                par="par";
                            }
                            else
                            {
                                par="impar";
                            }
                            contador++;
                        
                    %>
               
                    <option class="<%= par%>" value ="<%= id%>"><%= nombre%></option>
                    
                    <% } %>   
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
