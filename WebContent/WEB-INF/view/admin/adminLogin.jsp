<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="/assets/css/main.css">
<title>SimplyBot 관리자</title>
<style>
.cart-black-button {
    background: #222;
    border: none;
    color: #fff;
    text-align: center;
    padding: 10px 15px;
    font-weight: 300;
    font-size: 0.8em;
    min-width: 150px;
    text-align: center;
    cursor: pointer;
    margin: 5% 30%;
}
</style>
</head>
<body>
	<div class="container" style="min-height: 80%; width: 400px; height: 750px; align-content: center; display: grid; text-align: center;">
		<form class="form-signin" action="/adminLoginProc.do" method="post">
			<h2 class="form-signin-heading" style="text-align: center;">SimplyBot 관리자</h2>
			<label for="admin_id" class="sr-only">관리자 ID</label>
			<input type="text" id="admin_id" name="admin_id" placeholder="관리자 ID">
			<br />
			<label for="admin_pw" class="sr-only">관리자 PW</label>
			<input type="password" id="admin_pw" name="admin_pw" placeholder="관리자 PW">
			<button class="cart-black-button" type="submit">로그인</button>
		</form>
	</div>
</body>
</html>