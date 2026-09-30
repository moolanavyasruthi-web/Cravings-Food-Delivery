package com.tap.servlet;

import java.io.IOException;
import org.mindrot.jbcrypt.BCrypt;
import com.tap.DAOImpl.UserDAOImpl;
import com.tap.Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("userName");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String address = req.getParameter("address");
            String phone = req.getParameter("phone");
            String role = req.getParameter("role"); 

            if(email == null || email.trim().isEmpty()){
                resp.getWriter().println("Email empty <a href='register.jsp'>back</a>");
                return;
            }
            email = email.trim().toLowerCase();
            if(role == null || role.trim().isEmpty()) role = "CUSTOMER";

            String hashpwd = BCrypt.hashpw(password, BCrypt.gensalt(12));

            User user = new User();
            user.setUserName(name);
            user.setEmail(email);
            user.setPassword(hashpwd);
            user.setAddress(address);
            user.setPhone(phone);
            user.setRole(role.toUpperCase());

            UserDAOImpl udao = new UserDAOImpl();
            
            int result = udao.addUser(user);
            if (result > 0) {
                resp.sendRedirect("login.jsp?msg=registered");
            } else {
                req.setAttribute("error", "Registration failed");
                req.getRequestDispatcher("register.jsp").forward(req, resp);
            }
        } catch(Exception ex){
            ex.printStackTrace(resp.getWriter());
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}