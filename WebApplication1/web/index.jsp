<%-- 
    Document   : index
    Created on : 20-feb-2013, 16:39:58
    Author     : Daniel
--%>

<%@page import="java.util.Hashtable"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Estilos/IndexCSS.css" type="text/css"/>
        <link rel="stylesheet" href="Estilos/jMenu.jquery.css" type="text/css" />
        <link rel="Stylesheet" type="text/css" href="Estilos/smoothDivScroll.css" />
        <script type="text/javascript" src="JavaScript/indexJSP.js"></script>

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script type="text/javascript" src="JavaScript/jquery-ui.js"></script>
        <script type="text/javascript" src="JavaScript/jMenu.jquery.js"></script>

        <script src="JavaScript/jquery-ui-1.8.23.custom.min.js" type="text/javascript"></script>
        <script src="JavaScript/jquery.mousewheel.min.js" type="text/javascript"></script>
        <script src="JavaScript/jquery.kinetic.js" type="text/javascript"></script>
        <script src="JavaScript/jquery.smoothdivscroll-1.3-min.js" type="text/javascript"></script>
        <title>Index</title>


    </head>

    <% HttpSession s = request.getSession(true);%>
    <body>
        <div id="cabecera1">
            <h4 id="nombreUsuario">//NOMBRE DE USUARIO</h4>
        </div>
        <ul id="jMenu">
            <li><a class="fNiv">Alimentos Frescos</a><!-- Do not forget the "fNiv" class for the first level links !! -->
                <ul>
                    <li class="arrow"></li>
                    <li><a>Verduras</a>
                        <ul>
                            <li><a href="vProd?name=manzanas">Manzanas</a></li>
                            <li><a href="vProd?name=melon">Melón</a></li>
                        </ul>
                    </li>
                    <li><a> Pescados </a></li>
                </ul>
            </li>
            <li><a class="fNiv"> Limpieza </a><!-- Do not forget the "fNiv" class for the first level links !! -->
                <ul>
                    <li class="arrow"></li>
                    <li><a>Bolsa de Basura</a>
                        <ul>
                            <li><a href="vProd?name=limpieza&sub=pequeña">Pequeñas</a></li>
                            <li><a href="vProd?name=limpieza&sub=30">30L</a></li>
                            <li><a href="vProd?name=limpieza&sub=50">50L</a></li>
                        </ul>
                    </li>
                    <li><a href="vProd?name=limpieza&sub=lejia">Lejía</a></li>
                    <li><a href="vProd?name=limpieza&sub=utiles">Útiles de limpieza</a></li>
                </ul>
            </li>
            <li><a class="fNiv">Helados</a><!-- Do not forget the "fNiv" class for the first level links !! -->
                <ul>
                    <li class="arrow"></li>
                    <li><a>Category 1.2</a>
                        <ul>
                            <li><a>Category 1.3</a></li>
                            <li><a>Category 1.3</a></li>
                            <li><a>Category 1.3</a></li>
                        </ul>
                    </li>
                    <li><a>Category 1.2</a></li>
                </ul>
            </li>
            <li><a class="fNiv">Conservas</a><!-- Do not forget the "fNiv" class for the first level links !! -->
                <ul>
                    <li class="arrow"></li>
                    <li><a>Category 1.2</a>
                        <ul>
                            <li><a>Bombón</a></li>
                            <li><a>Tarrina</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li><a class="fNiv">Dulces</a><!-- Do not forget the "fNiv" class for the first level links !! -->
                <ul>
                    <li class="arrow"></li>
                    <li><a>Category 1.2</a>
                        <ul>
                            <li><a>Category 1.3</a></li>
                            <li><a>Category 1.3</a></li>
                            <li><a>Category 1.3</a></li>
                        </ul>
                    </li>
                    <li><a>Category 1.2</a></li>
                </ul>
            </li>
        </ul>
        <div id="cabecera2">

        </div>
        </br>
        </br>

        <div id="makeMeScrollable">
            <img src="Imagenes/images/demo/1.jpg" alt="Demo image" id="imga" />
            <img src="Imagenes/images/demo/2.jpg" alt="Demo image" id="imga" />
            <img src="Imagenes/images/demo/3.jpg" alt="Demo image" id="imga" />
            <img src="Imagenes/images/demo/5.jpg" alt="Demo image" id="imga" />
            <img src="Imagenes/images/demo/6.jpg" alt="Demo image" id="imga" />
            <img src="Imagenes/images/demo/7.jpg" alt="Demo image" id="imga" />
            <img src="Imagenes/images/demo/8.jpg" alt="Demo image" id="imga" />
        </div>
        <div id="central">
            <%-- <hr id="linea"></hr> --%>

            <% Hashtable productos = (Hashtable) s.getAttribute("productos");
                if (productos != null) {%>
            <form name="producto" action="aCarrito">

                <% Set p = productos.keySet();
                    Iterator it = p.iterator();
                    while (it.hasNext()) {
                        String nom = (String) it.next();
                        Double prec = (Double) productos.get(nom);%>

                <div id="centro">
                    <table>
                        <tr rowspan="2">
                            <td>
                                <img src="Imagenes/images/Imagenes/<%= nom%>.jpg" alt="Demo image" id="imga" />
                            </td>
                            <td id="tabla">
                                <p id="precio"> Precio </p>
                                <p> <%= prec%> € </p>
                                <button name="nombre" value="<%= nom%>" action="" >Añadir al carro</button>
                                <%-- <input type="submit" value=""> --%>
                            </td>
                        </tr>

                    </table>
                </div>

                <%}
                    }%>
            </form>
            
        </div>
            <div id="pie">
            
        </div>
        <script type="text/javascript">
            $(document).ready(function() {
                $("#jMenu").jMenu();
            });
        </script>

        <script type="text/javascript">
            // Initialize the plugin with no custom options
            $(document).ready(function () {              
                // None of the options are set
                $("div#makeMeScrollable").smoothDivScroll({   
                    autoScrollingMode: "onStart"
                });
            });
        </script>

    </body>
</html>
