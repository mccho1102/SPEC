<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HSH ERROR PAGE</title>
<style>
	* { text-align: center; }
</style>
</head>
<body>
	<h2><%=msg%></h2>
	<button type="button" onclick="location.href='<%=request.getContextPath()%>'">메인으로 돌아가기</button>
</body>
</html>