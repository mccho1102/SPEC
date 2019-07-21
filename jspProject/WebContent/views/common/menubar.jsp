<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.model.vo.Member"%>
<%
	// session 객체에 담겨진 loginUser 정보를 저장해두기
	Member loginUser = (Member)session.getAttribute("loginUser");

	/************* 3. 아이디 저장 처리(Cookie) ****************/
	// 세션은 서버가 생성 및 관리
	// 쿠키는 서버가 생성하고 브라우저가 관리

	// 쿠키는 최대 4KB

	/*
		순서
		1) 로그인 시 아이디 저장 saveId 체크박스의 체크 여부에 따라 서버에서 쿠키 생성
		   (쿠키 key=saveid, value=userid)
		2) response 객체에 setCookie 메소드를 이용하여 쿠키 객체 전달( 브라우저가 해당 쿠키 관리 ) 
		3) 다음 요청 때 이 쿠키를 함께 서버로 전송함
		4) 서버가 로그인 페이지를 생성할 때 전송된 쿠키 배열객체에서
		   saveid 라는 쿠키가 있다면 그 value를 id 입력상자에 입력하고 아이디 저장 체크받스를 check 함
	*/

	// 아이디 저장 체크박스 값을 수정하기 위한 변수
	boolean saveId = false; 

	// 쿠키에 저장된 아이디를 저장할 변수
	String userIdSaved = "";

	Cookie[] cookies = request.getCookies();

	// 아이디 저장 체크박스
	// 아이디 저장을 체크하지 않으면 서버 첫 시작 시 request.getCookies() 값이 null 이므로
	// 조건없이 바로 접근하면 NullPointerException이 발생한다!
	//  --> if 문으로 null여부 체크

	if(cookies != null) {
		for(Cookie ck : cookies) {
			if(ck.getName().equals("saveId")) {
				userIdSaved = ck.getValue();
				saveId = true;
			}
		}
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- ajax.googleapis.com -->
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
		<style>
			body {
				background:url('<%=request.getContextPath() %>/images/tvxq.jpg') no-repeat;
				background-size:cover;
				font-family: 'Noto Sans KR', sans-serif;
				color: white;
			}
			h1 {
				text-align: center;
			}
			#loginBtn input, #memberJoinBtn, #logoutBtn, #myPage{
				display:inline-block;
				verticla-align:middle;
				text-align:center;
				background:darkred;
				color:white;
				height:25px;
				width:100px;
				border-radius:5px;
			}
			#memberJoinBtn {
				background:yellowgreen;
			}
			#loginBtn:hover, #changeInfo:hover, #logoutBtn:hover, #memberJoinBtn:hover, #myPage:hover{
				cursor:pointer;
			}
			.loginArea > form, #userInfo {
				float:right;
			}
			#userInfo {
				text-align: center;
				background-color: rgba(255,255,255,0.4);
				border-radius: 5px;
				padding: 10px;
				margin: 0 10px 0 0;
			}
			#welcomeUser {
				display: inline-block;
				margin-bottom: 10px;
			}
			#welcomeUser span {
				font-weight: 900;
			}
			#logout, #myPage {
				background:orangered;
				color:white;
				text-decoration:none;
				border-radius:5px;
			}
			#myPage {
				background:yellowgreen;
			}
			
			.wrap {
				background:black;
				width:100%;
				height:50px;
			}
			.menu {
				background:black;
				color:white;
				text-align:center;
				vertical-align:middle;
				width:150px;
				height:50px;
				display:table-cell;
			}
			.nav {
				width:600px;
				margin-left:auto;
				margin-right:auto;
			}
			.menu:hover {
				background:darkgray;
				color:orangered;
				font-weight:bold;
				cursor:pointer;
			}
		</style>
	</head>
	<body>
		<h1>Welcome JSP Project!!!</h1>
		
		<!----------------------- 회원 관련 서비스 ------------------------------->
		
		<div class="loginArea">
		<!-- 2. 로그인 여부에 따라 화면 변경 -->
		<!-- 2.1 로그인 되어있는 경우 / 안되어 있는 경우에 따라 화면이 달라야 하기 때문에
				 if 문을 이용하여 session의 값을 검사->session 값 유무에 따라 화면 변경 
				  ->> 페이지 제일 상단에 session값을 저장해놓을 변수 선언
		-->	
		
			<!-- 2.2 로그인이 되어 있지 않은 경우 -->
			<% if(loginUser == null ) { %>
			
			<!-- 1.1 로그인 관련 폼 만들기 -->
			<form action="<%=request.getContextPath() %>/login.me" id="loginForm" method="POST" onsubmit="return validate();">
				<table>
					<tr>
						<td>ID : </td>
						<td><input type="text" name="userId" id="userId" value="<%=saveId? userIdSaved : ""%>"></td>
					</tr>
					<tr>
						<td>PWD : </td>
						<td><input type="password" name="userPwd" id="userPwd"></td>
					</tr>
					<tr>
						<td colspan="2"><label><input type="checkbox" name="saveId" <%= saveId ? "checked" : "" %> >&nbsp;아이디 저장</label></td>
					</tr>
				</table>
				<div class="btns" align="center">
					<div id="memberJoinBtn" onclick="memberJoin();">회원가입</div>
					<div id="loginBtn"><input type="submit" value="로그인"></div>
				</div>
			</form>
			<% } else { %>
				<div id="userInfo">
					<label id="welcomeUser"><span><%=loginUser.getName() %></span> 님 환영합니다!</label>
					<div class="btns" align="right">
						<div id="myPage" onclick="">정보수정</div>
						<div id="logoutBtn" onclick="logout();">로그아웃</div>
					</div>
				</div>
			<% } %>
		</div>
		<script>
			/* 1.2 로그인 유효성 검사 */ 
			function validate() {
				if($("#userId").val().trim().length == 0) {
					alert("아이디를 입력하세요");
					$("#userId").focus();
					return false;
				}
				if ( $("#userPwd").val().trim().length == 0 ) {
					alert("비밀번호를 입력하세요");
					$("#userPwd").focus();
					return false;
				}
				return true;
				// LoginServlet 생성하기
			}
			// 2.3 로그아웃
			function logout() {
				// 로그아웃 버튼 클릭 시
				// LogoutServlet으로 이동하여
				// session에 저장된 값을 삭제
				location.href = "<%= request.getContextPath()%>/logout.me";
			}
		</script>
	</body>
</html>