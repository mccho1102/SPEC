<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	body{
		background:url('<%=request.getContextPath() %>/images/체리배경2.png') no-repeat;
		color : white;
		background-size : 100%;
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
		action="<%= request.getContextPath() %>/login.me"
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
		
	

	</script>
</body>
</html>