<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	//Member loginUser = new Member("userid", "userPwd", "name", "phone","email","address","null");
	String interest = (loginUser.getInterest().equals("null"))? "관심항목을 체크하지 않았습니다" : loginUser.getInterest();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY INFO</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
	body {
		font-family: 'Nanum Gothic', sans-serif;
		font-size: 12px;
	}
	table {
		border-collapse: collapse;
	}
	td {
		border: 1px solid #ccc;
		padding: 10px 20px;
		width: 250px;
	}
	th {
		border: 1px solid #ccc;
		padding: 10px 20px;
		background-color: #eee;
		width: 100px;
		height: 30px;
	}
	.myInfo {
		text-align: center;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<th>아이디</th>
			<td><%=loginUser.getUserId()%></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=loginUser.getName()%></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><%=loginUser.getPhone()%></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=loginUser.getEmail()%></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><%=loginUser.getAddress()%></td>
		</tr>
		<tr>
			<th>관심분야</th>
			<td><%=interest%></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><%=loginUser.getEnrollDate()%></td>
		</tr>
	</table><br>
	<div class="myInfo">
		<button class="btn btn-primary btn-sm">확인</button>
	</div>
</body>
</html>