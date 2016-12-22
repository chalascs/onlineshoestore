/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelets;

import DB.Adds;
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
@WebServlet(name = "admin", urlPatterns = {"/admin"})
public class admin extends HttpServlet {

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
            System.out.println("awa..");
            String uid = request.getParameter("uid");
            String type = request.getParameter("type");
            String search = request.getParameter("search");
            String pid = request.getParameter("pid");
            String invid = request.getParameter("invid");
            String uname = request.getParameter("uname");
            String pword = request.getParameter("pword");
            String userid = request.getParameter("userid");

            Session ses = NewHibernateUtil.getSessionFactory().openSession();

            if (type.equals("userActivation")) {
                Criteria cr = ses.createCriteria(DB.User.class);
                cr.add(Restrictions.eq("uid", Integer.parseInt(uid)));
                DB.User u = (DB.User) cr.uniqueResult();
                int i = u.getStatus();
                if (i == 1) {
                    u.setStatus(2);
                } else if (i == 2) {
                    u.setStatus(1);
                }
                ses.update(u);
                ses.beginTransaction().commit();
            }
            if (type.equals("sellerinfo")) {
                Criteria cr = ses.createCriteria(DB.User.class);
                cr.add(Restrictions.eq("uid", Integer.parseInt(uid)));
                DB.User u = (DB.User) cr.uniqueResult();
                int i = u.getStatus();
                if (i == 1) {
                    u.setStatus(2);
                } else if (i == 2) {
                    u.setStatus(1);
                }
                ses.update(u);
                ses.beginTransaction().commit();

            }
            if (type.equals("selinfo")) {
                out.write("<table class=\"table table-hover table-responsive\">");
                out.write("<thead>");
                out.write("<tr>");
                out.write("<td>Image</td>");
                out.write("<td>Product</td>");
                out.write("<td>Buyer</td>");
                out.write("<td>Price</td>");
                out.write("<td>Quantity</td>");
                out.write("<td>Total</td>");
                out.write("</tr>");
                out.write("</thead>");

                Criteria crr = ses.createCriteria(DB.User.class);
                crr.add(Restrictions.eq("uid", Integer.parseInt(userid)));
                DB.User uzr = (User) crr.uniqueResult();

                Criteria cri = ses.createCriteria(DB.Stock.class);
                cri.add(Restrictions.eq("user", uzr));
                List<DB.Stock> sttt = cri.list();
                int iv = 0;
                for (DB.Stock syt : sttt) {

                    Criteria ce = ses.createCriteria(DB.Orders.class);
                    ce.add(Restrictions.eq("stock", syt));
                    List<DB.Orders> lll = ce.list();
                    for (DB.Orders oo : lll) {

                        out.write("<tr>");
                        out.write("<td><img src=\"" + oo.getStock().getImage() + "\" class=\"img-rounded img-responsive\" width=\"70px;\" height=\"70px;\"> </td>");
                        out.write("<td>" + oo.getStock().getProductName() + "</td>");
                        out.write("<td>" + oo.getUser().getFname() + " " + oo.getUser().getLname() + "</td>");
                        out.write("<td>" + oo.getStock().getPrice() + "</td>");
                        out.write("<td>" + oo.getQty() + "</td>");
                        out.write("<td>" + oo.getStock().getPrice() * oo.getQty() + "</td>");
                        out.write("</tr>");
                        iv += oo.getStock().getPrice() * oo.getQty();
                        out.write("</table>");
                    }
                }
            }

