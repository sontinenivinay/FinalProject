package com.learn.mycart.servlets;

import com.learn.mycart.entities.Cart;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Math.log;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.ScrollableResults;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;

public class CartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            if (request.getParameter("AddToCart") != null) {
                try {

                    int userId = Integer.parseInt(request.getParameter("userId"));
                    int prodId = Integer.parseInt(request.getParameter("prodId"));
                    int qty = 1;
                    int price = Integer.parseInt(request.getParameter("price"));
                    String prodName = request.getParameter("prodName");
                    Cart cart = new Cart(prodId, prodName, userId, qty, price);
                    Session hibernateSession = FactoryProvider.getFactory().openSession();
                    Transaction tx = hibernateSession.beginTransaction();
                    int orderId = (int) hibernateSession.save(cart);
                    tx.commit();
                    hibernateSession.close();
                    HttpSession httpSession = request.getSession();
                    response.sendRedirect("cart.jsp");
                    return;

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            
            if (request.getParameter("buyNow") != null) {

                int userId = Integer.parseInt(request.getParameter("userId"));

                try {
                    Transaction tx = null;
                    Session sess = FactoryProvider.getFactory().openSession();
                    tx = sess.beginTransaction();

                    Query q = sess.createQuery("update Cart set orderStatus=:n where userId=:i");
                    q.setParameter("n", 1);
                    q.setParameter("i", userId);

                    int status = q.executeUpdate();
                    System.out.println(status);

                    tx.commit();
                    sess.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }

                try {
                    String userAdd = request.getParameter("userAddress");
                    if (userAdd == "" || userAdd == null) {
                        userAdd = "IT is null";
                    }
                    Session sess = FactoryProvider.getFactory().openSession();
                    Transaction tx = null;
                    tx = sess.beginTransaction();

                    Query q = sess.createQuery("update User set user_address=:n where user_id=:i");
                    q.setParameter("n", userAdd);
                    q.setParameter("i", userId);

                    int status = q.executeUpdate();
                    System.out.println(status);

                    tx.commit();
                    sess.close();
                    response.sendRedirect("orderSuccess.jsp");
                    return;
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }

            if (request.getParameter("qtyUp") != null) {
                int cartId = Integer.parseInt(request.getParameter("cartId"));
                try {

                    Session session = FactoryProvider.getFactory().openSession();
                    Transaction tx = session.beginTransaction();

                    Cart cart = session.load(Cart.class, cartId);
                    int qty = cart.getQty();
                    int cartPrice = cart.getPrice();
                    int price = cartPrice / qty;

                    if (qty < 10) {

                        qty += 1;
                        cartPrice = qty * price;
                        cart.setQty(qty);
                        cart.setPrice(cartPrice);
                        session.update(cart);
                    }

                    tx.commit();
                    session.close();
                    response.sendRedirect("cart.jsp");

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            if (request.getParameter("qtyDown") != null) {
                int cartId = Integer.parseInt(request.getParameter("cartId"));
                try {

                    Session session = FactoryProvider.getFactory().openSession();
                    Transaction tx = session.beginTransaction();

                    Cart cart = session.load(Cart.class, cartId);
                    int qty = cart.getQty();
                    int cartPrice = cart.getPrice();
                    int price = cartPrice / qty;

                    if (qty > 1) {

                        qty -= 1;
                        cartPrice = qty * price;
                        cart.setQty(qty);
                        cart.setPrice(cartPrice);
                        session.update(cart);
                    }

                    tx.commit();
                    session.close();
                    response.sendRedirect("cart.jsp");

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            if (request.getParameter("removeCartProduct") != null) {

                int cartId = Integer.parseInt(request.getParameter("cartId"));

                try {
                    Transaction tx = null;
                    Session sess = FactoryProvider.getFactory().openSession();
                    tx = sess.beginTransaction();

                    Query q = sess.createQuery("Delete from Cart where cartId=:cartId");
                    q.setParameter("cartId", cartId);

                    int status = q.executeUpdate();
                    System.out.println(status);

                    tx.commit();
                    sess.close();
                    response.sendRedirect("cart.jsp");
                } catch (Exception e) {
                    e.printStackTrace();
                }
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
