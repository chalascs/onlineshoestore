/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelets;

import DB.Address;
import DB.City;
import DB.Province;
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
@WebServlet(name = "address", urlPatterns = {"/address"})
public class address extends HttpServlet {

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
//            System.out.println("called");
            String add1 = request.getParameter("add1");
            String add2 = request.getParameter("add2");
            String province = request.getParameter("province");
            String district = request.getParameter("district");
            String city = request.getParameter("city");
            String type = request.getParameter("type");

//            System.out.println(add1);
            if (type.equals("save")) {
                
                System.out.println(add1 + add2 + province + district + city);

                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                DB.User us = (DB.User) request.getSession().getAttribute("user");
                int uid = us.getUid();
                Criteria cr = ses.createCriteria(DB.User.class);
                cr.add(Restrictions.eq("uid", uid));
                DB.User u = (DB.User) cr.uniqueResult();

                DB.Address ad = new Address();

                ad.setUser(u);
                ad.setAddress1(add1);
                ad.setAddress2(add2);

                Criteria cr1 = ses.createCriteria(DB.Province.class);
                cr1.add(Restrictions.eq("province", province));
                DB.Province p = (DB.Province) cr1.uniqueResult();
                ad.setProvince(p);

                Criteria cr2 = ses.createCriteria(DB.District.class);
                cr2.add(Restrictions.eq("district", district));
                DB.District d = (DB.District) cr2.uniqueResult();
                ad.setDistrict(d);

                Criteria cr4 = ses.createCriteria(DB.City.class);
                cr4.add(Restrictions.eq("cityname", city));
                DB.City ctt = (DB.City) cr4.uniqueResult();
                ad.setCity(ctt);
                
                ses.save(ad);
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
