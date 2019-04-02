<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 구글 유저 정보 */
	String g_name = CmmUtil.nvl((String)session.getAttribute("g_name"));
	String g_image = CmmUtil.nvl((String)session.getAttribute("g_image"));
	String g_email = CmmUtil.nvl((String)session.getAttribute("g_email"));
	String g_token = CmmUtil.nvl((String)session.getAttribute("g_token"));
%>
<!-- Google Login & Logout -->
<script src="/assets/js/hello.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="1080260707358-fhghris05edjc684dep4c8uk5tvje9hc.apps.googleusercontent.com">
<script>
function onSignIn(googleUser) {
	var profile = googleUser.getBasicProfile();
		console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		var g_name = profile.getName();
		console.log('Name: ' + g_name);
		var g_image = profile.getImageUrl();
		console.log('Image URL: ' + g_image);
		var g_email = profile.getEmail();
		console.log('Email: ' + g_email); // This is null if the 'email' scope is not present.
		var g_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + g_token);
        
        location.href='/auth/google/callback.do?g_name='+g_name+'&g_image='+g_image+'&g_email='+g_email+'&g_token='+g_token;
}
function login() {
	hello('google').login({scope: 'name'}).then(function(auth){
		hello(auth.network).api('/me').then(function(r) {
			console.log(HSON.stringify(auth));
			accessToken = auth.authResponse.access_token;
			console.log(accessToken);
			getGoogleMe();
		})
	})
}
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

