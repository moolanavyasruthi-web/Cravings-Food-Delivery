<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register - Cravings</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Gill Sans', 'Gill Sans MT', Calibri, sans-serif
}

body {
	background-image: linear-gradient(rgba(0, 0, 0, 0.35),
		rgba(0, 0, 0, 0.45)), url('images/image.png');
	background-size: cover;
	background-position: center;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh
}

.card {
	background: white;
	width: 100%;
	max-width: 420px;
	padding: 30px 26px;
	border-radius: 20px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, .15)
}

.logo {
	font-size: 28px;
	font-weight: bold;
	color: #ff5722;
	font-family: cursive;
	text-align: center;
	margin-bottom: 6px
}

.sub {
	text-align: center;
	color: #777;
	font-size: 13px;
	margin-bottom: 18px
}

input, select {
	width: 100%;
	padding: 12px 14px;
	border: 1px solid #ddd;
	border-radius: 10px;
	margin-bottom: 14px;
	font-size: 14px;
	outline: none;
	background: white
}

input:focus, select:focus {
	border-color: #ff5722
}

button {
	width: 100%;
	background: #ef3902;
	color: white;
	border: none;
	padding: 12px;
	border-radius: 50px;
	font-weight: 700;
	font-size: 14px;
	cursor: pointer;
	box-shadow: 0 4px 12px rgba(239, 57, 2, .3)
}

button:hover {
	background: #d93402
}

.link {
	text-align: center;
	margin-top: 14px;
	font-size: 13px
}

.link a {
	color: #ff5722;
	text-decoration: none;
	font-weight: 600
}

label {
	font-size: 11px;
	font-weight: 700;
	color: #333;
	margin-bottom: 5px;
	display: block;
	text-transform: uppercase;
	letter-spacing: .6px
}
</style>
</head>
<body>
	<div class="card">
		<div class="logo">Cravings</div>
		<p class="sub">Create your account</p>
		<form action="RegisterServlet" method="post">
			<label>User Name</label> <input type="text" name="userName"
				placeholder="Full Name" required> <label>Email</label> <input
				type="email" name="email" placeholder="Email Address" required>

			<label>Password</label> <input type="password" name="password"
				placeholder="Password" required> <label>Phone</label> <input
				type="text" name="phone" placeholder="Phone Number"> <label>Address</label>
			<input type="text" name="address" placeholder="Delivery Address">

			<label>Role</label> <select name="role" required>
				<option value="customer">Customer</option>
				<option value="restaurant_owner">Restaurant Owner</option>
				<option value="delivery_agent">Delivery Agent</option>
				<option value="admin">Admin</option>
			</select>

			<button type="submit">Register</button>
		</form>
		<div class="link">
			Already have account? <a href="login.jsp">Login</a>
		</div>
	</div>
</body>
</html>