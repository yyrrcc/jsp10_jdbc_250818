<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
	 <%
	 	session.invalidate(); // 세션의 모든 값 지우기
	 	response.sendRedirect("loginMember.jsp"); // 로그인 페이지로 이동
	 %>
</body>
</html>