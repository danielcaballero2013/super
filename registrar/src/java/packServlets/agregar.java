/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package packServlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
//import java.util.logging.Level;
//import java.util.logging.Logger;

/**
 *
 * @author Andrea
 */
@WebServlet(name = "agregar", urlPatterns = {"/agregar"})
public class agregar extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private String baseDeDatos;
    private Connection conexion;
    
    

    public void init(ServletConfig cfg) throws ServletException {
       super.init(cfg);
        
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            baseDeDatos = "jdbc:odbc:supermercado";
            conexion = DriverManager.getConnection(baseDeDatos);
            System.out.println("Se ha conectado a " + baseDeDatos);
        } catch (Exception e) {
            System.out.println("No se ha conectado a " + baseDeDatos);
            throw new ServletException(e.getMessage());
        }
    }
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
    response.setContentType("text/html;charset=UTF-8");
    
    HttpSession s = request.getSession(true);
    String nombre = (String) request.getParameter("nom");
    String apellido = (String) request.getParameter("ape");
    String direccion = (String) request.getParameter("dire");
    String codigoPostal = (String) request.getParameter("cp");
    String provincia = (String) request.getParameter("prov");
    String dni = (String) request.getParameter("dni");
    String telefono = (String) request.getParameter("telf");
    String email = (String) request.getParameter("email");
    String contra = (String) request.getParameter("pass");
    String pass = codificar(contra);
    
    
     try 
      {
        Statement sentencia = conexion.createStatement();
        sentencia.executeUpdate("INSERT INTO CLIENTE (dni, nombre, apellido, direccion, correoelectronico, provincia, telefono, passwd, codpostal)"
                + " VALUES ('"+dni+"','"+nombre+"','"+apellido+"','"+direccion+"','"+email+"','"+provincia+"','"+telefono+"','"+pass+"','"+codigoPostal+"')");
        
      } 
      catch (Exception e) {
            System.err.println(e) ;
            //return false;
        }
    
    PrintWriter out = response.getWriter();
    request.getRequestDispatcher("/index.jsp").forward(request, response);
}       catch (UnsupportedEncodingException ex) {
            Logger.getLogger(agregar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(agregar.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

     public String codificar( String pClave ) throws UnsupportedEncodingException, NoSuchAlgorithmException
	{
		MessageDigest md = MessageDigest.getInstance("MD5");
				
		//Indicamos los caracteres contenidos en la clave y su longitud.
	
		md.update(pClave.getBytes("UTF-8"), 0, pClave.length());
	
		//Debido a que la clase MessageDigest devuelve el valor como un vector de bytes, deberemos realizar el siguiente proceso para transformar bytes–>BigInteger–>String
	
		byte[] bt = md.digest();
	
		BigInteger bi = new BigInteger(1, bt);
	
		String md5 = bi.toString(16);  //16 por hexadecimal.
		
		return md5;
	}

}
