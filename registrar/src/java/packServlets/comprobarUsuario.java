/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package packServlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Andrea
 */

@WebServlet(name = "comprobarUsuario", urlPatterns = {"/comprobarUsuario"})
public class comprobarUsuario extends HttpServlet {

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
        
        HttpSession s = request.getSession(true);
        String correo = (String) request.getParameter("correo");
        String pass = (String) request.getParameter("passw");
        try {
            String contra = codificar(pass);
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(comprobarUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(comprobarUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            Statement sentencia = conexion.createStatement();
            ResultSet rs = sentencia.executeQuery("SELECT * FROM Cliente where correoelectronico='" + correo + "'");
            rs.next();
            if(rs.getRow()==0)
            {
                request.getRequestDispatcher("/iden_regisError.jsp").forward(request, response);
            }
            else
            {
               String passw = rs.getNString("passwd");
               if (passw.equals(pass))
               {
                   request.getRequestDispatcher("/index.jsp").forward(request, response);
               }
               else
               {
                   request.getRequestDispatcher("/iden_regisError.jsp").forward(request, response);
               }
            }   
            sentencia.close();
            } catch (Exception e) {
            System.out.println("No lee de la tabla Paciente de " + baseDeDatos);
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
