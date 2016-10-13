/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelets;

import DB.Catagory;
import DB.Size;
import SizePojo.Model;
import connection.NewHibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Shanaka
 */
@WebServlet(name = "stock", urlPatterns = {"/stock"})
public class stock extends HttpServlet {

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

        Session ses = NewHibernateUtil.getSessionFactory().openSession();
        try {

            String id = request.getParameter("id");
            String pname = request.getParameter("pname");
            String price = request.getParameter("price");
            String target = request.getParameter("target");
            String cattype = request.getParameter("cattype");
            String discription = request.getParameter("discription");
            String discount = request.getParameter("discount");
            String code = request.getParameter("code");
            String Type = request.getParameter("Type");

            if (Type.equals("AddToStock")) {
                if (request.getSession().getAttribute("imgPath") == null) {
                    return;
                }

                Criteria cr = ses.createCriteria(DB.Stock.class);
                cr.add(Restrictions.eq("stid", Integer.parseInt(id)));
                DB.Stock crst = (DB.Stock) cr.uniqueResult();
                if (crst != null) {
                } else {
                    DB.Stock st = new DB.Stock();
                    st.setProductName(pname);
                    st.setPrice(Double.parseDouble(price));
                    st.setTargetpop(target);
                    st.setImage((String) request.getSession().getAttribute("imgPath"));
                    st.setDiscription(discription);
                    st.setDiscount(Double.parseDouble(discount));
                    st.setCode(code);

                    Criteria cr1 = ses.createCriteria(DB.Catagory.class);
                    cr1.add(Restrictions.eq("catagory", cattype));
                    Catagory cate = (Catagory) cr1.uniqueResult();
                    st.setCatagory(cate);

                    DB.User uid = (DB.User) request.getSession().getAttribute("user");
                    st.setUser(uid);
                    ses.save(st);

                    ArrayList<Model> al = (ArrayList<Model>) request.getSession().getAttribute("sizes");
                    DB.Size si = new Size();
                    for (Model mo : al) {
                        si.setQty(mo.getQty());
                        si.setSize(mo.getSize());
                        si.setStock(st);

                        ses.save(si);
                    }
                    ses.beginTransaction().commit();
                    response.sendRedirect("addproducts.jsp");

                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ses.clear();
            ses.close();
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
