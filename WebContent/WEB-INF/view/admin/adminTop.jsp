<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String admin_no = CmmUtil.nvl((String)session.getAttribute("admin_no"));
	String admin_id = CmmUtil.nvl((String)session.getAttribute("admin_id"));
	String admin_name = CmmUtil.nvl((String)session.getAttribute("admin_name"));
%>
<!-- Top container -->
	<div class="w3-bar w3-top w3-black w3-large" style="z-index: 4">
		<button	class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();">
			<i class="fa fa-bars"></i>  Menu
		</button>
		<span class="w3-bar-item w3-right">SimplyBot</span>
	</div>

	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index: 3; width: 300px;" id="mySidebar">
		<br>
		<div class="w3-container w3-row">
			<div class="w3-col s4">
				<img src="/w3images/avatar2.png" class="w3-circle w3-margin-right"	style="width: 46px">
			</div>
			<div class="w3-col s8 w3-bar">
				<span>Welcome, <strong><%= admin_name %></strong></span>
			</div>
		</div>
		<hr>
		<div class="w3-container">
			<h5>Dashboard</h5>
		</div>
		<div class="w3-bar-block">
			<a href="#"	class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu">
				<i class="fa fa-remove fa-fw"></i>  Close Menu
			</a> 
			<a href="/adminHome.do" class="w3-bar-item w3-button w3-padding w3-blue">
				<i class="fa fa-eye fa-fw"></i>  요약
			</a>
			<a href="/adminChat.do?pagenum=1&contentnum=10" class="w3-bar-item w3-button w3-padding">
				<i class="fa fa-comment fa-fw"></i>  채팅 관리
			</a>
			<a href="/adminUser.do?pagenum=1&contentnum=10" class="w3-bar-item w3-button w3-padding">
				<i class="fa fa-users fa-fw"></i>  사용자 관리
			</a>
			<br>
			<br>
		</div>
	</nav>
	<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>