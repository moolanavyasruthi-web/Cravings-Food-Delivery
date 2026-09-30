package com.tap.servlet;

import java.io.IOException;
import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.Model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/cartServlet")
public class CartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) { cart = new Cart(); session.setAttribute("cart", cart); }

        String action = req.getParameter("action");
        if(action == null) { resp.sendRedirect("cart.jsp"); return; }

        if("cancelSwitch".equals(action)){
            session.removeAttribute("showSwitchPopup");
            session.removeAttribute("pendingMenuId");
            session.removeAttribute("pendingResId");
            resp.sendRedirect("cart.jsp"); return;
        }
        if("forceAdd".equals(action)){
            int menuId = (int) session.getAttribute("pendingMenuId");
            int resId = (int) session.getAttribute("pendingResId");
            cart.clear();
            Menu menu = new MenuDAOImpl().getMenu(menuId); // change to getMenuById if error
            cart.addItem(menu, 1);
            cart.setRestaurantId(resId);
            session.removeAttribute("showSwitchPopup");
            session.removeAttribute("pendingMenuId");
            session.removeAttribute("pendingResId");
            session.setAttribute("cart", cart);
            resp.sendRedirect("cart.jsp"); return;
        }

        try{
            if("add".equals(action)){
                int newResId = Integer.parseInt(req.getParameter("restaurantId"));
                int menuId = Integer.parseInt(req.getParameter("menuId"));
                
                if(cart.getRestaurantId()!=0 && cart.getRestaurantId()!=newResId && !cart.getItems().isEmpty()){
                    session.setAttribute("showSwitchPopup", true);
                    session.setAttribute("pendingMenuId", menuId);
                    session.setAttribute("pendingResId", newResId);
                    resp.sendRedirect("MenuServlet?restaurantId="+newResId);
                    return;
                }
                Menu menu = new MenuDAOImpl().getMenu(menuId);
                cart.addItem(menu, 1);
                cart.setRestaurantId(newResId);
            } else if("update".equals(action)){
                int menuId = Integer.parseInt(req.getParameter("menuId"));
                int qty = Integer.parseInt(req.getParameter("quantity"));
                cart.updateItem(menuId, qty);
                if(cart.getItems().isEmpty()) cart.setRestaurantId(0);
            } else if("delete".equals(action)){
                int menuId = Integer.parseInt(req.getParameter("menuId"));
                cart.deleteItem(menuId);
                if(cart.getItems().isEmpty()) cart.setRestaurantId(0);
            }
            session.setAttribute("cart", cart);
            resp.sendRedirect("cart.jsp");
        }catch(Exception e){
            e.printStackTrace();
            resp.sendRedirect("cart.jsp");
        }
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { doGet(req,resp); }
}