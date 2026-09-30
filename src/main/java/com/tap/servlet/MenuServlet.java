package com.tap.servlet;
import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.Model.Menu;
import com.tap.Model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	MenuDAOImpl mdao = new MenuDAOImpl();
    	RestaurantDAOImpl rdao = new RestaurantDAOImpl();
    	
        int resId = Integer.parseInt(req.getParameter("restaurantId"));
        List<Menu> allMenu = mdao.getAllMenuByRestaurant(resId);
        Restaurant res = rdao.getRestaurant(resId);
        req.setAttribute("allMenu", allMenu);
        req.setAttribute("res", res);
        HttpSession session = req.getSession();
        req.setAttribute("showSwitchPopup", session.getAttribute("showSwitchPopup"));
        req.setAttribute("pendingMenuId", session.getAttribute("pendingMenuId"));
        req.setAttribute("pendingResId", session.getAttribute("pendingResId"));
        // clear after showing once
        session.removeAttribute("showSwitchPopup");
        req.getRequestDispatcher("menu.jsp").forward(req, resp);
    }
}