            if (type.equals("searchProduct")) {
                Criteria cr = ses.createCriteria(DB.Stock.class);
                cr.add(Restrictions.eq("productName", search));
                DB.Stock st = (DB.Stock) cr.uniqueResult();
                int i = st.getStatus();
                out.write(" <table class=\"table table-responsive table-bordered table-hover table-responsive\">");
                out.write("<thead>");
                out.write("<tr>");
                out.write("<td>Image</td>");
                out.write("<td>Product</td>");
                out.write("<td>Price</td>");
                out.write("<td>Status</td>");
                out.write("<td>Action</td>");
                out.write("</tr>");
                out.write("</thead>");
                out.write("<tr>");
                out.write("<td><img src=\"" + st.getImage() + "\" class=\"img-circle img-responsive\" height=\"70px;\" width=\"70px;\"></td>");
                out.write("<td>" + st.getProductName() + "</td>");
                out.write("<td>" + st.getPrice() + "</td>");
                if (i == 1) {
                    out.write("<td id=\"one\">Active <span class=\"fa fa-check-circle text-success\"></span> </td>");
                } else if (i == 0) {
                    out.write("<td id=\"one\">Deactivated<span class=\"fa fa-times-circle text-danger\"></span> </td>");
                }
                if (i == 1) {
                    out.write("<td>Deactivate? <input type=\"checkbox\" class=\"checkbox-inline\" onclick=\"product(" + st.getStid() + ")\"> <i class=\"fa fa-times-circle text-danger\"></i></td>");
                } else if (i == 0) {
                    out.write("<td>Activate? <input type=\"checkbox\" class=\"checkbox-inline\" onclick=\"product(" + st.getStid() + ")\"> <i class=\"fa fa-check-circle text-success\"></i></td>");
                }
                out.write("</tr>");
                out.write("</table>");
            }
            if (type.equals("prodActivation")) {
                System.out.println("awa");
                Criteria cr = ses.createCriteria(DB.Stock.class);
                cr.add(Restrictions.eq("stid", Integer.parseInt(pid)));
                DB.Stock st = (DB.Stock) cr.uniqueResult();
                int i = st.getStatus();

                if (i == 1) {
                    st.setStatus(0);
                } else if (i == 0) {
                    st.setStatus(1);
                }
                ses.update(st);
                ses.beginTransaction().commit();

                out.write(" <table class=\"table table-responsive table-bordered table-hover table-responsive\">");
                out.write("<thead>");
                out.write("<tr>");
                out.write("<td>Image</td>");
                out.write("<td>Product</td>");
                out.write("<td>Price</td>");
                out.write("<td>Status</td>");
                out.write("<td>Action</td>");
                out.write("</tr>");
                out.write("</thead>");
                out.write("<tr>");
                out.write("<td><img src=\"" + st.getImage() + "\" class=\"img-circle img-responsive\" height=\"70px;\" width=\"70px;\"></td>");
                out.write("<td>" + st.getProductName() + "</td>");
                out.write("<td>" + st.getPrice() + "</td>");
                if (i == 1) {
                    out.write("<td id=\"one\">Active <span class=\"fa fa-check-circle text-success\"></span> </td>");
                } else if (i == 0) {
                    out.write("<td id=\"one\">Deactivated<span class=\"fa fa-times-circle text-danger\"></span> </td>");
                }
                if (i == 1) {
                    out.write("<td>Deactivate? <input type=\"checkbox\" class=\"checkbox-inline\" onclick=\"product(" + st.getStid() + ")\"> <i class=\"fa fa-times-circle text-danger\"></i></td>");
                } else if (i == 0) {
                    out.write("<td>Activate? <input type=\"checkbox\" class=\"checkbox-inline\" onclick=\"product(" + st.getStid() + ")\"> <i class=\"fa fa-check-circle text-success\"></i></td>");
                }
                out.write("</tr>");
                out.write("</table>");
            }

            if (type.equals("userHistory")) {
                System.out.println("awaaaaaa");
                Criteria cr2 = ses.createCriteria(DB.User.class);
                cr2.add(Restrictions.eq("uid", Integer.parseInt(uid)));
                DB.User us = (DB.User) cr2.uniqueResult();

                Criteria cr = ses.createCriteria(DB.Invoice.class);
                cr.add(Restrictions.eq("user", us));
                List<DB.Invoice> in = cr.list();
                out.write("<table class=\"table table-responsive table-striped\">");
                out.write("<thead>");
                out.write("<tr>");
                out.write("<td>Date</td>");
                out.write("<td>Invoice ID</td>");
                out.write("<td>Total</td>");
                out.write("</tr>");
                out.write("</thead>");
                for (DB.Invoice inv : in) {
                    out.write("<tr onclick=\"proinfo(" + inv.getInvoiceId() + ")\" href=\"#prodinfo\" data-toggle=\"tab\">");
                    out.write("<td>" + inv.getDate() + "</td>");
                    out.write("<td>" + inv.getInvoiceId() + "</td>");
                    out.write("<td>" + inv.getTotalPrice() + "</td>");
                    out.write("</tr>");

                }
            }

            if (type.equals("invoicesproducts")) {

                Criteria cr1 = ses.createCriteria(DB.Invoice.class);
                cr1.add(Restrictions.eq("invoiceId", Integer.parseInt(invid)));
                DB.Invoice in = (DB.Invoice) cr1.uniqueResult();

                Criteria cr = ses.createCriteria(DB.InvoiceItems.class);
                cr.add(Restrictions.eq("invoice", in));
                List<DB.InvoiceItems> li = cr.list();

                out.write("<table class=\"table table-striped table-responsive\">");
                out.write("<thead>");
                out.write("<tr>");
                out.write("<td>Image</td>");
                out.write("<td>product Name</td>");
                out.write("<td>Quantity</td>");
                out.write("</tr>");
                out.write("</thead>");

                for (DB.InvoiceItems inv : li) {
                    System.out.println("hi");
                    out.write("<tr>");
                    out.write("<td><img src=\"" + inv.getStock().getImage() + "\" class=\"img-responsive img-circle\" width=\"70px;\" height=\"70px;\"</td>");
                    out.write("<td>" + inv.getStock().getProductName() + "</td>");
                    out.write("<td>" + inv.getQty() + "</td>");
                    out.write("</tr>");

                }
                out.write("</table>");

            }
            System.out.println(type);
            if (type.equals("SuperAdmin")) {
                System.out.println("asaasa");
                Criteria cr = ses.createCriteria(DB.Admin.class);
                cr.add(Restrictions.and(Restrictions.eq("uname", uname), Restrictions.eq("pass", pword)));
                DB.Admin ad = (DB.Admin) cr.uniqueResult();
                if (ad != null) {
                    response.sendRedirect("admin.jsp");

                    request.getSession().setAttribute("admin", ad);

                }else if(ad == null){
                    response.sendRedirect("sadminlogin.jsp?user=inval");
                }
            }
//            } else {
//                response.sendRedirect("sadminlogin.jsp?user=inval");
//            }
            if (type.equals("Logout")) {
                System.out.println("log");
                request.getSession().invalidate();
                response.sendRedirect("sadminlogin.jsp");
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
