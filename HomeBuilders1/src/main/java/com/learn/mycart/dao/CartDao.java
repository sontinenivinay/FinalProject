package com.learn.mycart.dao;

import com.learn.mycart.entities.Cart;
import com.learn.mycart.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CartDao {

    private SessionFactory factory;

    public CartDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveProduct(Cart orders) {
        boolean f = false;
        try {

            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();

            session.save(orders);

            tx.commit();
            session.close();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
            f = false;
        }

        return f;
    }

    public boolean qtyUp(int cartId) {
        boolean f = false;
        try {

            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();

            Cart cart = session.load(Cart.class, cartId);
            int qty = cart.getQty();

            if (qty < 10) {

                qty += 1;
                cart.setQty(qty);
                session.update(cart);
            }

            tx.commit();
            session.close();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
            f = false;
        }
        return f;
    }

    public boolean qtyDown(int cartId) {
        boolean f = false;
        try {

            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();

            Cart cart = session.load(Cart.class, cartId);
            int qty = cart.getQty();

            if (qty > 1) {
                qty -= 1;
                cart.setQty(qty);
                session.update(cart);
            }

            tx.commit();
            session.close();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
            f = false;
        }
        return f;
    }

    //get all products
    public List<Product> getAllProducts() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product");
        List<Product> list = query.list();
        return list;
    }

    //get all  orders by given userId
    public List<Cart> getCartProductsByUserId(int uid) {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Cart where userId=: uid and orderStatus=:orderStatus");
        query.setParameter("uid", uid);
        query.setParameter("orderStatus", 0);
        List<Cart> list = query.list();
        return list;
    }

    public List<Cart> getOrdersProductsByUserId(int uid) {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Cart where userId=: uid and orderStatus=:orderStatus");
        query.setParameter("uid", uid);
        query.setParameter("orderStatus", 1);
        List<Cart> list = query.list();
        return list;
    }

}
