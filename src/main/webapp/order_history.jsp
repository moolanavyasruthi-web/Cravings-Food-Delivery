<%@ page import="com.tap.Model.OrderTable, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Orders - Cravings</title>
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
	max-width: 900px;
	margin: 25px auto;
	padding: 0 20px
}

.card {
	background: white;
	border-radius: 16px;
	padding: 20px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, .08);
	margin-bottom: 16px;
	display: flex;
	justify-content: space-between;
	align-items: center
}

.card:hover {
	box-shadow: 0 6px 20px rgba(0, 0, 0, .12)
}

.left h3 {
	font-size: 16px;
	color: #333
}

.left p {
	font-size: 12px;
	color: #777;
	margin-top: 4px
}

.status {
	padding: 5px 12px;
	border-radius: 20px;
	font-size: 12px;
	font-weight: 700;
	background: #e6f7e9;
	color: #0a8a00
}

.total {
	font-weight: 700;
	color: #ef3902;
	font-size: 16px
}

.view {
	margin-top: 8px;
	display: inline-block;
	text-decoration: none;
	color: #ff5722;
	font-weight: 600;
	font-size: 13px
}

.empty {
	text-align: center;
	padding: 80px 20px;
	background: white;
	border-radius: 16px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, .08)
}
</style>
</head>
<body>
	<nav class="navbar">
		<div class="nav-logo">Cravings</div>
		<div>
			<a href="RestaurantServlet"
				style="text-decoration: none; color: #333; font-weight: 600">Home</a>
		</div>
	</nav>

	<div class="main">
		<h2 style="margin-bottom: 18px">My Orders</h2>
		<%
		List<OrderTable> orders = (List<OrderTable>) request.getAttribute("orders");
		if (orders != null && !orders.isEmpty()) {
			for (OrderTable o : orders) {
		%>
		<div class="card">
			<div class="left">
				<h3>
					Order #<%=o.getOrderId()%>
					- Restaurant #<%=o.getRestaurantId()%></h3>
				<p><%=o.getOrderDate()%>
					|
					<%=o.getPaymentMethod()%></p>
				<a class="view"
					href="orderDetailsServlet?orderId=<%=o.getOrderId()%>">View
					Details →</a>
			</div>
			<div style="text-align: right">
				<div class="status"><%=o.getStatus()%></div>
				<div class="total" style="margin-top: 8px">
					₹<%=o.getTotalAmount()%></div>
			</div>
		</div>
		<%
		}
		} else {
		%>
		<div class="empty">
			<div style="font-size: 50px">📦</div>
			<h2>No Orders Yet</h2>
			<p style="color: #777; margin: 8px 0 20px">You haven't placed any
				orders</p>
			<a href="RestaurantServlet"
				style="background: #ef3902; color: white; padding: 10px 24px; border-radius: 50px; text-decoration: none; font-weight: 700">Browse
				Restaurants</a>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>