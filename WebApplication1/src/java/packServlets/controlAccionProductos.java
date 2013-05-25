/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package packServlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Daniel
 */
@WebServlet(name = "controlAccionProductos", urlPatterns = {"/controlAccionProductos"})
public class controlAccionProductos extends HttpServlet {

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
    Connection con =null;
    
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String botonAlta=(String)request.getParameter("alta");
            String botonBaja=(String)request.getParameter("baja");
            String botonModifi=(String)request.getParameter("modifi");
            String idProducto=(String)request.getParameter("opcionesPro");
            
            
            if(botonBaja.equals("Baja"))
            {
                String dns=new String("jdbc:odbc:supermercado");
                    try
                    {
                        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

                    }
                    catch(ClassNotFoundException cnf)
                    {
                        System.out.println("Error");
                    }

                    try
                    {
                        con= DriverManager.getConnection(dns,"","");
                    }
                    catch(SQLException sqlEx)
                    {
                        System.out.println("Error al conectar");
                    }

                    System.out.println("Iniciando la conexion con la base de datos correctamente");

                            Statement stm=null;
                            ResultSet rs = null;
                            try
                            {
                                stm=con.createStatement();
                                PreparedStatement st = con.prepareStatement("delete from producto where id=?");
                                int pro=Integer.parseInt(idProducto);
                                st.setInt(1,pro);
                                rs=st.executeQuery();
                                con.close();
                            }
                            catch(Exception e)
                            {
                                System.err.println("EOOOOOOOOOOOOOOO");
                            }
                    
                   //getServletContext().getRequestDispatcher("/AdminProductos.jsp").forward(request, response);
            }       response.sendRedirect("AdminProductos.jsp");
//            else
//            {
//                //url modificacion de producto
//            }
        } finally {            
            out.close();
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
}
