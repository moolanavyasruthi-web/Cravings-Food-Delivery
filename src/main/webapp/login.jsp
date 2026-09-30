<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - Cravings</title>
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
	background-repeat: no-repeat;
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

input {
	width: 100%;
	padding: 12px 14px;
	border: 1px solid #ddd;
	border-radius: 10px;
	margin-bottom: 14px;
	font-size: 14px;
	outline: none
}

input:focus {
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

.msg {
	background: #e6f7e9;
	color: #0a8a00;
	padding: 10px;
	border-radius: 8px;
	font-size: 13px;
	text-align: center;
	margin-bottom: 14px
}
</style>
</head>
<body>
	<div class="card">
		<div class="logo">Cravings</div>
		<p class="sub">Welcome back</p>

		<% String msg=request.getParameter("msg"); if(msg!=null){ %>
		<div class="msg"><%=msg%></div>
		<% } %>

		<form action="LoginServlet" method="post">
			<input type="email" name="email" placeholder="Email Address" required>
			<input type="password" name="password" placeholder="Password"
				required>
			<button type="submit">Login</button>
		</form>
		<div class="link">
			New User? <a href="register.jsp">Register Here</a>
		</div>
	</div>
</body>
</html>