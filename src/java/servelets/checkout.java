/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelets;

import DB.Invoice;
import DB.InvoiceItems;
import DB.Stock;
import connection.NewHibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
//   
            if(request.getSession().getAttribute("user") != null){
            
            Session ses = NewHibernateUtil.getSessionFactory().openSession();
            // checkingout of the database && saving to Invoice Items Table
            ArrayList<DB.Stock> st = (ArrayList<Stock>) request.getSession().getAttribute("cart");
            
            //objects of the table are created here.... 
            DB.Invoice inv = new Invoice();
            DB.InvoiceItems ini = new InvoiceItems();
            
            
            int tot = 0;
            
            for (DB.Stock stk : st) {

                HashMap hm = (HashMap) request.getSession().getAttribute("selectedsize");
                HashMap hm1 = (HashMap) request.getSession().getAttribute("selectedqty");
                String i = stk.getStid().toString();
                
//                System.out.println(hm.get(i));
                Stock ss = (Stock) ses.load(DB.Stock.class, Integer.parseInt(i));
                Criteria cr = ses.createCriteria(DB.Size.class);
                cr.add(Restrictions.and(Restrictions.eq("stock", ss), Restrictions.eq("size", Integer.parseInt((String) hm.get(i)))));
                DB.Size sz = (DB.Size) cr.uniqueResult();
//                int si = (int) hm1.get(stk.getStid().toString());
//                System.out.println(hm1.get(i));
                sz.setQty(sz.getQty() - Integer.parseInt((String) hm1.get(i)));
                ses.update(sz);
//                
                tot += stk.getPrice()*Integer.parseInt((String) hm1.get(i));
                
                
                Criteria cr1 = ses.createCriteria(DB.Stock.class);
                cr1.add(Restrictions.eq("stid", Integer.parseInt(i)));
                DB.Stock stt = (DB.Stock) cr1.uniqueResult();
                ini.setStock(stt);
                
                ini.setInvoice(inv);
                
                
            }
                ses.save(ini);
            System.out.println(tot);
            // saving to invoice table
            
            inv.setTotalPrice(tot);
            
            DB.User us = (DB.User) request.getSession().getAttribute("user");
            int uid = us.getUid();
            Criteria cr = ses.createCriteria(DB.User.class);
            cr.add(Restrictions.eq("uid", uid));
            DB.User u = (DB.User) cr.uniqueResult();
            inv.setUser(u);
            
            inv.setDate(new SimpleDateFormat("yyyy:MM:dd").format(new Date()));
            
            ses.save(inv);
            
            ses.beginTransaction().commit();
            
            }else{
            response.sendRedirect("login.jsp");
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
