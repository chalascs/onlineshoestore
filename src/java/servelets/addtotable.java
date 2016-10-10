/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelets;

import SizePojo.Model;
import com.sun.org.apache.xpath.internal.operations.Mod;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Shanaka
 */
@WebServlet(name = "addtotable", urlPatterns = {"/addtotable"})
public class addtotable extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int size = Integer.parseInt(request.getParameter("size"));
            int qty = Integer.parseInt(request.getParameter("qty"));

            if (request.getParameter("size") != null || request.getParameter("qty") != null) {

                if (request.getSession().getAttribute("sizes") != null) {
                    ArrayList<Model> al = (ArrayList<Model>) request.getSession().getAttribute("sizes");
                    Model m = new Model(size, qty);
                    al.add(m);
                    ArrayList<Model> al1 = (ArrayList<Model>) request.getSession().getAttribute("sizes");

                    out.write("<table class=\"col-md-8 table table-responsive\">");
                    out.write("<tr>");
                    out.write("<th> Size <td>");
                    out.write("<th> QTY <td>");
                    out.write("</tr>");
                    for (Model mo : al1) {
                        out.write("<tr>");
                        out.write("<td>" + mo.getSize() + "<td>");
                        out.write("<td>" + mo.getQty() + "<td>");
                        out.write("</tr>");
                    }
                    out.write("</table>");
                } else {
                    Model m = new Model(size, qty);
                    ArrayList<Model> ar = new ArrayList();
                    ar.add(m);

                    request.getSession().setAttribute("sizes", ar);
                    ArrayList<Model> al = (ArrayList<Model>) request.getSession().getAttribute("sizes");

                    out.write("<table class=\"col-md-8 table table-responsive\">");
                    out.write("<tr>");
                    out.write("<th> Size <td>");
                    out.write("<th> QTY <td>");
                    out.write("</tr>");
                    for (Model mo : al) {
                        out.write("<tr>");
                        out.write("<td>" + mo.getSize() + "<td>");
                        out.write("<td>" + mo.getQty() + "<td>");
                        out.write("</tr>");
                    }
                    out.write("</table>");
                }

            }else{
                Model m = new Model(size, qty);
                    ArrayList<Model> ar = new ArrayList();
                    ar.add(m);

                    request.getSession().setAttribute("sizes", ar);
                    ArrayList<Model> al = (ArrayList<Model>) request.getSession().getAttribute("sizes");

                    out.write("<table class=\"col-md-8 table table-responsive\">");
                    out.write("<tr>");
                    out.write("<th> Size <td>");
                    out.write("<th> QTY <td>");
                    out.write("</tr>");
                    for (Model mo : al) {
                        out.write("<tr>");
                        out.write("<td>" + mo.getSize() + "<td>");
                        out.write("<td>" + mo.getQty() + "<td>");
                        out.write("</tr>");
                    }
                    out.write("</table>");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
