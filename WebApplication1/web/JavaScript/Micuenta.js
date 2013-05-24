/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function activarCambiarNombre(elemento)
{
    if(elemento==1)
        {
            var nombre= document.getElementById("txtNombreID");
            nombre.disabled = false;
            nombre.value="";
        }
    if(elemento==2)
        {
            var apellidos= document.getElementById("cambiarApellidos");
            apellidos.disabled = false;
            apellidos.value="";
        }
}


