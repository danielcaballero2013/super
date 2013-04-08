/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function valida()
{
    if (document.getElementById("nom").value === "") 
        {
            alert ("Faltan datos por introducir");
        }
        else if(document.getElementById("ape").value === "")
            {
                alert ("Faltan datos por introducir");
            }
        
    else if((!esNumerico(document.getElementById("cp").value))||(document.getElementById("cp").value.length !== 5))
                {
                    alert("Código postal erroneo. Por favor, introdúzcalo de nuevo");
                    document.getElementById("cp").focus();
                }
    else if((!esCorrectoDNI(document.getElementById("dni").value))||(document.getElementById("dni").value.length !== 9))
                {
                    alert("Dni erroneo. Por favor, introdúzcalo de nuevo");
                    document.getElementById("dni").focus();
                }
     else if((!esNumerico(document.getElementById("telf").value))||(document.getElementById("cp").value.length !== 9))
                {
                    alert("Código postal erroneo. Por favor, introdúzcalo de nuevo");
                    document.getElementById("cp").focus();
                }
     else
         {
              alert ("aaaaa");
         }
        
}

function esNumerico(cp)
{
    var validos="0123456789";
    var ok="si";
    var temp;
    for(var i=0; i<cp.length;i++)
        {
            temp= " " + cp.value.substring(i,i+1);
            if(validos.indexOf(temp)==="-1")
                {
                    ok="no";
                }
        }
    if(ok==="no")
        {
            return false;
        }
     return true;
}
function esCorrectoDNI(dni)
{
    cadena="TRWAGMYFPDXBNJZSQVHLCKET";
    dniNum=parseInt(dni.substring(0,8));
    posicion=dniNum%23;
    letra=cadena.substring(posicion, posicion+1);
    if(dni.substring(8,9)===letra)
        {
            return true;
        }
        else
            return false;
}


