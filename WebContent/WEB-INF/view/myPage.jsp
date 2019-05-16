<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SIMPL'Y BOT - 마이페이지</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="/assets/css/main.css">
<link rel="stylesheet" href="/assets/css/timeline.css">
<style>
* {
	margin: 0px;
	padding: 0px;
}

html, body {
	
}

.mainScreen {
	height: 100%;
	background-color: #4686a0;
	color: rgba(255, 255, 255, 0.75);
	background-image: url(/assets/css/images/overlay2.png),
		url(/assets/css/images/overlay3.svg),
		linear-gradient(45deg, #9dc66b 5%, #4fa49a 30%, #4361c2);
	background-position: top left, center center, center center;
	background-size: auto, cover, cover;
	/* overflow : hidden; */
	position: relative;
	text-align: center;
}

body, h1, h2, h3, h4, h5 {
	font-family: "Raleway", sans-serif
}

.tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
/* Float the list items side by side */
.tab li {
	float: left;
}
/* Style the links inside the list items */
.tab li a {
	display: inline-block;
	color: #fff;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
	transition: 0.3s;
}
/* Style the tab content */
.tabcontent {
	display: none;
	background-color: rgba(0, 154, 200, 0);
	padding: 6px 12px;
	color: #fff;
}

ul.tab li.current {
	background-color: rgb(0, 154, 200);
	color: #222;
}

.tabcontent.current {
	display: block;
}
</style>
</head>
<body class="w3-light-grey w3-content" style="max-width: 1600px;">
	<%@include file="top.jsp"%>
	<div class="w3-main mainScreen" style="margin-left: 300px;">
		<div class="w3-hide-large" style="margin-top: 75px;"></div>
		<ul class="tab">
			<li class="current" data-tab="tab1"><a href="#">목록</a></li>
			<li data-tab="tab2"><a href="#">종합</a></li>
		</ul>
		<div id="tab1" class="tabcontent current">
			<h3>About</h3>
			<!-- <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p> -->
		</div>
		<div id="tab2" class="tabcontent">
			<h3>Portfolio</h3>
			<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
		</div>
	</div>

	<script src="/assets/js/jquery.min.js"></script>
	<script src="/assets/js/jquery.scrolly.min.js"></script>
	<script src="/assets/js/browser.min.js"></script>
	<script src="/assets/js/breakpoints.min.js"></script>
	<script src="/assets/js/util.js"></script>
	<script src="/assets/js/main.js"></script>
	<script>
		$(function() {
			$('ul.tab li').click(function() {
				var activeTab = $(this).attr('data-tab');
				$('ul.tab li').removeClass('current');
				$('.tabcontent').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
			})
		});
	</script>
	<script>
		$(document).ready(function(event) {
			$(window).scroll(function() {
				var scrollHeight = $(window).scrollTop() + $(window).height();
				var documentHeight = $(document).height();
				//스크롤이 맨아래로 갔는지 아닌지 확인하는 if문
				if (scrollHeight == documentHeight) {
					for (var i = 0; i < 2; i++) {
						$('<h1>Infinity Scroll11</h1>').appendTo('#tab1');
					}
				}
			});
		});
		//테스트를 위해 내부에 공간을 채워서 스크롤을 임의로 만듬
		$(document).ready(function() {
			for (var i = 0; i < 2; i++) {
				$('<h1>infinity scroll</h1>').appendTo('#tab1');
			}
		});
	</script>
</body>
</html>