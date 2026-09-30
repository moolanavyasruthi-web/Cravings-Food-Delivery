<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.tap.Model.Menu"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search Results</title>
<style>
/* SAME CSS AS YOUR HOME */
.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px 40px;
	background: white;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.nav-logo {
	font-size: 24px;
	font-weight: bold;
	color: #ff5722;
	font-family: cursive;
}

.restaurant-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
	gap: 25px;
	padding: 30px 40px;
}

.res-card {
	background: white;
	border-radius: 16px;
	overflow: hidden;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
	transition: 0.3s;
}

.res-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

.res-card img {
	width: 100%;
	height: 180px;
	object-fit: cover;
}

.res-info {
	padding: 15px;
}

.res-info h3 {
	margin: 0 0 8px 0;
}

.view-menu {
	display: flex;
	justify-content: end;
	margin-top: 10px;
	font-size: 14px;
	font-weight: 600;
	color: #ff5722;
	text-decoration: none;
}
</style>
</head>
<body>

	<nav class="navbar">
		<div class="nav-logo">Cravings</div>
		<div>
			<a href="RestaurantServlet"
				style="text-decoration: none; color: #333;">Home</a>
		</div>
	</nav>

	<h2 style="padding: 20px 40px;">
		Results for "<%=request.getAttribute("query")%>"
	</h2>

	<div class="restaurant-grid">
		<%
		List<Menu> menus = (List<Menu>) request.getAttribute("menus");
		if (menus != null && !menus.isEmpty()) {
			for (Menu m : menus) {
		%>
		<div class="res-card">
			<img src="<%=m.getImagePath()%>">
			<div class="res-info">
				<h3><%=m.getItemName()%></h3>
				<p>
					₹<%=m.getPrice()%></p>
				<p style="font-size: 13px; color: #666;"><%=m.getDescription()%></p>
				<a class="view-menu"
					href="MenuServlet?restaurantId=<%=m.getRestaurantId()%>">View
					Restaurant →</a>
			</div>
		</div>
		<%
		}
		} else {
		%>
		<p style="padding: 20px;">
			No items found for "<%=request.getAttribute("query")%>". Try
			Biryani, Pizza...
		</p>
		<%
		}
		%>
	</div>

</body>
</html>