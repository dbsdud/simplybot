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
		/* overflow : hidden; */
		position : relative;
		text-align : center;
	}
	body,h1,h2,h3,h4,h5 {
		font-family: "Raleway", sans-serif
	}
</style>
</head>
<body class="w3-light-grey w3-content" style="max-width:1600px;">
	<%@include file="top.jsp"%>
	<div class="w3-main mainScreen" style="margin-left:300px;">
		<%-- <form name="myPage" style="display: none;">
			<input type="hidden" id="user_no" name="user_no" value="<%= user_no %>" />
		</form> --%>
		<div class="w3-hide-large" style="margin-top: 65px;"></div>
		<section id="header" style="max-height: 80%; height: 100%;">
			<div class="inner">
				<span class="icon major fa-cloud"></span>
				<h3>
					안녕하세요.
				</h3>
				<h3>
					저는	<strong>인공지능 상담가</strong>	입니다.				
				</h3>
				<p>
					다른 사람에게 하기 어려운 자신의 이야기를 <br>
					챗봇에게 해보세요!
				</p>
			</div>
			<div class="inner" style="margin-top:20px;">
				<!-- 구글 로그인 버튼 -->
				<% if("".equals(g_name) && "".equals(nickname)) { %>
				<div class="g-signin2" data-onsuccess="onSignIn" data-width="240" data-height="40" data-longtitle="true" style="display: -webkit-inline-box;"></div>
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
				</script>
				<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
				<!-- 카카오 로그인 버튼 -->
				<div class="inner" style="margin-top: 20px;">
					<!-- <img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="240" style="cursor: pointer;" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=ddb395a2840518c533a503811ad7686a&redirect_uri=http://localhost:8080/auth/kakao/callback.do&response_type=code'"/> -->
					<a id="custom-login-btn" href="javascript:loginWithKakao()"> <!-- 여기 닫으면 작동 안함 -->
					<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="240" />
					<a href="http://developers.kakao.com/logout"></a>
				</div>
				<script type='text/javascript'>
						//<![CDATA[
						// 사용할 앱의 JavaScript 키를 설정해 주세요.
						Kakao.init('c47b0dd7403b357161a42ad574a65fa9'); // API Key
						function loginWithKakao(){
							var kakao_id = '', profile_image = '', thumbnail_image='', nickname='', email='';
							// 카카오 로그인 버튼을 생성합니다.
							Kakao.Auth.loginForm({
								success : function(authObj) {
									// 로그인 성공시, API를 호출합니다.
									Kakao.API.request({
										url: '/v2/user/me',
										success: function(res){
											/* alert(JSON.stringify(res)); */
											kakao_id = JSON.stringify(res.id);
											nickname = JSON.stringify(res.properties.nickname);
											profile_image = JSON.stringify(res.properties.profile_image);
											thumbnail_image = JSON.stringify(res.properties.thumbnail_image);
											email = JSON.stringify(res.kakao_account.email);
											console.log(" kakao_id : " + JSON.stringify(res.id));
											console.log(" nickname : " + JSON.stringify(res.properties.nickname));
											console.log(" profle_image: " + JSON.stringify(res.properties.profile_image));
											console.log(" thumbnail_image : " + JSON.stringify(res.properties.thumbnail_image));
											console.log(" email : " + JSON.stringify(res.kakao_account.email));
											location.href='/auth/kakao/callback.do?kakao_id='+kakao_id+'&nickname='+nickname+'&profile_image='+profile_image+'&thumbnail_image='+thumbnail_image+'&email='+email;
										},
										fail: function(error){
											alert(JSON.stringify(error));
										}
									});
									/* alert(JSON.stringify(authObj)); */
								},
								fail : function(err) {
									alert(JSON.stringify(err));
								},
								persistAccessToken : false
							});
						};
						//]]>
					</script>
				<!-- 구글 로그아웃 버튼 -->
				<% } else if (!"".equals(g_name) && "".equals(nickname)) { %>
				<a class="nav-link" href="#"><%="반갑습니다! " + g_name + "님" %></a>
				<div class="inner" style="margin-top:20px;">
					<!-- <a href="javascript:void(0)" onclick="goChatBot()" class="button wide primary" style="width:240px;">대화 시작</a> -->
					<a href="simplybot.do?user_id=<%= user_id %>" class="button wide primary" style="width:240px;">대화 시작</a>
				</div>
				<div class="inner" style="margin-top:20px;">
					<a href="#" onclick="signOut();" class="button wide" style="width:240px;">Sign out</a>
				</div>
				<script>
					function signOut() {
						var auth2 = gapi.auth2.getAuthInstance();
						auth2.signOut().then(function() {
							console.log('User signed out.');
							location.href='/logout.do';
						});
					}
				</script>
				<!-- 카카오 로그아웃 버튼 -->
				<% } else { %>
				<a class="nav-link" href="#"><%="반갑습니다! " + nickname + "님" %></a>
				<div class="inner" style="margin-top:20px;">
					<!-- <a href="javascript:void(0)" onclick="goChatBot()" class="button wide primary" style="width:240px;">대화 시작</a> -->
					<a href="simplybot.do?user_id=<%= user_id %>" class="button wide primary" style="width:240px;">대화 시작</a>
				</div>
				<div class="inner" style="margin-top:20px;">
					<a href="#" onclick="signOut();" class="button wide" style="width:240px;">Sign out</a>
				</div>
				<script>
					function signOut() {
						var auth2 = gapi.auth2.getAuthInstance();
						auth2.signOut().then(function() {
							console.log('User signed out.');
							location.href='/logout.do';
						});
					}
				</script>
				<% } %>
			</div>
				<!-- 페이스북 로그인 버튼 / 리다이렉트 문제로 막아 놓음 -->
			<!-- <div class="inner" style="margin-top:20px;">
				<div class="fb-login-button" data-width="240" data-size="large" data-button-type="login_with" data-auto-logout-link="true" data-use-continue-as="false"></div>
				<div id="fb-root"></div>
				<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v3.2&appId=374979163093103&autoLogAppEvents=1"></script>
				<script>
					window.fbAsyncInit = function() {
						FB.init({
							appId      : '374979163093103',
							cookie     : true,
							xfbml      : true,
							version    : 'v3.2'
						});
						FB.AppEvents.logPageView();
						function statusChangeCallback(response) {
			                console.log('statusChangeCallback');
			                console.log(response);
			                // The response object is returned with a status field that lets the
			                // app know the current login status of the person.
			                // Full docs on the response object can be found in the documentation
			                // for FB.getLoginStatus().
			                if (response.status === 'connected') {
			                    // Logged into your app and Facebook.
			                    console.log('Welcome!  Fetching your information.... ');
			                    console.log(response.authResponse.accessToken);
			                    var f_token = response.authResponse.accessToken;
			                    var f_name = '';
			                    var f_id = '';
			                    FB.api('/me', function (response) {
			                        console.log(JSON.stringify(response));
			                        console.log('Successful login for: ' + response.name);
			                        console.log('Successful login for: ' + response.id);
			                        f_name = response.name;
			                        f_id = response.id;
			                        // 리다이렉트 문제로 막아 놓음
			                        // location.href='/auth/facebook/callback.do?f_name='+f_name+'&f_id='+f_id+'&f_token='+f_token;
			                    });
			                }
			            }
						FB.getLoginStatus(function(response) {
						    statusChangeCallback(response);
						});
					};
					(function(d, s, id){
						var js, fjs = d.getElementsByTagName(s)[0];
						if (d.getElementById(id)) {return;}
						js = d.createElement(s); js.id = id;
						js.src = "https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v3.2&appId=374979163093103";
						fjs.parentNode.insertBefore(js, fjs);
					}(document, 'script', 'facebook-jssdk'));
				</script>
			</div> -->
		</section>
		<!-- <div class="w3-hide-large" style="margin-top: -65px;"></div> -->
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