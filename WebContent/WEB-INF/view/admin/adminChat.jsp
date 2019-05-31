<%@page import="poly.util.DateUtil"%>
<%@page import="poly.dto.PageDTO"%>
<%@page import="poly.dto.ChatDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<ChatDTO> cList = (List<ChatDTO>)request.getAttribute("cList");
	PageDTO pDTO = (PageDTO)request.getAttribute("pDTO");
%>
<html>
<head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="/assets/css/main.css">
<!-- <link rel="stylesheet" href="/assets/css/noticeList.css"> -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4, h5 {
	font-family: "Raleway", sans-serif
}
</style>
<title>SimplyBot 관리자</title>
<script src="/assets/js/jquery.min.js"></script>
<script>
function chatDetail(i){
	location.href="/chatDetail.do?survey_no="+i;
}
//검색안함
function page(i){
	var pagenum = i;
	location.href="/adminChat.do?pagenum="+pagenum+"&contentnum=10";
}
//검색함
function page1(i){
	var pagenum = i;
	var searchWd="<%= pDTO.getSearchWord() %>";
	<%-- var selBox="<%= CmmUtil.nvl(pDTO.getSelBox()) %>"; --%>
	location.href="/adminChat.do?pagenum="+pagenum+"&contentnum=10&searchWord="+searchWd;
}
</script>
</head>
<body class="w3-light-grey">
	<%@include file="adminTop.jsp"%>
	<div class="w3-main" style="margin-left: 300px; margin-top: 43px;">
		<header class="w3-container" style="padding-top: 22px">
			<h5>
				<a href="/adminChat.do?pagenum=1&contentnum=10">
					<b><i class="fa fa-comment"></i> 채팅관리</b>
				</a>
			</h5>
		</header>
		<div class="w3-row-padding w3-margin-bottom">
			<div class="w3-twothird">
					<div class="w3-container w3-red w3-text-white w3-padding-16">
						<div class="w3-left">
							<i class="fa fa-comment w3-xxxlarge"></i>
							<div class="w3-clear"></div>
							<h4>Chats</h4>
						</div>
					<div class="w3-right">
						<form id="searBox">
							<input type="hidden" name="pagenum" value="<%=pDTO.getPagenum()+1%>"/> 
							<input type="hidden" name="contentnum" value="<%=pDTO.getContentnum()%>"/>
							<div class="w3-left" style="height: 36px; margin: 10px 0;">
								<input type="text" name="searchWord" id="searchWord" maxlength="25" placeholder="날짜를 입력하세요." style="border-color: white; background-color: #f1f1f1; color: black;"/>
							</div>
							<div class="w3-clear"></div>
							<div class="w3-right" style="height: 30px; margin: 10px 0;">
								<input type="button" id="findChat" class="cart-black-button" value="검색" style="border-color: white; background-color: #f1f1f1;"/>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="w3-panel">
			<div class="w3-row-padding">
				<div class="w3-striped w3-white" style="text-align: center;">
					<div class="w3-quarter" style="background-color: #f9f9f9;"><b><a style="color:black;text-align: left">번호</a></b></div>
					<div class="w3-quarter" style="background-color: #f9f9f9;"><b><a style="color:black;text-align: left">ID</a></b></div>
					<div class="w3-quarter" style="background-color: #f9f9f9;"><b><a style="color:black">합계</a></b></div>
					<div class="w3-quarter" style="background-color: #f9f9f9;"><b><a style="color:black">생성일</a></b></div>
					<%for (int i = 0; i < cList.size(); i++){ %>
					<div class="w3-quarter"><b><a><%= cList.get(i).getSurvey_no()%></a></b></div>
					<div class="w3-quarter" onclick="javascript:chatDetail('<%= cList.get(i).getSurvey_no()%>')" style="overflow: hidden;">
						<a>
							<b><%= cList.get(i).getUser_id() %></b>
						</a>
					</div>
					<div class="w3-quarter" onclick="javascript:chatDetail('<%= cList.get(i).getSurvey_no()%>')">
						<a>
							<%= cList.get(i).getTotalScore() %>
						</a>
					</div>
					<div class="w3-quarter"><%= DateUtil.DateFormatter(cList.get(i).getReg_date().toString())%></div>
					<% } %>
				</div>
			</div>
			<% if(CmmUtil.nvl(pDTO.getSearchWord()).equals("")) { %>
				<% if(pDTO.getTotalcount()==0) { %>
			<div style="text-align:center"><h5>현재 검색된 내용이 없습니다.</h5></div>
				<% } else { %>
					<% if(pDTO.getEndPage()<10) { %>
				<div class="pager" style="clear:both; text-align: center;">
						<% if(pDTO.isPrev()==true) {%>
					<a href="javascript:page(<%=pDTO.getStartPage()-1%>);">&laquo;</a> 
						<% } %>
						<% for(int i = pDTO.getStartPage(); i < pDTO.getEndPage()+1; i++){ %>
						<a class="chk"  href="javascript:page(<%=i%>);"><%=i %></a> 
						<% } %>
				</div>
					<% } else { %>
				<div class="pager" style="clear:both; text-align: center;">
						<% if(pDTO.isPrev() == true){ %>
					<a href="javascript:page(<%= pDTO.getStartPage()-1 %>);">&laquo;</a> 
						<% } %>
						<% for(int i = pDTO.getStartPage(); i < pDTO.getEndPage()+1; i++){ %>
					<a class="chk"  href="javascript:page(<%=i%>);"><%= i %></a> 
						<%} %>
						<% if(pDTO.isNext() == true){ %>
					<a href="javascript:page(<%= pDTO.getEndPage()+1 %>);">&raquo;</a> 
						<% } %>
				</div>
					<% } %>
				<% } %>
			<% } else { %>
				<% if(pDTO.getTotalcount() == 0){ %>
			<div style="text-align:center"><h5>현재 검색된 내용이 없습니다.</h5></div>
				<% } else { %>
					<% if(pDTO.getEndPage() < 10){ %>
				<div class="pager" style="clear:both; text-align: center;">
						<% if(pDTO.isPrev() == true) {%>
					<a href="javascript:page1(<%= pDTO.getStartPage()-1 %>);">&laquo;</a> 
						<% } %>
						<%for(int i = pDTO.getStartPage(); i < pDTO.getEndPage()+1; i++){ %>
					<a class="chk" href="javascript:page1(<%= i %>);"><%= i %></a> 
						<% } %>
				</div>
					<% } else { %>
				<div class="pager" style="clear:both; text-align: center;"><% if(pDTO.isPrev() == true){ %>
					<a href="javascript:page1(<%= pDTO.getStartPage()-1 %>);">&laquo;</a> 
					<% } %>
						<% for(int i = pDTO.getStartPage(); i < pDTO.getEndPage()+1; i++){ %>
						<a class="chk" href="javascript:page1(<%= i %>);"><%= i %></a> 
						<% } %>
						<% if(pDTO.isNext()==true){ %>
							<a  href="javascript:page1(<%= pDTO.getEndPage()+1 %>);">&raquo;</a> 
						<% } %></div>
					<% } %>
				<% } %>
			<% } %>
		</div>
	</div>
	</div>
	<script>
		// Get the Sidebar
		var mySidebar = document.getElementById("mySidebar");

		// Get the DIV with overlay effect
		var overlayBg = document.getElementById("myOverlay");

		// Toggle between showing and hiding the sidebar, and add overlay effect
		function w3_open() {
			if (mySidebar.style.display === 'block') {
				mySidebar.style.display = 'none';
				overlayBg.style.display = "none";
			} else {
				mySidebar.style.display = 'block';
				overlayBg.style.display = "block";
			}
		}

		// Close the sidebar with the close button
		function w3_close() {
			mySidebar.style.display = "none";
			overlayBg.style.display = "none";
		}
		$(function(){
			$('.chk').each(function(){
				if($(this).text() == <%= pDTO.getPagenum()+1 %>){
					$(this).addClass("on")
				}
			}); 
		});
		$(function(){
			$('#findChat').click(function(){
				var searchWord=$('#searchWord').val();
				if(searchWord==""){
					alert("검색어를 입력해주세요")
					return false;
				}
				if(String(<%=pDTO.getPagenum()+1%>)=="1"){
					$('#searBox').submit();
				}else{
					location.href="/adminChat.do?pagenum=1&contentnum=10&searchWord="+searchWord;
				}
			});
		});
	</script>
</body>
</html>