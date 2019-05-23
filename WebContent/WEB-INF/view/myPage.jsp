<%@page import="java.util.List"%>
<%@ page import="poly.dto.ChatDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<ChatDTO> cList = (List<ChatDTO>)request.getAttribute("cList");
%>
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
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/jquery.scrolly.min.js"></script>
<style>
* {
	margin: 0px;
	padding: 0px;
}

html, body {
	
}

.mainScreen {
	/* height: 100%; */
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
	background-repeat-y: repeat; 
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

.card {
	height: 400px;
	width: 320px;
	border-radius: 15px;
	display: inline-block;
	margin-top: 30px;
	/* margin-bottom: 30px; */
	position: relative;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	overflow: hidden;
}

.card-header {
	-webkit-transition: 0.5s; /*사파리 & 크롬*/
	-moz-transition: 0.5s; /*파이어폭스*/
	-ms-transition: 0.5s; /*인터넷 익스플로러*/
	-o-transition: 0.5s; /*오페라*/
	transition: 0.5s;
	width: 100%;
	border-radius: 15px 15px 0 0;
	background-size: 100% 280px;
	background-repeat: no-repeat;
}

.card-header-is_closed {
	background-color: #EF5A31;
	color: #FFF;
	font-weight: bold;
	text-align: center;
	float: right;
	margin: 15px 15px 0 0;
	border-radius: 50%;
	font-weight: bold;
	padding: 10px 10px;
	line-height: 20px;
}

h1 {
	font-size: 22px;
	font-weight: bold;
}

.card-body {
	
}

.card-body-header {
	line-height: 25px;
	margin: 10px 20px 0px 20px;
}

.card-body-description {
	opacity: 0;
	color: #757B82;
	line-height: 25px;
	-webkit-transition: .2s ease-in-out; /*사파리&크롬*/
	-moz-transition: .2s ease-in-out; /*파이어폭스*/
	-ms-transition: .2s ease-in-out; /*익스플로러*/
	-o-transition: .2s ease-in-out; /*오페라*/
	transition: .2s ease-in-out;
	overflow: hidden;
	height: 180px;
	margin: 5px 20px;
}

.card-body-hashtag {
	color: #2478FF;
	font-style: italic;
}

.card-body-footer {
	position: absolute;
	margin-top: 15px;
	margin-bottom: 6px;
	bottom: 0;
	width: 100%;
	font-size: 14px;
	color: #9FA5A8;
	padding: 0 15px;
}

.icon {
	display: inline-block;
	vertical-align: middle;
	margin-right: 2px;
}

.icon-view_count {
	width: 25px;
	height: 17px;
}

.icon-comments_count {
	margin-left: 5px;
	width: 25px;
	height: 17px;
}

.reg_date {
	float: left;
}
.user {
	float: right;
}
</style>
<!-- <script type="text/javascript">
$(document).ready(function() {
	var win = $(window);
	var doc = $(document);
	var user_id = $('#user_id').val();
	console.log(user_id);
	// 이전 스크롤 좌표
	var lastScrollTop = 0;
	// 1. 스크롤 이벤트 최초 발생
	win.scroll(function() {
		// 현재 스크롤 좌표
		var currentScrollTop = win.scrollTop();
		// 다운 스크롤		
		if(currentScrollTop - lastScrollTop > 0) {
			console.log("down-scroll");
			// 2. 현재 스크롤의 top 좌표가  > (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간
			if(currentScrollTop >= doc.height() - win.height()) {
				// 3. class가 scrolling인 것의 요소 중 마지막인 요소를 선택한 다음 그것의 survey_no속성 값을 받아온다.
				var lastSurvey_no = $(".scrolling:last").attr("survey_no");
				// 4. ajax를 이용하여 현재 뿌려진 게시글의 마지막 survey_no을 서버로 보내어 그 다음 1개의 게시물 데이터를 받아온다. 
				$.ajax({
					url: '/resultList.do?user_id=' + user_id,
					type : 'GET',
					data : {
						'user_id' : user_id,
						'survey_no' : survey_no
					},
					success: function(data){
						console.log(data);
						var contents="";
						$.each(data, function(key, value) {
							contents+="test";
						});
						$('#tab1').html(contents);
					} // success
				}); // ajax 성공
				// class가 listToChange인 것중 가장 처음인 것을 찾아서 그 위치로 이동
			} // if
		} // if
		// 업 스크롤
		else {
			// up- scroll : 현재 게시글 이전의 글을 불러온다.
			console.log("up-scroll");			

			// 2. 현재 스크롤의 top 좌표가  <= 0 되는 순간
			if(win.scrollTop() <= 0) {
				// 3. class가 scrolling인 것의 요소 중 마지막인 요소를 선택한 다음 그것의 survey_no속성 값을 받아온다.
				var firstSurvey_no = $(.scrolling:first).attr("survey_no");
				// 4. ajax를 이용하여 현재 뿌려진 게시글의 마지막 survey_no을 서버로 보내어 그 이전 1개의 게시물 데이터를 받아온다.
				$.ajax({
					url: '/resultList.do?user_id=' + user_id,
					type : 'GET',
					data : {
						'user_id' : user_id,
						'survey_no' : survey_no
					},
					success: function(data){
						console.log(data);
						var contents="";
						$.each(data, function(key, value) {
							contents+="test";
						});
						$('#tab1').html(contents);
					} // success
				}); // ajax
			} // if
		} // else 
	});
});
</script> -->
</head>
<body class="w3-light-grey w3-content" style="max-width: 1600px;">
	<%@include file="top.jsp"%>
	<input type="hidden" id="user_id" value="<%= user_id %>">
	<div class="w3-main mainScreen" style="margin-left: 300px; background-attachment: fixed;">
		<div class="w3-hide-large" style="margin-top: 75px;"></div>
		<ul class="tab">
			<li class="current" data-tab="tab1"><a href="#">목록</a></li>
			<li data-tab="tab2"><a href="#">종합</a></li>
		</ul>
		<div id="tab1" class="tabcontent current">
		<% if(cList != null) { %>
			<% for(int i = cList.size()-1; i >= 0; i--) { %>
			<a href="#"> <!-- 클릭 시 링크 설정 -->
				<div class="card">
					<!-- 카드 헤더 -->
					<div class="card-header">
						<p class="card-body-nickname"><%= cList.get(i).getReg_date() %> 검사결과</p>
					</div>
					<!--  카드 바디 -->
					<div class="card-body">
						<!--  카드 바디 헤더 -->
						<div class="card-body-header">
							<% if(!"".equals(g_name) && "".equals(nickname)) { %>
							<p><%= g_name + "님 불안척도 점수는" %></p>
							<% } else { %>
							<p><%= nickname + "님 불안척도 점수는" %></p>
							<% } %>
						</div>
						<!--  카드 바디 푸터 -->
						<div class="card-body-footer">
							<hr	style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
							<i class="reg_date"><%= cList.get(i).getReg_date() %></i>
							<% if(!"".equals(g_name) && "".equals(nickname)) { %>
							<i class="user"><%= g_name + "님" %></i>
							<% } else { %>
							<i class="user"><%= nickname + "님" %></i>
							<% } %>
						</div>
					</div>
				</div>
			</a>
			<% } %>
		<% } %>
		</div>
		<div id="tab2" class="tabcontent">
			<h3>Portfolio</h3>
			<p>Contrary to popular belief, Lorem Ipsum is not simply random
				text. It has roots in a piece of classical Latin literature from 45
				BC, making it over 2000 years old. Richard McClintock, a Latin
				professor at Hampden-Sydney College in Virginia, looked up one of
				the more obscure Latin words, consectetur, from a Lorem Ipsum
				passage, and going through the cites of the word in classical
				literature, discovered the undoubtable source. Lorem Ipsum comes
				from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum"
				(The Extremes of Good and Evil) by Cicero, written in 45 BC. This
				book is a treatise on the theory of ethics, very popular during the
				Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit
				amet..", comes from a line in section 1.10.32.</p>
		</div>
		<div class="w3-hide-large" style="margin-top: 172px;"></div>
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

	<script src="/assets/js/browser.min.js"></script>
	<script src="/assets/js/breakpoints.min.js"></script>
	<script src="/assets/js/util.js"></script>
	<script src="/assets/js/main.js"></script>


	<!-- 탭 메뉴 스트립트 -->
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
	<!-- 무한페이지 스크립트 -->
	<!-- <script>
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
	</script> -->
</body>
</html>