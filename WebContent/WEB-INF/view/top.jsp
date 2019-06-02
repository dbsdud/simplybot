<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 공통정보 */
	String user_no = CmmUtil.nvl((String)session.getAttribute("user_no"));
	String user_id = CmmUtil.nvl((String)session.getAttribute("user_id"));
	/* 구글 유저 정보 */
	String g_name = CmmUtil.nvl((String)session.getAttribute("g_name"));
	String g_email = CmmUtil.nvl((String)session.getAttribute("g_email"));
	String g_image = CmmUtil.nvl((String)session.getAttribute("g_image"));
	/* 카카오 */
	String nickname = CmmUtil.nvl((String)session.getAttribute("nickname"));
	String profle_image = CmmUtil.nvl((String)session.getAttribute("profle_image"));
	String thumbnail_image = CmmUtil.nvl((String)session.getAttribute("thumbnail_image"));
	String email = CmmUtil.nvl((String)session.getAttribute("email"));
	/* 페이스북 유저 정보 */
	String f_name = CmmUtil.nvl((String)session.getAttribute("f_name"));
	String f_token = CmmUtil.nvl((String)session.getAttribute("f_token"));
%>
<!-- Google Login & Logout -->
<script src="/assets/js/hello.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://apis.google.com/js/api.js"></script>
<meta name="google-signin-client_id" content="1080260707358-c89n5ot1hhgh515iopmclp3cql4f0f2a.apps.googleusercontent.com">
<script>
gapi.load('auth2', function(){
	gapi.auth2.init();
});
</script>
<!-- <script>
	function goMyPage(user_no = 0){
		var f = document.myPage;
		f.user_no.value = user_no;
		f.action = "/myPage.do";
		f.method = "post";
		f.submit();
	};
</script>
<script>
	function goChatBot(user_no = 0){
		var f = document.myPage;
		f.user_no.value = user_no;
		f.action = "/simplybot.do";
		/* f.action = "/simplybot_dialogflow.do"; */
		/* f.action = "/simplybot_handmade.do"; */
		f.method = "post";
		f.submit();
	};
</script> -->
<!-- kakao Login -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- navbar -->
<nav class="w3-sidebar w3-bar-block w3-white w3-animate-left w3-text-grey w3-collapse w3-top w3-center" style="z-index:9;width:300px;font-weight:bold" id="mainSidebar">
	<br>
	<h3 class="w3-padding-64 w3-center"><b><a href="/main.do" style="text-decoration: none;">SIMPL'Y BOT</a></b></h3>
	<form name="myPage" style="display: none;">
		<input type="hidden" id="user_no" name="user_no" value="<%= user_no %>" />
	</form>
	<% if(!"".equals(nickname)) { %>
	<a href="#" class="w3-bar-item w3-button"><img src="<%= thumbnail_image %>"/></a>
	<%-- <a href="#" class="w3-bar-item w3-button" onclick="goMyPage(<%= user_no %>);">MY PAGE</a> --%>
	<a href="/myPage.do?user_id=<%= user_id %>" class="w3-bar-item w3-button">MY PAGE</a>
	<% } else if(!"".equals(g_name)) { %>
	<a href="#" class="w3-bar-item w3-button"><img src="<%= g_image %>"/></a>
	<!-- <a href="javascript:void(0)" onclick="goMyPage()" class="w3-bar-item w3-button">MY PAGE</a> -->
	<a href="/myPage.do?user_id=<%= user_id %>" class="w3-bar-item w3-button">MY PAGE</a>
	<% } %>
	<a href="/notice/noticeList.do" onclick="sidebarClose()" class="w3-bar-item w3-button">NOTICE</a>
	<a href="#" onclick="sidebarClose()" class="w3-bar-item w3-button">CONTACT</a>
	<a href="javascript:void(0)" onclick="sidebarClose()" class="w3-bar-item w3-button w3-padding w3-hide-large">CLOSE</a>
</nav>
<header class="w3-container w3-top w3-hide-large w3-white w3-xlarge w3-padding-16" style="z-index: 8;">
	<span class="w3-left w3-padding"><a href="/main.do" style="text-decoration: none;">SIMPL'Y BOT</a></span>
	<a href="javascript:void(0)" class="w3-right w3-button w3-white" onclick="sidebarOpen()">☰</a>
</header>
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="sidebarClose()" style="cursor:pointer" title="close side menu" id="mainOverlay"></div>
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

