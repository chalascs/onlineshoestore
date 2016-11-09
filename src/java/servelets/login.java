/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelets;

import DB.User;
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
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

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

            String Type = request.getParameter("type");
            String uname = request.getParameter("uname");
            String pass = request.getParameter("pass");
            String where = request.getParameter("logfrom");

            Session s = NewHibernateUtil.getSessionFactory().openSession();

            if (Type.equals("Login")) {

                Criteria cr = s.createCriteria(DB.User.class);
                cr.add(Restrictions.and(Restrictions.eq("email", uname), Restrictions.eq("password", pass)));
                User us = (User) cr.uniqueResult();
                if (us != null) {
                    request.getSession().setAttribute("user", us);
                    if (where.equals("checkout")) {
                        response.sendRedirect("checkout.jsp");
                    } else if(where.equals("signin")){
                        response.sendRedirect("index.jsp");
                    }
                }
            } else if (Type.equals("Logout")) {
                request.getSession().invalidate();
                response.sendRedirect("index.jsp");
            }
//            List<DB.User> loaUsers = cr.list();
//            for(User u : loaUsers){
//                
//                if(uname.equals(u.getEmail()) && pass.equals(u.getPassword())){
//                    request.getSession().setAttribute("user", u.getFname());
//                    response.sendRedirect("index.jsp");
//                }
//            
//            }

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
