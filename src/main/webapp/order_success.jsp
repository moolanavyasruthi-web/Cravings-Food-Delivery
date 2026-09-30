<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Placed - Cravings</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Gill Sans', sans-serif
}

body {
	background: #f8f8f8;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh
}

.card {
	background: white;
	padding: 40px 30px;
	border-radius: 20px;
	text-align: center;
	box-shadow: 0 10px 30px rgba(0, 0, 0, .08);
	max-width: 420px;
	width: 90%
}

.icon {
	width: 80px;
	height: 80px;
	background: #e6f7e9;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 40px;
	margin: 0 auto 18px
}

h1 {
	color: #333;
	font-size: 22px;
	margin-bottom: 8px
}

p {
	color: #666;
	font-size: 14px;
	margin-bottom: 20px;
	line-height: 1.5
}

.btn {
	display: inline-block;
	background: #ef3902;
	color: white;
	padding: 12px 26px;
	border-radius: 50px;
	text-decoration: none;
	font-weight: 700;
	margin: 6px;
	box-shadow: 0 4px 12px rgba(239, 57, 2, .3)
}

.btn.sec {
	background: white;
	color: #ef3902;
	border: 1px solid #ffccbc;
	box-shadow: none
}
</style>
</head>
<body>
	<div class="card">
		<div class="icon">✓</div>
		<h1>Order Placed Successfully!</h1>
		<p>
			Thank you for ordering from <b>Cravings</b>.<br>Order ID: <b>#<%=request.getParameter("orderId")%></b><br>Your
			food is being prepared and will be delivered soon!
		</p>
		<a href="RestaurantServlet" class="btn">Order More</a> <a
			href="orderHistoryServlet" class="btn sec">My Orders</a>
	</div>
</body>
</html>