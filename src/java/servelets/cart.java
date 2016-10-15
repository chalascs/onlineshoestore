/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelets;

import DB.Size;
import DB.Stock;
import connection.NewHibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "cart", urlPatterns = {"/cart"})
public class cart extends HttpServlet {

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
            String stkid = request.getParameter("adcrt");
            String cartPrice = request.getParameter("cartPrice");
            String size = request.getParameter("size");
            String qty = request.getParameter("qty");
            String proID = request.getParameter("proID");
            String Type = request.getParameter("Type");
            String remove = request.getParameter("remove");

            Session ses = NewHibernateUtil.getSessionFactory().openSession();
            if (Type.equals("addtocart")) {

                Stock id = (Stock) ses.load(Stock.class, Integer.parseInt(stkid));
                ArrayList<Stock> ar = null;
                if (request.getSession().getAttribute("cart") != null) {
                    ar = (ArrayList<Stock>) request.getSession().getAttribute("cart");
                    ar.add(id);
                } else {
                    ar = new ArrayList<>();
                    ar.add(id);
                }
                request.getSession().setAttribute("cart", ar);
            } else if (Type.equals("changeQTY")) {
                Stock ss = (Stock) ses.load(DB.Stock.class, Integer.parseInt(proID));
                Criteria cr = ses.createCriteria(DB.Size.class);
                cr.add(Restrictions.and(Restrictions.eq("stock", ss), Restrictions.eq("size", Integer.parseInt(size))));
                DB.Size sz = (DB.Size) cr.uniqueResult();
                if (sz != null) {
                    Double dd = Double.parseDouble(qty);
                    if (sz.getQty() >= dd) {

                        Double total = Double.parseDouble(cartPrice) * dd;
                        out.write("Total-" + total);
                    } else {
                        out.write("Message-QTY Too High");
                    }
                }
            } else if (Type.equals("removeItem")) {
                if (request.getSession().getAttribute("cart") != null) {
                    ArrayList<Stock> st = (ArrayList<Stock>) request.getSession().getAttribute("cart");
                    st.remove(Integer.parseInt(remove));
                }
                out.write("<table class=\"table table-responsive table-condensed\" id=\"table-cart\">");
                out.write("<thead style=\"border: 1px solid #eeee\">");
                out.write("<tr>");
                out.write("<th colspan=\"2\">Product</th>");
                out.write("<th class=\"text-right\">Price</th>");
                out.write("<th class=\"text-right\">Size</th> ");
                out.write("<th class=\"text-right\">Qty</th>");
                out.write("<th class=\"text-right\">Total</th>");
                out.write("</tr>");
                out.write("</thead>");

                if (request.getSession().getAttribute("cart") == null) {

                    out.write("<tr>");
                    out.write("<td class=\"text-center\" colspan=\"6\" style=\"font-family:Helvetica,Arial,sans-serif\">Your cart is empty</td>");
                    out.write("</tr>");
                } else {
                    ArrayList<DB.Stock> st = (ArrayList<Stock>) request.getSession().getAttribute("cart");
                    int ii = 0;
                    for (DB.Stock stk : st) {
                        ii++;

                        out.write("<tr>");
                        out.write("<td class=\"text-center\">");
                        out.write("<div class=\"col-md-2\" style=\"margin-top: 70px;\">");
                        out.write("<input type=\"button\" class=\"btn btn-danger btn-xs\" value=\"X\" onclick=\"remove( " + st.indexOf(stk) + " )\">");
                        out.write("</div>");
                        out.write("<div class=\"col-md-10\">");
                        out.write("<img src=\" " + stk.getImage() + "\" style=\"width: 200px; height: 170px;\">");
                        out.write("</div>");
                        out.write("<td class=\"text-right\">" + stk.getProductName() + "<input type=\"hidden\" id=\"proID" + ii + "\" value=\"" + stk.getStid() + "\"></td>");
                        out.write("<td class=\"text-right\">" + stk.getPrice() + "<input type=\"hidden\" id=\"cartPrice" + ii + "\" value=\"" + stk.getPrice() + "\"></td>");

                        Criteria cr = ses.createCriteria(DB.Size.class);
                        cr.add(Restrictions.eq("stock", stk));

                        out.write("<td class=\"text-right\">");
                        out.write("<select id=\"size" + ii + "\" class=\"\">");

                        List<Size> si = (List<Size>) cr.list();
                        for (DB.Size sz : si) {

                            out.write("<option>" + sz.getSize() + "</option>");
                        }
                        out.write("</select>");
                        out.write("</td>");
                        out.write("<td class=\"text-right\"><input type=\"number\" id=\"abc\" onchange=\"changeQTY(this.value + '-" + ii + "')\"></td>");
                        out.write("<td id=\"cartTortel" + ii + "\" class=\"text-right\"></td>");
                        out.write("</tr>");
                    }
                }
                out.write("</table>");

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
