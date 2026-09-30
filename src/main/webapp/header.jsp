<%@ page import="com.tap.Model.User, com.tap.Model.Cart, com.tap.Model.CartItem" %>
<%
 User navUser = (User) session.getAttribute("user");
 int cartCount = 0;
 try{
   Object cartObj = session.getAttribute("cart");
   if(cartObj != null){
     if(cartObj instanceof Cart){
       Cart c = (Cart) cartObj;
       if(c.getItems() != null){
         for(CartItem item : c.getItems().values()){
           cartCount += item.getQuantity();
         }
       }
     }
   }
 }catch(Exception e){ cartCount = 0; }
%>
<style>
.navbar{display:flex;justify-content:space-between;align-items:center;padding:12px 40px;background:white;box-shadow:0 2px 10px rgba(0,0,0,.08);position:sticky;top:0;z-index:100}
.logo{font-size:24px;font-weight:bold;color:#ff5722;font-family:cursive;text-decoration:none}
.nav-right{display:flex;align-items:center;gap:18px}
.nav-right a{text-decoration:none;color:#333;font-weight:600;font-size:14px}
.cart-badge{background:#ef3902;color:white;border-radius:50%;padding:2px 7px;font-size:11px;margin-left:4px}
</style>
<nav class="navbar">
  <a href="RestaurantServlet" class="logo">Cravings</a>
  <div class="nav-right">
    <% if(navUser != null){ %>
      <span style="font-size:13px;color:#777">Hi, <%=navUser.getUserName()%></span>
      <a href="RestaurantServlet">Home</a>
      <a href="cart.jsp">Cart <% if(cartCount>0){ %><span class="cart-badge"><%=cartCount%></span><% } %></a>
      <a href="orderHistoryServlet">My Orders</a>
      <a href="logout" style="color:#ef3902">Logout</a>
    <% } else { %>
      <a href="login.jsp">Login</a>
      <a href="register.jsp" style="background:#ef3902;color:white;padding:7px 14px;border-radius:20px">Sign Up</a>
    <% } %>
  </div>
</nav>