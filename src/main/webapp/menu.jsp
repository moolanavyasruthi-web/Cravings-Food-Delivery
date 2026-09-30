<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List, com.tap.Model.Menu, com.tap.Model.Restaurant"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Cravings - Restaurant Menu</title>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap"
	rel="stylesheet" />
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif
}

body {
	background: #f5f5f5
}

.back {
	position: absolute;
	top: 15px;
	left: 15px;
	background: rgba(255, 255, 255, 0.95);
	padding: 8px 16px;
	border-radius: 24px;
	text-decoration: none;
	color: #000;
	font-size: 13px;
	font-weight: 600;
	z-index: 5;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15)
}

.banner {
	height: 280px;
	background-size: cover;
	background-position: center;
	position: relative
}

.banner::after {
	content: "";
	position: absolute;
	inset: 0;
	background: linear-gradient(to top, rgba(0, 0, 0, 0.85) 15%,
		rgba(0, 0, 0, 0.2) 60%, transparent)
}

.banner-text {
	position: absolute;
	bottom: 22px;
	left: 20px;
	right: 20px;
	color: white;
	z-index: 2
}

.banner-text h1 {
	font-size: 26px;
	font-weight: 700
}

.banner-text p {
	margin-top: 4px;
	font-size: 13px;
	opacity: 0.9
}

.info-card {
	background: white;
	margin-top: -18px;
	border-radius: 20px 20px 0 0;
	position: relative;
	padding: 18px 20px;
	z-index: 2
}

.info-card .desc {
	color: #666;
	font-size: 13px
}

.menu-head {
	padding: 16px 20px;
	font-size: 16px;
	font-weight: 700;
	background: white;
	margin-top: 8px
}

.menu-item {
	display: flex;
	justify-content: space-between;
	gap: 15px;
	padding: 20px;
	background: white;
	border-bottom: 1px solid #f0f0f0
}

.item-left {
	flex: 1
}

.item-left h3 {
	font-size: 15px;
	font-weight: 600
}

.item-left .price {
	font-weight: 700;
	font-size: 15px;
	margin-top: 8px
}

.item-left .item-desc {
	font-size: 12px;
	color: #777;
	margin: 6px 0;
	line-height: 1.4
}

.item-right {
	display: flex;
	flex-direction: column;
	align-items: center
}

.item-right img {
	width: 118px;
	height: 96px;
	border-radius: 12px;
	object-fit: cover
}

.add-btn {
	margin-top: -14px;
	border: 1px solid #e0e0e0;
	color: #60b246;
	background: white;
	padding: 7px 28px;
	border-radius: 8px;
	font-weight: 700;
	font-size: 13px;
	cursor: pointer;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.12)
}

.add-btn:hover {
	background: #60b246;
	color: white;
	border-color: #60b246
}
</style>
</head>
<body>
	<%
	List<Menu> allMenu = (List<Menu>) request.getAttribute("allMenu");
	Restaurant res = (Restaurant) request.getAttribute("res");
	%>
	<div class="restaurant-page">
		<a href="RestaurantServlet" class="back">← Back</a>
		<div class="banner"
			style="background-image: url('<%=res.getImagePath()%>');">
			<div class="banner-text">
				<h1><%=res.getResName()%></h1>
				<p>
					⭐
					<%=res.getRating()%>
					•
					<%=res.getDeliveryTime()%></p>
				<p>
					📍
					<%=res.getAddress()%></p>
			</div>
		</div>
		<div class="info-card">
			<p class="desc"><%=res.getCuisineType()%></p>
		</div>
		<div class="menu-head">Recommended</div>

		<%
		for (Menu menu : allMenu) {
		%>
		<div class="menu-item">
			<div class="item-left">
				<h3>
					🔴
					<%=menu.getItemName()%></h3>
				<p class="price">
					₹<%=menu.getPrice()%></p>
				<p class="item-desc"><%=menu.getDescription()%></p>
			</div>
			<div class="item-right">
				<img src="<%=menu.getImagePath()%>" />
				<form action="cartServlet">
					<input type="hidden" name="menuId" value="<%=menu.getMenuId()%>">
					<input type="hidden" name="restaurantId"
						value="<%=menu.getRestaurantId()%>"> <input type="hidden"
						name="quantity" value="1"> <input type="hidden"
						name="action" value="add">
					<button class="add-btn">ADD</button>
				</form>
			</div>
		</div>
		<%
		}
		%>
	</div>

	<%
	Object popupObj = request.getAttribute("showSwitchPopup");
	if (popupObj != null) {
		String val = String.valueOf(popupObj);
		if ("true".equalsIgnoreCase(val)) {
	%>
	<div
		style="position: fixed; inset: 0; background: rgba(0, 0, 0, 0.6); display: flex; align-items: center; justify-content: center; z-index: 99999">
		<div
			style="background: white; padding: 26px; border-radius: 18px; width: 92%; max-width: 380px; text-align: center">
			<div style="font-size: 42px">🛒</div>
			<h3>Replace cart item?</h3>
			<p style="font-size: 13px; color: #666; margin: 8px 0 16px">Your
				cart has items from other restaurant. Reset cart for this
				restaurant?</p>
			<div style="display: flex; gap: 12px; justify-content: center">
				<form action="cartServlet">
					<input type="hidden" name="menuId" value="<%=request.getAttribute("pendingMenuId")%>">
					 <input type="hidden" name="restaurantId" value="<%=request.getAttribute("pendingResId")%>"> 
					 <input type="hidden" name="quantity" value="1"> 
					 <input type="hidden" name="action" value="forceAdd">
					<button
						style="background: #ef3902; color: white; border: none; padding: 11px 22px; border-radius: 30px; font-weight: 700; cursor: pointer">Yes, Start Fresh</button>
				</form>
				<a href="cartServlet?action=cancelSwitch" style="text-decoration: none">
				<button style="background: white; border: 1px solid #ddd; padding: 11px 22px; border-radius: 30px; font-weight: 700; cursor: pointer">No</button></a>
			</div>
		</div>
	</div>
	<%
	}
	}
	%>

</body>
</html>