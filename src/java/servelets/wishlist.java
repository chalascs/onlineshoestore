/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelets;

import DB.Stock;
import DB.User;
import DB.Wishlist;
import connection.NewHibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name = "wishlist", urlPatterns = {"/wishlist"})
public class wishlist extends HttpServlet {

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
            String stkid = request.getParameter("adwl");
            String Type = request.getParameter("Type");

            if (Type.equals("addtowish")) {
//               System.out.println(stkid);
                
                
                
                Wishlist wl = new Wishlist();
                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                Criteria cr = ses.createCriteria(DB.Stock.class);
                cr.add(Restrictions.eq("stid", Integer.parseInt(stkid)));
                DB.Stock st =  (DB.Stock) cr.uniqueResult();
                wl.setStock(st);
                wl.setDate(new SimpleDateFormat("yyyy:MM:dd").format(new Date()));

                DB.User us = (DB.User) request.getSession().getAttribute("user");
                int uid = us.getUid();
                Criteria cr1 = ses.createCriteria(DB.User.class);
                cr1.add(Restrictions.eq("uid", uid));
                DB.User u = (DB.User) cr1.uniqueResult();
                wl.setUser(u);
                
                ses.save(wl);
                ses.beginTransaction().commit();

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
