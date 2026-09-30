<%@ page import="com.tap.Model.*, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Details</title>
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
	box-shadow: 0 2px 10px rgba(0, 0, 0, .1)
}

.nav-logo {
	font-size: 24px;
	font-weight: bold;
	color: #ff5722;
	font-family: cursive
}

.main {
	max-width: 800px;
	margin: 25px auto;
	padding: 0 20px
}

.box {
	background: white;
	border-radius: 16px;
	padding: 20px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, .08);
	margin-bottom: 16px
}

.item {
	display: flex;
	justify-content: space-between;
	padding: 12px 0;
	border-bottom: 1px solid #eee
}

.item:last-child {
	border: none
}

.total-row {
	display: flex;
	justify-content: space-between;
	font-weight: 700;
	font-size: 18px;
	padding-top: 12px;
	color: #ef3902
}

.back {
	color: #ff5722;
	text-decoration: none;
	font-weight: 600
}
</style>
</head>
<body>
	<nav class="navbar">
		<div class="nav-logo">Cravings</div>
		<a class="back" href="orderHistoryServlet">← Back</a>
	</nav>

	<%
	OrderTable order = (OrderTable) request.getAttribute("order");
	List<OrderItem> items = (List<OrderItem>) request.getAttribute("items");
	%>

	<div class="main">
		<div class="box">
			<h3>
				Order #<%=order.getOrderId()%></h3>
			<p style="font-size: 12px; color: #777; margin-top: 4px"><%=order.getOrderDate()%>
				|
				<%=order.getStatus()%>
				|
				<%=order.getPaymentMethod()%></p>
		</div>

		<div class="box">
			<h3 style="margin-bottom: 10px">Items</h3>
			<%
			for (OrderItem it : items) {
			%>
			<div class="item">
				<div>
					Menu #<%=it.getMenuId()%>
					x
					<%=it.getQuantity()%></div>
				<div>
					₹<%=it.getItemTotal()%></div>
			</div>
			<%
			}
			%>
			<div class="total-row">
				<span>Grand Total</span><span>₹<%=order.getTotalAmount()%></span>
			</div>
		</div>
	</div>
</body>
</html>