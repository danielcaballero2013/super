/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function comprobarDatos()
{
    alert("aaaaaaaaaaaa");
     if (document.getElementById("correo").value == "") 
        {
            alert ("Por favor introduce tu direccion de email");  
            document.getElementById("correo").focus();
        }
     else if (document.getElementById("passw").value == "") 
        {
            alert ("Por favor introduce tu contraseña");  
            document.getElementById("passw").focus();  
        }
    else
        {
            document.getElementById("entrada").submit();
        }
}
