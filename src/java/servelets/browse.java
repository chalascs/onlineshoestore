/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelets;

import DB.Stock;
import connection.NewHibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Shanaka
 */
@WebServlet(name = "browse", urlPatterns = {"/browse"})
public class browse extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            String women = request.getParameter("women");

            if (women.equals("women")) {
//                Session ses = NewHibernateUtil.getSessionFactory().openSession();
//                Criteria cr = ses.createCriteria(DB.Stock.class);
//                cr.add(Restrictions.eq("targetpop", women));
//                List<Stock> l1 = cr.list();
//                for (Stock st1 : l1) {
//
//                    
//                    out.write("<div class=\"col-sm-6 col-md-3\" style=\"text-align: center\">");
//                    out.write("<div class=\"thumbnail\" style=\"background-color: #eee; border-radius: 20px;\">");
//                    out.write("<img src=\""+st1.getImage() +"\" alt=\"shoes\" style=\"border-radius: 20px;\">");
//                    out.write("<div class=\"caption\">");
//                    out.write("<h3 id=\"pname\"> "+st1.getProductName() +" </h3>");
//                    out.write("<p> "+st1.getDiscription()+"</p>");
//                    out.write("<p><a  class=\"btn btn-success\" role=\"button\" id=\"adcrt\" onclick=\"addtocart()\">Buy Now</a></p>");
//                    out.write("</div>");
//                    out.write("</div>");
//                    out.write("</div>");
//                   
               // }
            }

        } catch (Exception e) {
            e.printStackTrace();
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
