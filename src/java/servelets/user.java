/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelets;

import DB.User;
import DB.UserType;
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
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Shanaka
 */
@WebServlet(name = "user", urlPatterns = {"/user"})
public class user extends HttpServlet {

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
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            String pword = request.getParameter("pword");
            String retrypw = request.getParameter("retrypword");
            String utype = request.getParameter("who");

            int tp = Integer.parseInt(request.getParameter("tpnumber"));

            try {
                Session s = NewHibernateUtil.getSessionFactory().openSession();
                if (pword.equals(retrypw)) {
                    DB.User u = new User();
                    u.setFname(fname);
                    u.setLname(lname);
                    u.setEmail(email);
                    u.setTpnumber(tp);
                    u.setPassword(pword);
                    if (utype.equals("I'm a buyer")) {
                        Criteria cr = s.createCriteria(DB.UserType.class);
                        cr.add(Restrictions.eq("userType", "buyer"));
                        UserType ut = (UserType) cr.uniqueResult();
                        u.setUserType(ut);
                    } else if (utype.equals("I'm a seller")) {
                        Criteria cr1 = s.createCriteria(DB.UserType.class);
                        cr1.add(Restrictions.eq("userType", "seller"));
                        UserType ut = (UserType) cr1.uniqueResult();
                        u.setUserType(ut);
                    }
                    u.setStatus(1);
                    s.save(u);
                    s.beginTransaction().commit();
                    
                    response.sendRedirect("login.jsp");

                } else {
                    response.sendRedirect("createAnAccount.jsp");
                }

            } catch (Exception e) {
                e.printStackTrace();
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
