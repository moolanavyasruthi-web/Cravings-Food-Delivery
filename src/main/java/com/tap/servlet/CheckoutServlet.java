package com.tap.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.tap.DAOImpl.OrderItemDAOImpl;
import com.tap.DAOImpl.OrderTableDAOImpl;
import com.tap.Model.*;

@WebServlet("/checkoutServlet")
public class CheckoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) session.getAttribute("user");

        if(user == null){ resp.sendRedirect("login.jsp?msg=login_first"); return; }
        if(cart == null || cart.getItems().isEmpty()){ resp.sendRedirect("cart.jsp"); return; }

        String address = req.getParameter("address"); // you can add address column later
        String paymentMode = req.getParameter("paymentMode");

        float grandTotal = (float) session.getAttribute("grandTotal");

        OrderTable order = new OrderTable();
        order.setUserId(user.getUserId());
        order.setRestaurantId(cart.getRestaurantId());
        order.setOrderDate(Timestamp.valueOf(LocalDateTime.now()));
        order.setTotalAmount(grandTotal);
        order.setStatus("PLACED");
        order.setPaymentMethod(paymentMode);

        OrderTableDAOImpl orderDAO = new OrderTableDAOImpl();
        int orderId = orderDAO.addOrder(order);

        System.out.println("Checkout OrderId = " + orderId);

        if(orderId > 0){
            OrderItemDAOImpl itemDAO = new OrderItemDAOImpl();
            for(CartItem ci : cart.getItems().values()){
                OrderItem oi = new OrderItem();
                oi.setOrderId(orderId);
                oi.setMenuId(ci.getMenuId());
                oi.setQuantity(ci.getQuantity());
                oi.setItemTotal(ci.getPrice() * ci.getQuantity());
                itemDAO.addOrderItem(oi);
            }
            cart.clear();
            session.setAttribute("cart", cart);
            resp.sendRedirect("order_success.jsp?orderId="+orderId);
        } else {
            resp.sendRedirect("cart.jsp?msg=order_failed");
        }
    }
}