<%-- 
    Document   : index
    Created on : 20-feb-2013, 16:39:58
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Estilos/IndexCSS.css" type="text/css"/>
        <link rel="stylesheet" href="Estilos/jMenu.jquery.css" type="text/css" />
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script type="text/javascript" src="JavaScript/jquery-ui.js"></script>
        <script type="text/javascript" src="JavaScript/jMenu.jquery.js"></script>
        <title>Index</title>

    </head>
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
                            <li><a>Naranjas</a></li>
                            <li><a>Manzanas</a></li>
                            <li><a>Melón</a></li>
                        </ul>
                    </li>
                    <li><a>Pescados</a></li>
                </ul>
            </li>
            <li><a class="fNiv">Lácteos</a><!-- Do not forget the "fNiv" class for the first level links !! -->
                <ul>
                    <li class="arrow"></li>
                    <li><a>Leche</a>
                        <ul>
                            <li><a>Desnatada</a></li>
                            <li><a>Entera</a></li>
                            <li><a>Semidesnatada</a></li>
                        </ul>
                    </li>
                    <li><a>Yogur</a></li>
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
        <script type="text/javascript">
            $(document).ready(function() {
                $("#jMenu").jMenu();
            });
        </script>
    </body>
</html>
