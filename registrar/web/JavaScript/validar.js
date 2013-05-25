/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function valida()
{
    if (document.getElementById("nom").value == "") 
    {
        alert ("Faltan datos por introducir");   
    }
    else if(document.getElementById("ape").value == "")
    {
        alert ("Faltan datos por introducir");
    }
    else if(document.getElementById("dni").value == "")
    {
        alert ("Faltan datos por introducir");
    }
    else if(document.getElementById("cp").value == "")
    {
        alert ("Faltan datos por introducir");
    }
    else if(document.getElementById("telf").value == "")
    {
        alert ("Faltan datos por introducir");
    }
    else if(document.getElementById("prov").value == "")
    {
        alert ("Faltan datos por introducir");
    }
    else if(document.getElementById("email").value == "")
    {
        alert ("Faltan datos por introducir");
    }
    else if(document.getElementById("pass").value == "")
    {
        alert ("Faltan datos por introducir");
    }
    else if(document.getElementById("pass1").value == "")
    {
        alert ("Faltan datos por introducir");
    }
    else if (document.getElementById("cp").value.length !== 5)
    {
        alert("Longitud Codigo postal erroneo. Por favor, introduzcalo de nuevo");
        document.getElementById("cp").focus();
    }
    else if(document.getElementById("dni").value.length != 9)
    {
        alert(" Longitud Dni erroneo. Por favor, introduzcalo de nuevo");
        document.getElementById("dni").focus();
    }       
     else if(document.getElementById("telf").value.length != 9)
     {
         alert("Longitud telefono erroneo. Por favor, introduzcalo de nuevo");
         document.getElementById("telf").focus();
     }
   else if((esNumerico(document.getElementById("cp").value))==false)
    {
        alert ("Codigo Postal debe ser numerico");
    }
    else if((esNumerico(document.getElementById("telf").value))==false)
    {
        alert(" Telefono no numerico");
    }
    else if((esCorrectoDNI(document.getElementById("dni").value))==false)
    {
        alert("Dni erroneo. Por favor, introduzcalo de nuevo");
        document.getElementById("dni").focus();
    }
    else if((document.getElementById("pass").value)!=(document.getElementById("pass1").value))
    {
        alert("Las contraseñas no coinciden, introduzcalas de nuevo");
        document.getElementById("pass").focus();
    }
   else
    {
        document.getElementById("registro").submit();
    }
 }

function esNumerico(numero){
    if (!/^([0-9])*$/.test(numero))
        {
            return false;
        }
     else
        {
            return true;
        }
  }

function esCorrectoDNI(dni)
{
    cadena="TRWAGMYFPDXBNJZSQVHLCKET";
    dniNum=parseInt(dni.substring(0,8));
    posicion=dniNum%23;
    letra=cadena.substring(posicion, posicion+1);
    if(dni.substring(8,9)==letra)
        {
            return true;
        }
        else
            return false;
}


