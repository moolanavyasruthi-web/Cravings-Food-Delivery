<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.tap.Model.Restaurant"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cravings - Food Delivery</title>
<style>
.hero-container {
	background-image: url('images/image.png');
	height: 280px;
	width: 100%;
	text-align: center;
	color: white;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: rgba(0, 0, 0, 0.4)
}

.cravings-search {
	position: relative;
	width: 90%;
	max-width: 700px;
	margin: 20px auto
}

.cravings-search input {
	width: 100%;
	padding: 12px 65px 12px 25px;
	border-radius: 50px;
	border: none;
	outline: none;
	font-size: 15px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15)
}

.search-btn {
	position: absolute;
	right: 6px;
	top: 50%;
	transform: translateY(-50%);
	width: 35px;
	height: 35px;
	border-radius: 50%;
	background: #ef3902;
	border: none;
	cursor: pointer
}

.food-list {
	display: flex;
	justify-content: center;
	gap: 20px;
	flex-wrap: wrap;
	padding: 15px;
	background: #fff;
	position: sticky;
	top: 60px;
	z-index: 90;
	box-shadow: 0 2px 8px rgba(0, 0, 0, .06)
}

.food-list a {
	padding: 8px 18px;
	border: 1px solid #ddd;
	border-radius: 20px;
	text-decoration: none;
	color: #333;
	font-size: 13px;
	font-weight: 600
}

.food-list a:hover {
	background: #ef3902;
	color: #fff;
	border-color: #ef3902
}

.restaurant-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
	gap: 25px;
	padding: 30px 40px
}

.res-card {
	background: white;
	border-radius: 16px;
	overflow: hidden;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
	cursor: pointer;
	transition: 0.3s
}

.res-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15)
}

.res-card img {
	width: 100%;
	height: 180px;
	object-fit: cover
}

.res-info {
	padding: 15px
}

.res-meta {
	display: flex;
	justify-content: space-between;
	font-size: 14px;
	font-weight: 600;
	margin-bottom: 5px
}

.rating {
	background: #e8f5e9;
	color: #ef3902;
	padding: 2px 6px;
	border-radius: 6px
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="hero-container">
		<div class="hero">
			<h1>WELCOME TO CRAVINGS</h1>
			<p>Delicious Food is waiting for you.</p>
			<form action="SearchServlet" method="get">
				<div class="cravings-search">
					<input type="search" name="q"
						placeholder="Search for Biryani, Pizza...">
					<button class="search-btn" type="submit">🔍</button>
				</div>
			</form>
		</div>
	</div>

	<nav class="food-list">
		<a href="RestaurantServlet">All</a> <a
			href="RestaurantServlet?filter=veg">Pure Veg</a> <a
			href="RestaurantServlet?filter=nonveg">Non-Veg</a> <a
			href="RestaurantServlet?filter=fast">Fast Delivery</a> <a
			href="RestaurantServlet?sort=rating">Ratings 4.0+</a> <a
			href="RestaurantServlet?sort=time">Under 30 Min</a>
	</nav>

	<div class="restaurant-grid">
		<%
		List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurants");
		if (restaurants == null || restaurants.isEmpty()) {
		%>
		<p
			style="text-align: center; grid-column: 1/-1; padding: 40px; color: #666">No
			restaurants available.</p>
		<%
		} else {
		for (Restaurant res : restaurants) {
			if (!res.isActive())
				continue;
		%>
		<div class="res-card"
			onclick="location.href='MenuServlet?restaurantId=<%=res.getRestaurantId()%>'">
			<img src="<%=res.getImagePath()%>"
				onerror="this.src='images/default.png'">
			<div class="res-info">
				<h3><%=res.getResName()%></h3>
				<div class="res-meta">
					<span class="rating">⭐ <%=res.getRating()%></span><span><%=res.getDeliveryTime()%></span>
				</div>
				<p><%=res.getCuisineType()%></p>
				<p>
					📍
					<%=res.getAddress()%></p>
			</div>
		</div>
		<%
		}
		}
		%>
	</div>
</body>
</html>