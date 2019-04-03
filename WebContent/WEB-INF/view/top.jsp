<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 구글 유저 정보 */
	String g_name = CmmUtil.nvl((String)session.getAttribute("g_name"));
	String g_email = CmmUtil.nvl((String)session.getAttribute("g_email"));
	String g_image = CmmUtil.nvl((String)session.getAttribute("g_image"));
	String g_token = CmmUtil.nvl((String)session.getAttribute("g_token"));
	/* 페이스북 유저 정보 */
	String f_name = CmmUtil.nvl((String)session.getAttribute("f_name"));
	String f_token = CmmUtil.nvl((String)session.getAttribute("f_token"));
%>
<!-- Google Login & Logout -->
<script src="/assets/js/hello.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://apis.google.com/js/api.js"></script>
<meta name="google-signin-client_id" content="1080260707358-fhghris05edjc684dep4c8uk5tvje9hc.apps.googleusercontent.com">
<script>
gapi.load('auth2', function(){
	gapi.auth2.init();
});
</script>
<!-- navbar -->
<nav class="w3-sidebar w3-bar-block w3-white w3-animate-left w3-text-grey w3-collapse w3-top w3-center" style="z-index:3;width:300px;font-weight:bold" id="mainSidebar">
	<br>
	<h3 class="w3-padding-64 w3-center"><b>SIMPL'Y BOT</b></h3>
	<a href="#" onclick="sidebarClose()" class="w3-bar-item w3-button">SIGN IN</a>
	<a href="/notice/noticeList.do" onclick="sidebarClose()" class="w3-bar-item w3-button">NOTICE</a>
	<a href="#" onclick="sidebarClose()" class="w3-bar-item w3-button">CONTACT</a>
	<a href="javascript:void(0)" onclick="sidebarClose()" class="w3-bar-item w3-button w3-padding w3-hide-large">CLOSE</a>
</nav>
<header class="w3-container w3-top w3-hide-large w3-white w3-xlarge w3-padding-16">
	<span class="w3-left w3-padding">SIMPL'Y BOT</span>
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

