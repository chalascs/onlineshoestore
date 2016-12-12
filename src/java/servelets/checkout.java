/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servelets;

import DB.Invoice;
import DB.Stock;
import connection.NewHibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "checkout", urlPatterns = {"/checkout"})
public class checkout extends HttpServlet {

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
            int stid =Integer.parseInt( request.getParameter("stid"));
            String size = request.getParameter("size").trim();
            String qty = request.getParameter("qty");
            System.out.println(qty);
            System.out.println(stid);
            System.out.println(size);
            
            Session ses = NewHibernateUtil.getSessionFactory().openSession();
            Stock ss = (Stock) ses.load(DB.Stock.class, stid);
            Criteria cr = ses.createCriteria(DB.Size.class);
            cr.add(Restrictions.and(Restrictions.eq("stock", ss), Restrictions.eq("size", Integer.parseInt(size))));
            DB.Size sz = (DB.Size) cr.uniqueResult();
            
            sz.setQty(sz.getQty() - Integer.parseInt(qty));
            ses.update(sz);
            
            DB.Invoice inv = new Invoice();
            inv.setTotalPrice(stid);
            
            ses.beginTransaction().commit();
            
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
