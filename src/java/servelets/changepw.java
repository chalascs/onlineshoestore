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
@WebServlet(name = "changepw", urlPatterns = {"/changepw"})
public class changepw extends HttpServlet {

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
            String oldpw = request.getParameter("oldpw");
            String newpw = request.getParameter("newpw");
            String retype = request.getParameter("retype");
            String type = request.getParameter("type");

            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String tel = request.getParameter("tel");
            String email = request.getParameter("email");

            String stid = request.getParameter("stid");

            Session ses = NewHibernateUtil.getSessionFactory().openSession();

            if (type.equals("changepass")) {

                DB.User us1 = (DB.User) request.getSession().getAttribute("user");
                int uuid = us1.getUid();
                Criteria crz = ses.createCriteria(DB.User.class);
                crz.add(Restrictions.eq("uid", uuid));
                DB.User u1 = (DB.User) crz.uniqueResult();
                System.out.println(oldpw + newpw + retype);
                if (u1.getPassword().equals(oldpw)) {
                    if (newpw.equals(retype)) {
                        u1.setPassword(newpw);
                        ses.update(u1);
                        ses.beginTransaction().commit();
                    }
                }

            }
            if (type.equals("updateuser")) {
                DB.User us = (DB.User) request.getSession().getAttribute("user");
                int ui = us.getUid();
                Criteria cr = ses.createCriteria(DB.User.class);
                cr.add(Restrictions.eq("uid", ui));
                DB.User user = (DB.User) cr.uniqueResult();
                user.setFname(fname);
                user.setLname(lname);
                user.setEmail(email);
                user.setTpnumber(Integer.parseInt(tel));
                ses.update(user);
                ses.beginTransaction().commit();
            }
            if (type.equals("activation")) {
                System.out.println(stid);
                Criteria cr = ses.createCriteria(DB.Stock.class);
                cr.add(Restrictions.eq("stid", Integer.parseInt(stid)));
                DB.Stock st = (DB.Stock) cr.uniqueResult();
                int i = st.getStatus();

                if (i == 1) {
                    st.setStatus(0);
                    ses.update(st);
                    ses.beginTransaction().commit();
                } else if (i == 0) {
                    st.setStatus(1);
                    ses.update(st);
                    ses.beginTransaction().commit();
                }
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
