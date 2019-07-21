<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Error Page</title>
	</head>
	<body>
		<h1 align="center"><%=msg%></h1>
		<div align="center">
			<button onclick="location.href='<%=request.getContextPath()%>'">메인으로 돌아가기</button>
		</div>
	</body>
</html>