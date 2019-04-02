<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SIMPL'Y BOT</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="/assets/css/main.css">
<style>
	* {
		margin : 0px;
		padding : 0px;
	}
	html, body {
	}
	.mainScreen {
		height : 100%;
		background-color : #4686a0;
		color : rgba(255, 255, 255, 0.75);
		background-image : url(/assets/css/images/overlay2.png), url(/assets/css/images/overlay3.svg), linear-gradient(45deg, #9dc66b 5%, #4fa49a 30%, #4361c2);
		background-position : top left, center center, center center;
		background-size : auto, cover, cover;
		overflow : hidden;
		position : relative;
		text-align : center;
	}
	body,h1,h2,h3,h4,h5 {
		font-family: "Raleway", sans-serif
	}
</style>
<body class="w3-light-grey w3-content" style="max-width:375px">
	<%@include file="top.jsp"%>
	<div class="mainScreen">
		<section class="#">
			asd
		</section>
		<section class="">
			LOGIN
		</section>
		<section id="footer" class="w3-container w3-padding-32">
			<ul class="icons">
				<li>
					<a href="#" class="icon alt fa-facebook">
						<span class="label">Facebook</span>
					</a>
				</li>
				<li>
					<a href="#" class="icon alt fa-instagram">
						<span class="label">Instagram</span>
					</a>
				</li>
				<li>
					<a href="#" class="icon alt fa-github">
						<span class="label">Github</span>
					</a>
				</li>
				<li>
					<a href="#" class="icon alt fa-envelope">
						<span class="label">Email</span>
					</a>
				</li>
			</ul>
			<ul class="copyright">
				<li>© SIMPL'Y BOT</li>
				<li>Design : duddl425</li>
			</ul>
		</section>
	</div>
	<script>
	function sidebarOpen() {
		document.getElementById("mainSidebar").style.display="block";
		document.getElementById("mainOverlay").style.display="block";
	}
	function sidebarClose() {
		document.getElementById("mainSidebar").style.display="none";
		document.getElementById("mainOverlay").style.display="none";
	}
	</script>
	<script src="/assets/js/jquery.min.js"></script>
	<script src="/assets/js/jquery.scrolly.min.js"></script>
	<script src="/assets/js/browser.min.js"></script>
	<script src="/assets/js/breakpoints.min.js"></script>
	<script src="/assets/js/util.js"></script>
	<script src="/assets/js/main.js"></script>
	<script></script>
</body>
</html>