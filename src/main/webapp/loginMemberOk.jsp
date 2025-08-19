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
		
		request.setAttribute("mid", mid);
	%>
	<h4>${mid }님 환영합니다. - request 객체 이용</h4>
	<h4>${sessionId }님 환영합니다. - session 에서 가져옴</h4>
	<h4><a href="modifyMember.jsp">회원 정보 수정하기</a></h4>
</body>
</html>