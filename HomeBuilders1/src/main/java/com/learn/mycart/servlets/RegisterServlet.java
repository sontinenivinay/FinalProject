package com.learn.mycart.servlets;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            try {

                String userEmail = request.getParameter("user_email");
                String userPassword = request.getParameter("user_password");
                String userPhone = "0";
                String userAddress = request.getParameter("user_address");

                UserDao userDao = new UserDao(FactoryProvider.getFactory());
                User user = userDao.getUserByEmailId(userEmail);

                HttpSession httpSession = request.getSession();

                if (userEmail.isEmpty()) {
                    httpSession.setAttribute("message", "Please enter your email address.");
                    response.sendRedirect("register.jsp");
                    return;
                } else if (userPassword.isEmpty()) {
                    httpSession.setAttribute("message", "Please enter your password.");
                    response.sendRedirect("register.jsp");
                    return;
                } else if (userAddress.isEmpty()) {
                    httpSession.setAttribute("message", "Please enter your Address.");
                    response.sendRedirect("register.jsp");
                    return;
                } else {
                    if (user != null) {
                        httpSession.setAttribute("message", "This email is already registered!!. Please try to login.");
                        response.sendRedirect("register.jsp");
                        return;
                    } else {
                        User newUser = new User("", userEmail, userPassword, userPhone, "default.jpg", userAddress, "normal");
                        Session hibernateSession = FactoryProvider.getFactory().openSession();
                        Transaction tx = hibernateSession.beginTransaction();
                        int userId = (int) hibernateSession.save(newUser);
                        tx.commit();
                        hibernateSession.close();

                        User userRed = userDao.getUserByEmailAndPassword(userEmail, userPassword);

                        if (newUser == null) {
                            httpSession.setAttribute("message", "There was some problem registering you!. Please try again.");
                            response.sendRedirect("register.jsp");
                            return;
                        } else {
                            httpSession.setAttribute("current-user", newUser);
                        }
                        response.sendRedirect("index.jsp");
                        return;
                    }
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
