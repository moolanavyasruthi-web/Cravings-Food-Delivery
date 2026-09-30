<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Confirmed - Cravings</title>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap"
	rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif
}

body {
	background: #f8f8f8;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	padding: 20px
}

.card {
	background: white;
	width: 100%;
	max-width: 480px;
	border-radius: 20px;
	padding: 30px;
	text-align: center;
	box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1)
}

.check {
	width: 80px;
	height: 80px;
	background: #e6f7e9;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 auto 15px;
	font-size: 42px;
	animation: pop 0.5s ease
}

@
keyframes pop { 0%{
	transform: scale(0)
}

100
%
{
transform
:
scale(
1
)
}
}
h1 {
	font-size: 24px;
	color: #333;
	margin-bottom: 5px
}

p.sub {
	color: #777;
	font-size: 13px;
	margin-bottom: 15px
}

.delivery-box {
	background: #fff8e1;
	border: 1px dashed #ffb400;
	border-radius: 14px;
	padding: 18px;
	margin: 20px 0
}

.delivery-box h2 {
	font-size: 30px;
	color: #000;
	margin: 5px 0
}

.order-box {
	background: #f9f9f9;
	border-radius: 12px;
	padding: 15px;
	margin: 15px 0;
	text-align: left
}

.order-box div {
	display: flex;
	justify-content: space-between;
	margin: 7px 0;
	font-size: 14px;
	color: #555
}

.order-box div.total {
	border-top: 1px dashed #ddd;
	padding-top: 10px;
	margin-top: 10px;
	font-weight: 700;
	color: #333
}

.progress {
	height: 4px;
	background: #ffe082;
	border-radius: 10px;
	margin-top: 12px;
	overflow: hidden
}

.bar {
	height: 100%;
	width: 0;
	background: #60b246;
	animation: load 2s forwards
}

@
keyframes load {
	to {width: 100%
}

}
.btn {
	display: block;
	width: 100%;
	background: #ef3902;
	color: white;
	padding: 13px;
	border-radius: 50px;
	text-decoration: none;
	font-weight: 700;
	margin-top: 12px;
	text-align: center
}

.btn.sec {
	background: white;
	color: #ff5722;
	border: 1px solid #ffccbc
}
</style>
</head>
<body>
	<%
	Integer orderId = (Integer) session.getAttribute("lastOrderId");
	Float grandTotal = (Float) session.getAttribute("lastGrandTotal");
	String deliveryTime = (String) session.getAttribute("lastDeliveryTime");
	String restaurantName = (String) session.getAttribute("lastRestaurantName");
	String eta = (String) session.getAttribute("lastEta");
	String addr = (String) session.getAttribute("lastAddress");

	if (orderId == null)
		orderId = 1001;
	if (grandTotal == null)
		grandTotal = 0f;
	if (deliveryTime == null)
		deliveryTime = "30 mins";
	if (restaurantName == null)
		restaurantName = "Restaurant";
	if (eta == null)
		eta = "soon";
	if (addr == null)
		addr = "";
	String paymentMethod = (String) session.getAttribute("lastPaymentMethod");
	if (paymentMethod == null)
		paymentMethod = request.getParameter("paymentMethod");
	if (paymentMethod == null)
		paymentMethod = "COD";
	%>
	<div class="card">
		<div class="check">✓</div>
		<h1>Order Confirmed!</h1>
		<p class="sub">
			Your order from <b><%=restaurantName%></b> is placed
		</p>

		<div class="delivery-box">
			<p style="font-size: 12px; color: #666">Your order will be
				delivered in</p>
			<h2>
				🚚
				<%=deliveryTime%></h2>
			<p style="font-size: 13px; color: #333">
				Arriving by <b><%=eta%> today</b>
			</p>
			<p style="font-size: 11px; color: #888; margin-top: 6px">
				📍
				<%=addr%></p>
			<div class="progress">
				<div class="bar"></div>
			</div>
		</div>

		<div class="order-box">
			<div>
				<span>Order ID</span><span>#<%=orderId%></span>
			</div>
			<div>
				<span>Status</span><span style="color: #0a8a00; font-weight: 600">Confirmed</span>
			</div>
			<div>
				<span>Payment</span><span><%=paymentMethod%></span>
			</div>
			<div class="total">
				<span>Amount Paid</span><span>₹<%=grandTotal%></span>
			</div>
		</div>

		<a href="RestaurantServlet" class="btn">Back to Home</a> <a
			href="RestaurantServlet" class="btn sec">Order More</a>
	</div>
</body>
</html>