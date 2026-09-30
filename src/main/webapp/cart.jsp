<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tap.Model.Cart, com.tap.Model.CartItem"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cart - Cravings</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS',
		sans-serif
}

body {
	background: #f8f8f8;
	color: #333
}

.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px 40px;
	background: white;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	position: sticky;
	top: 0;
	z-index: 100
}

.nav-logo {
	font-size: 24px;
	font-weight: bold;
	color: #ff5722;
	font-family: cursive
}

.nav-right {
	display: flex;
	gap: 30px
}

.nav-right a {
	text-decoration: none;
	color: #333;
	font-weight: 500;
	font-family: sans-serif
}

.nav-right a:hover {
	color: #ff5722
}

.nav-right a.active {
	color: #ff5722;
	font-weight: 700
}

.cart-count {
	background: #ef3902;
	color: white;
	padding: 2px 7px;
	border-radius: 50%;
	font-size: 11px;
	margin-left: 3px
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

.page-title {
	max-width: 1100px;
	margin: 20px auto 0;
	padding: 0 20px
}

.page-title h1 {
	font-size: 26px;
	color: #333
}

.page-title p {
	font-size: 13px;
	color: #666;
	margin-top: 4px
}

.card {
	background: white;
	border-radius: 16px;
	padding: 20px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
	margin-bottom: 18px
}

.res-head {
	display: flex;
	gap: 12px;
	align-items: center;
	padding-bottom: 14px;
	border-bottom: 1px solid #eee;
	margin-bottom: 10px
}

.res-icon {
	width: 48px;
	height: 48px;
	background: #fff2ef;
	border-radius: 10px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 24px
}

.res-head h3 {
	font-size: 17px;
	color: #333
}

.res-head p {
	font-size: 12px;
	color: #777;
	margin-top: 2px
}

.item {
	display: flex;
	gap: 14px;
	align-items: center;
	padding: 16px 0;
	border-bottom: 1px dashed #eee
}

.item:last-child {
	border: none
}

.item-img {
	width: 80px;
	height: 80px;
	border-radius: 12px;
	object-fit: cover;
	background: #f5f5f5;
	cursor: pointer
}

.i-details {
	flex: 1
}

.i-top {
	display: flex;
	gap: 8px;
	align-items: center
}

.veg {
	width: 14px;
	height: 14px;
	border: 1px solid #0a8a00;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 2px
}

.dot {
	width: 6px;
	height: 6px;
	background: #0a8a00;
	border-radius: 50%
}

.veg.non {
	border-color: #e53935
}

.dot.non {
	background: #e53935
}

.name {
	font-size: 15px;
	font-weight: 600;
	color: #333;
	text-decoration: none;
	cursor: pointer
}

.name:hover {
	color: #ff5722
}

.price-sub {
	font-size: 12px;
	color: #888;
	margin-top: 3px
}

.item-actions {
	display: flex;
	flex-direction: column;
	align-items: flex-end;
	gap: 8px
}

.qty {
	display: flex;
	align-items: center;
	border: 1px solid #e0e0e0;
	border-radius: 20px;
	height: 32px;
	width: 84px;
	justify-content: space-between;
	padding: 0 6px;
	background: white
}

.qty a {
	text-decoration: none
}

.qty button {
	border: none;
	background: none;
	color: #ef3902;
	font-weight: 800;
	font-size: 16px;
	cursor: pointer;
	width: 24px
}

.qty span {
	font-size: 13px;
	font-weight: 700;
	color: #333
}

.price b {
	font-size: 15px;
	color: #333
}

.remove {
	font-size: 12px;
	color: #ef3902;
	cursor: pointer;
	font-weight: 600;
	text-decoration: none
}

.remove:hover {
	text-decoration: underline
}

.bill h2 {
	font-size: 16px;
	color: #333;
	margin-bottom: 14px
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
	font-size: 14px;
	cursor: pointer;
	margin-top: 16px;
	box-shadow: 0 4px 12px rgba(239, 57, 2, 0.3)
}

.checkout:hover {
	background: #d93402
}

.more {
	display: block;
	text-align: center;
	margin-top: 12px;
	color: #ff5722;
	text-decoration: none;
	font-size: 13px;
	font-weight: 600;
	border: 1px solid #ffccbc;
	padding: 10px;
	border-radius: 50px
}

.more:hover {
	background: #fff2ef
}

.safe {
	text-align: center;
	font-size: 11px;
	color: #888;
	margin-top: 12px
}

@media ( max-width :850px) {
	.main {
		flex-direction: column
	}
	.navbar {
		padding: 12px 18px
	}
}
</style>
</head>
<body>

	<nav class="navbar">
		<div class="nav-logo">Cravings</div>
		<div class="nav-right">
			<a href="RestaurantServlet">Home</a> <a href="RestaurantServlet">Restaurants</a>
			<a href="cart.jsp" class="active">Cart <%
			Cart navCart = (Cart) session.getAttribute("cart");
			int navCount = 0;
			if (navCart != null && navCart.getItems() != null) {
				for (CartItem ci : navCart.getItems().values())
					navCount += ci.getQuantity();
			}
			if (navCount > 0) {
			%> <span class="cart-count"><%=navCount%></span> <%
 }
 %>
			</a> <a href="login.html">Login</a>
		</div>
	</nav>

	<%
	Cart cart = (Cart) session.getAttribute("cart");
	int totalItems = 0;
	float totalAmount = 0;
	int varieties = 0;
	int currentResId = 0;
	if (cart != null && cart.getItems() != null) {
		varieties = cart.getItems().size();
		currentResId = cart.getRestaurantId();
		for (CartItem ci : cart.getItems().values()) {
			totalItems += ci.getQuantity();
			totalAmount += ci.getPrice() * ci.getQuantity();
			if (currentResId == 0)
		currentResId = ci.getRestaurantId();
		}
	}
	%>

	<div class="page-title">
		<h1>My Cart</h1>
		<p><%=totalItems%>
			items •
			<%=varieties%>
			varieties from your order
		</p>
	</div>

	<div class="main">
		<div class="left">
			<div class="card">
				<%
				if (cart != null && cart.getItems() != null && !cart.getItems().isEmpty()) {
				%>
				<div class="res-head">
					<div class="res-icon">🍛</div>
					<div>
						<h3>Your Delicious Food</h3>
						<p><%=varieties%>
							varieties •
							<%=totalItems%>
							items • Fast Delivery
						</p>
					</div>
				</div>

				<%
				for (CartItem item : cart.getItems().values()) {
					String img = item.getImagePath();
					if (img == null || img.trim().isEmpty()) {
						img = "https://images.unsplash.com/photo-1631515243349-e0cb75fb8d3a";
					}
				%>
				<div class="item">
					<a
						href="MenuServlet?restaurantId=<%=item.getRestaurantId()%>#item-<%=item.getMenuId()%>">
						<img class="item-img" src="<%=img%>" alt="<%=item.getItemName()%>">
					</a>
					<div class="i-details">
						<div class="i-top">
							<div class="veg non">
								<div class="dot non"></div>
							</div>
							<a class="name"
								href="MenuServlet?restaurantId=<%=item.getRestaurantId()%>#item-<%=item.getMenuId()%>"><%=item.getItemName()%></a>
						</div>
						<div class="price-sub"> ₹<%=item.getPrice()%> per plate</div>
					</div>
					<div class="item-actions">
						<div class="qty">
							<a
								href="cartServlet?action=update&menuId=<%=item.getMenuId()%>&restaurantId=<%=item.getRestaurantId()%>&quantity=<%=item.getQuantity() - 1%>"><button>-</button></a>
							<span><%=item.getQuantity()%></span>
							     <a
								href="cartServlet?action=update&menuId=<%=item.getMenuId()%>&restaurantId=<%=item.getRestaurantId()%>&quantity=<%=item.getQuantity() + 1%>"><button>+</button>
								</a>
						</div>
						<div class="price">
							<b>₹<%=item.getPrice() * item.getQuantity()%></b>
							<div>
								<a class="remove" href="cartServlet?action=delete&menuId=<%=item.getMenuId()%>&restaurantId=<%=item.getRestaurantId()%>">Remove</a>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>

				<%
				} else {
				%>
				<div style="text-align: center; padding: 50px 20px;">
					<div style="font-size: 50px">🛒</div>
					<h2 style="margin-top: 10px">Your Cart is Empty</h2>
					<p style="color: #777; margin: 8px 0 20px">Please add some food
						items from the menu</p>
					<a class="more" href="RestaurantServlet"
						style="display: inline-block; padding: 10px 30px;">Browse
						Restaurants</a>
				</div>
				<%
				}
				%>
			</div>
		</div>

		<div class="right">
			<%
			float subtotal = totalAmount;
			float deliveryFee = 0;
			if (subtotal > 0 && subtotal < 99) {
				deliveryFee = 40;
			} else {
				deliveryFee = 0;
			}
			float grandTotalCal = subtotal + deliveryFee;
			session.setAttribute("subtotal", subtotal);
			session.setAttribute("deliveryFee", deliveryFee);
			session.setAttribute("grandTotal", grandTotalCal);
			%>

			<div class="card bill">
				<h2>Bill Details</h2>
				<div class="row">
					<span>Item Total (<%=totalItems%> items)
					</span><span>₹<%=subtotal%></span>
				</div>
				<div class="row">
					<span>Delivery Fee</span>
					<%
					if (deliveryFee == 0) {
					%>
					<span style="color: #0a8a00; font-weight: 700">FREE</span>
					<%
					} else {
					%>
					<span style="color: #333; font-weight: 600">₹<%=(int) deliveryFee%></span>
					<%
					}
					%>
				</div>

				<%
				if (subtotal > 0 && subtotal < 99) {
				%>
				<div
					style="font-size: 11px; color: #ef3902; background: #fff1e6; padding: 8px 10px; border-radius: 8px; margin: 10px 0; line-height: 1.4">
					Add items worth ₹<%=(int) (99 - subtotal)%>
					more to get <b>FREE delivery!</b>
				</div>
				<%
				} else if (subtotal >= 99) {
				%>
				<div
					style="font-size: 11px; color: #0a8a00; background: #e6f7e9; padding: 8px 10px; border-radius: 8px; margin: 10px 0">
					🎉 You saved ₹40! FREE delivery applied</div>
				<%
				}
				%>

				<div class="row total">
					<span>Grand Total</span><span>₹<%=grandTotalCal%></span>
				</div>
				<%
				if (totalItems > 0) {
				%>
				<form action="checkout.jsp" method="post">
					<button class="checkout">Proceed to Checkout →</button>
				</form>
				<%
				} else {
				%>
				<button class="checkout" disabled
					style="background: #ccc; box-shadow: none">Proceed
					toCheckout →</button>
				<%
				}
				%>

				<%
				if (currentResId != 0) {
				%>
				<a href="MenuServlet?restaurantId=<%=currentResId%>" class="more">←
					Add More Items</a>
				<%
				} else {
				%>
				<a href="RestaurantServlet" class="more">← Add More Items</a>
				<%
				}
				%>

				<div class="safe">🔒 Safe & Secure Payments</div>
			</div>
		</div>
	</div>

</body>
</html>