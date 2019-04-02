<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- navbar -->
<nav class="w3-sidebar w3-bar-block w3-white w3-animate-left w3-text-grey w3-collapse w3-top w3-center" style="z-index:3;width:300px;font-weight:bold" id="mainSidebar">
	<br>
	<h3 class="w3-padding-64 w3-center"><b>SIMPL'Y BOT</b></h3>
	<a href="javascript:void(0)" onclick="sidebarClose()" class="w3-bar-item w3-button w3-padding w3-hide-large">CLOSE</a>
	<a href="#" onclick="sidebarClose()" class="w3-bar-item w3-button">SIGN IN</a>
	<a href="#" onclick="sidebarClose()" class="w3-bar-item w3-button">NOTICE</a>
</nav>
<header class="w3-container w3-top w3-hide-large w3-white w3-xlarge w3-padding-16">
	<span class="w3-left w3-padding">SIMPL'Y BOT</span>
	<a href="javascript:void(0)" class="w3-right w3-button w3-white" onclick="sidebarOpen()">☰</a>
</header>
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="sidebarClose()" style="cursor:pointer" title="close side menu" id="mainOverlay"></div>