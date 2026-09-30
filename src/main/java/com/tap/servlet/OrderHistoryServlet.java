package com.tap.servlet;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.tap.DAOImpl.OrderTableDAOImpl;
import com.tap.Model.OrderTable;
import com.tap.Model.User;

@WebServlet("/orderHistoryServlet")
public class OrderHistoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if(user == null){ resp.sendRedirect("login.jsp"); return; }

        List<OrderTable> orders = new OrderTableDAOImpl().getOrdersByUserId(user.getUserId());
        req.setAttribute("orders", orders);
        req.getRequestDispatcher("order_history.jsp").forward(req, resp);
    }
}