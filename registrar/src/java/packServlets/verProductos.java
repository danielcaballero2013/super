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
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Set;
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
 * @author Javi
 */
@WebServlet(name = "verProductos", urlPatterns = {"/verProductos"})
public class verProductos extends HttpServlet {

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession s = request.getSession(true);
        String categoria = request.getParameter("name");
        String sub = request.getParameter("sub");
        String nombre = "";
        Double precio;

        Hashtable productos = (Hashtable) s.getAttribute("productos");
        if (productos == null) {
            productos = new Hashtable();
        } else if (productos.size() != 0) {
            productos.clear();
        }

        Statement sentencia;

        sentencia = conexion.createStatement();
        ResultSet rs = sentencia.executeQuery("SELECT * FROM producto where categoria='" + categoria + "' and subcategoria='" + sub + "'");
        
        while (rs.next()) {
            nombre = rs.getString("nombre");
            precio = rs.getDouble("precio");

            productos.put(nombre, precio);

        }

        s.setAttribute("productos", productos);
        response.sendRedirect("index.jsp");

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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(verProductos.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(verProductos.class.getName()).log(Level.SEVERE, null, ex);
        }
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
}
