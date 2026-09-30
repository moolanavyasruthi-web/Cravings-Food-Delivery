package com.tap.servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.Model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
  protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    String q = req.getParameter("q");
    MenuDAOImpl mdao = new MenuDAOImpl();
    List<Menu> menus = mdao.searchMenu(q);
    
    req.setAttribute("menus", menus);
    req.setAttribute("query", q);
    req.getRequestDispatcher("searchResults.jsp").forward(req, res);
  }
}