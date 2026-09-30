package com.tap.servlet;

import java.io.IOException;
import com.tap.DAOImpl.UserDAOImpl;
import com.tap.Model.User;
import org.mindrot.jbcrypt.BCrypt;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{
 @Override
 protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
   String email = req.getParameter("email");
   String password = req.getParameter("password");
   
   if(email == null || password == null || email.isEmpty()){
     resp.sendRedirect("login.jsp?error=Invalid");
     return;
   }
   
   email = email.trim().toLowerCase();
   password = password.trim();
   
   try {
       UserDAOImpl udao = new UserDAOImpl();
       User user = udao.getUserByEmail(email);
       
       System.out.println("Login attempt: " + email);
       System.out.println("User found: " + (user!=null));
       
       if(user != null){
         System.out.println("DB hash: " + user.getPassword());
         boolean match = BCrypt.checkpw(password, user.getPassword());
         System.out.println("Password match: " + match);
         
         if(match){
           HttpSession session = req.getSession(true);
           session.setAttribute("user", user);
           session.setAttribute("userId", user.getUserId());
           session.setAttribute("userName", user.getUserName());
           session.setAttribute("role", user.getRole());
           resp.sendRedirect("RestaurantServlet");
           return;
         }
       }
       resp.sendRedirect("login.jsp?error=Invalid email or password");
   } catch(Exception e){
       e.printStackTrace();
       resp.sendRedirect("login.jsp?error=Server error: "+e.getMessage());
   }
 }
 
 @Override
 protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
   resp.sendRedirect("login.jsp");
 }
}