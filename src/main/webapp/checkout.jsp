<%@ page import="com.tap.Model.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Cart cart = (Cart) session.getAttribute("cart");
User user = (User) session.getAttribute("user");
if (user == null) {
	response.sendRedirect("login.jsp?msg=login_first");
	return;
}
if (cart == null || cart.getItems().isEmpty()) {
	response.sendRedirect("cart.jsp");
	return;
}

Float subtotalObj = (Float) session.getAttribute("subtotal");
float subtotal = subtotalObj != null ? subtotalObj : 0.0f;
Float deliveryFeeObj = (Float) session.getAttribute("deliveryFee");
float deliveryFee = deliveryFeeObj != null ? deliveryFeeObj : 0.0f;
Float grandTotalObj = (Float) session.getAttribute("grandTotal");
float grandTotal = grandTotalObj != null ? grandTotalObj : 0.0f;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout - Cravings</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Gill Sans', sans-serif
}

body {
	background: #f8f8f8
}

.navbar {
	display: flex;
	justify-content: space-between;
	padding: 15px 40px;
	background: white;
	box-shadow: 0 2px 10px rgba(0, 0, 0, .1);
	position: sticky;
	top: 0
}

.nav-logo {
	font-size: 24px;
	font-weight: bold;
	color: #ff5722;
	font-family: cursive
}

.main {
	max-width: 1100px;
	margin: 25px auto;
	display: flex;
	gap: 25px;
	padding: 0 20px
}

.left {
	flex: 1.8
}

.right {
	flex: 1
}

.card {
	background: white;
	border-radius: 16px;
	padding: 22px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, .08);
	margin-bottom: 18px
}

.card h2 {
	font-size: 18px;
	margin-bottom: 14px
}

input, select, textarea {
	width: 100%;
	padding: 12px 14px;
	border: 1px solid #ddd;
	border-radius: 10px;
	margin-bottom: 14px;
	font-size: 14px;
	outline: none
}

input:focus, select:focus, textarea:focus {
	border-color: #ff5722
}

.row {
	display: flex;
	justify-content: space-between;
	margin: 10px 0;
	font-size: 14px;
	color: #666
}

.row.total {
	border-top: 1px dashed #ddd;
	margin-top: 14px;
	padding-top: 14px;
	font-weight: 700;
	color: #333;
	font-size: 16px
}

.row.total span:last-child {
	color: #ef3902
}

.checkout {
	width: 100%;
	background: #ef3902;
	color: white;
	border: none;
	padding: 13px;
	border-radius: 50px;
	font-weight: 700;
	font-size: 15px;
	cursor: pointer;
	box-shadow: 0 4px 12px rgba(239, 57, 2, .3)
}

.checkout:hover {
	background: #d93402
}

.item-mini {
	display: flex;
	justify-content: space-between;
	margin: 8px 0;
	font-size: 13px;
	color: #444
}

@media ( max-width :850px) {
	.main {
		flex-direction: column
	}
}
</style>
</head>
<body>
	<nav class="navbar">
		<div class="nav-logo">Cravings</div>
		<div>
			<a href="cart.jsp"
				style="text-decoration: none; color: #333; font-weight: 600">←
				Back to Cart</a>
		</div>
	</nav>

	<div class="main">
		<div class="left">
			<div class="card">
				<h2>Delivery Details</h2>
				<form action="checkoutServlet" method="post" id="checkoutForm">
					<label style="font-size: 13px; color: #666">Full Name</label> <input
						type="text" value="<%=user.getUserName()%>" readonly> <label
						style="font-size: 13px; color: #666">Phone</label> <input
						type="text" value="<%=user.getPhone()%>" readonly> <label
						style="font-size: 13px; color: #666">Delivery Address *</label>
					<textarea name="address" rows="3" required
						placeholder="House No, Street, Area, City"></textarea>
					<label style="font-size: 13px; color: #666">Payment Method</label>
					<select name="paymentMode" required>
						<option value="COD">Cash on Delivery</option>
						<option value="UPI">UPI / GPay / PhonePe</option>
						<option value="CARD">Credit / Debit Card</option>
					</select>
					<button class="checkout" type="submit">
						Place Order - ₹<%=grandTotal%></button>
				</form>
			</div>
		</div>

		<div class="right">
			<div class="card">
				<h2>
					Order Summary (<%=cart.getItems().size()%>
					items)
				</h2>
				<%
				for (CartItem ci : cart.getItems().values()) {
				%>
				<div class="item-mini">
					<span><%=ci.getItemName()%> x <%=ci.getQuantity()%></span><span>₹<%=ci.getPrice() * ci.getQuantity()%></span>
				</div>
				<%
				}
				%>
				<div class="row">
					<span>Subtotal</span><span>₹<%=subtotal%></span>
				</div>
				<div class="row">
					<span>Delivery Fee</span><span><%=deliveryFee == 0 ? "FREE" : "₹" + (int) deliveryFee%></span>
				</div>
				<div class="row total">
					<span>Payable Amount</span><span>₹<%=grandTotal%></span>
				</div>
				<p
					style="text-align: center; font-size: 11px; color: #888; margin-top: 12px">🔒
					Safe & Secure</p>
			</div>
		</div>
	</div>
</body>
</html>