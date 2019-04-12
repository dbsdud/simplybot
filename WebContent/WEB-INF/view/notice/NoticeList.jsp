<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SIMPL'Y BOT - 공지사항</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="/assets/css/main.css">
<link rel="stylesheet" href="/assets/css/timeline.css">
<!-- <link title="timeline-styles" rel="stylesheet" href="https://cdn.knightlab.com/libs/timeline3/latest/css/timeline.css"> -->
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
		/* overflow : hidden; */
		position : relative;
		text-align : center;
	}
	body,h1,h2,h3,h4,h5 {
		font-family: "Raleway", sans-serif
	}
	.tl-timenav {
		display: none;
	}
	.tl-menubar {
		display: none;
	}
	.tl-message-full {
		display: none;
	}
	.tl-storyslider {
		height: !important 600px;
	}
</style>
</head>
<body class="w3-light-grey w3-content" style="max-width:1600px;">
	<%@ include file="../top.jsp" %>
	<div class="w3-main mainScreen" style="margin-left:300px;">
		<div class="w3-hide-large" style="margin-top: 65px;"></div>
		<section id="header" style="max-height: 80%; height: 100%; color: #000;">
			<div class="inner" style="color: #000;">
				<script type="text/javascript" src="/assets/js/timeline.js"></script>
				<div id='timeline-embed' style="width: 100%; height: 480px;"></div>
				<script type="text/javascript">
					// The TL.Timeline constructor takes at least two arguments:
					// the id of the Timeline container (no '#'), and
					// the URL to your JSON data file or Google spreadsheet.
					// the id must refer to an element "above" this code,
					// and the element must have CSS styling to give it width and height
					// optionally, a third argument with configuration options can be passed.
					// See below for more about options.
					var additionalOptions = {
						start_at_end: true,
						/* default_bg_color: {r:255, g:255, b:204}, */
						timenav_height_percentage: 25
					}
					timeline = new TL.Timeline('timeline-embed',
						'https://docs.google.com/spreadsheets/d/1c70AP49mm-K_7bzYVXMaAr99ZbNU_gAYSyZzS9qFdGA/edit#gid=0', additionalOptions);
				</script>
			</div>
		</section>
		<div class="w3-hide-large" style="margin-top: 65px;"></div>
		<section id="footer" class="w3-container w3-padding-32" style="max-height: 20%; height: 100%; position: relative;">
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
	<script src="/assets/js/jquery.min.js"></script>
	<script src="/assets/js/jquery.scrolly.min.js"></script>
	<script src="/assets/js/browser.min.js"></script>
	<script src="/assets/js/breakpoints.min.js"></script>
	<script src="/assets/js/util.js"></script>
	<script src="/assets/js/main.js"></script>
</body>
</html>