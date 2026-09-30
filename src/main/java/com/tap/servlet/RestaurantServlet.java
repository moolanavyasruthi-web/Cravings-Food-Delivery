package com.tap.servlet;

import java.io.IOException;
import java.util.List;
import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.Model.Restaurant;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/RestaurantServlet")
public class RestaurantServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("user") == null) {
			resp.sendRedirect("login.jsp?error=Please login first");
			return;
		}
		RestaurantDAOImpl rdao = new RestaurantDAOImpl();
		List<Restaurant> restaurants = rdao.getAllRestaurants();
		req.setAttribute("restaurants", restaurants);
		req.getRequestDispatcher("Restaurant.jsp").forward(req, resp); // <-- CHANGE HERE
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}