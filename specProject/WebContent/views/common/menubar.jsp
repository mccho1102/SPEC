<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
	body{
		background:url('<%=request.getContextPath()%>/images/체리배경2.png') no-repeat;
		color : white;
		background-size : 100%;
	}
	.hshLogin{
		float: left;
		background-color: white;
		border: 1px solid #ccc;
		border-radius: 3px;
		color: #333;
		text-align: center;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 12px;
		padding: 10px 20px;
		margin: 0 0 0 10px;
	}
	#hshUserId, #hshUserPw {
		border-radius: 3px;
		padding-left : 6px;
		display: inline-block;
		wdith: 100px;
		height: 30px;
		margin: 0 0 5px 0;
	}
	.btn {
		margin: 0 0 10px 0;
	}
	.hshLogin a {
		font-size: 14px;
	}
	.hshLogin tr:nth-child(4) {
		text-align: left;
	}
	#loginBtn input, #memberJoinBtn, #logoutBtn, #myPage{
		display:inline-block;
		verticla-align:middle;
		text-align:center;
		background:orangered;
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
	<h1 align="center">안녕하세요 세미프로젝트!!!</h1>
	
	<div class="loginArea">
		
		<!-- 1.1 로그인 관련 폼 만들기 -->
		<form id="loginForm" method="POST" 
		action="<%=request.getContextPath()%>/login.me"
		onsubmit="return validate();">
		
		<table>
			<tr>
				<td>ID : </td>
				<td>
					<input type="text" name="userId" id="userId">
				</td>			
			</tr>
			<tr>
				<td>PW : </td>
				<td>
					<input type="password" name="userPwd" id="userPwd">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="checkbox" name="saveId" id="saveId">&nbsp;
					<label for="saveId">아이디 저장</label>
			</tr>
		</table>
		
		<div class="btns" align="center">
			<div id="memberJoinBtn" onclick="memberJoin();">
			회원가입
			</div>
			<div id="loginBtn">
				<input type="submit" value="로그인">
			</div>
		</div>
		</form>
	</div>
	<% if ( loginUser == null ) { %>
		<div class="hshLogin" >
			<form action="<%=request.getContextPath()%>/hshLogin.me" method="POST" id="hshLoginForm" onsubmit="return loginCheck();">
				<table>
					<tr>
						<td><p>= HSH LOGIN =</p></td>
					</tr>
					<tr>
						<td><input type="text" id="hshUserId" name="hshUserId" placeholder="아이디를 입력하세요"></td>
					</tr>
					<tr>
						<td><input type="password" id="hshUserPw" name="hshUserPw" placeholder="비밀번호를 입력하세요"></td>
					</tr>
					<tr>
						<td><label><input type="checkbox" name="hshSaveId" id="hshSaveId" checked> 아이디 저장</label></td>
					</tr>
					<tr>
						<td><button type="submit" id="hshLoginBtn"  class="btn btn-primary btn-sm btn-block">LOGIN</button> </td>
					</tr>
					<tr>
						<td><p>아이디가 없으신가요?<br><a onclick="hshJoin();">회원가입</a></p></td>
					</tr>
				</table>
			</form>
		</div>
	<% } else { %>
		<div class="hshLogin">
			
		</div>
	<% } %>
	<script>
		// 1.2 로그인 유효성 검사
		function validate(){
			if($("#userId").val().trim().length == 0){
				alert("아이디를 입력하세요");
				$("#userId").focus();
				
				return false;
			}
			
			if($("#userPwd").val().trim().length == 0){
				alert("비밀번호를 입력해주세요");				
				$("#userPwd").focus();
				
				return false;
			}
			
			return true;
		}
		
		function loginCheck(){
			if($("#hshUserId").val().trim().length==0) {
				alert("아이디를 입력하세요");
				$("#hshUserId").focus();
				return false;
			} else if($("#hshUserPw").val().trim().length==0) {
				alert("비밀번호를 입력하세요");
				$("#hshUserPw").focus();
				return false;
			} else {
				return true;
			}
		}
	</script>
</body>
</html>