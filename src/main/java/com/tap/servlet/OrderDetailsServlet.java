package com.tap.servlet;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.tap.DAOImpl.OrderItemDAOImpl;
import com.tap.DAOImpl.OrderTableDAOImpl;
import com.tap.Model.OrderItem;
import com.tap.Model.OrderTable;
import com.tap.Model.User;

@WebServlet("/orderDetailsServlet")
public class OrderDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if(user == null){ resp.sendRedirect("login.jsp"); return; }

        int orderId = Integer.parseInt(req.getParameter("orderId"));
        
        OrderTable order = new OrderTableDAOImpl().getOrder(orderId);
        List<OrderItem> items = new OrderItemDAOImpl().getOrderItemByOrderId(orderId);
        
        if(order == null || order.getUserId() != user.getUserId()) {
            resp.sendRedirect("orderHistoryServlet");
            return;
        }
        req.setAttribute("order", order);
        req.setAttribute("items", items);
        req.getRequestDispatcher("order_details.jsp").forward(req, resp);
    }
}