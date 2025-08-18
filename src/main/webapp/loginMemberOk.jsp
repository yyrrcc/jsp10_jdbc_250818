<%@page import="jsp10_jdbc_250818.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공여부</title>
</head>
<body>
	<%
		String mid = request.getParameter("loginid");
		String mpw = request.getParameter("loginpw");
		
		MemberDao memberDao = new MemberDao();
		int loginResult = memberDao.loginCheck(mid, mpw);
		
		if (loginResult == MemberDao.LOGIN_SUCCESS) {
			session.setAttribute("sessionId", mid); // 세션에 로그인 성공한 아이디 저장
			out.println("<script> alert('로그인 성공') </script>");
		} else {
			out.println("<script> alert('로그인 실패'); history.go(-1); </script>");
		}
	%>
</body>
</html>