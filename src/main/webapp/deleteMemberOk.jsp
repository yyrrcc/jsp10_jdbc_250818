<%@page import="jsp10_jdbc_250818.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 확인</title>
</head>
<body>
	 <%
	 	String mid = request.getParameter("deleteid");
	 
	 	MemberDao memberDao = new MemberDao();
	 	int deleteResult = memberDao.deleteMember(mid);
	 	
	 	if (deleteResult == MemberDao.ID_EXISTENT) {
			out.println("<script> alert('성공적으로 탈퇴 되셨습니다.'); location.href = 'JoinMember.jsp'; </script>");
			//response.sendRedirect("JoinMember.jsp"); 이게 먼저 실행됨 그래서 사용 불가
	 	} else {
			out.println("<script> alert('존재하지 않는 아이디 입니다.'); history.go(-1); </script>");
	 	}
	 %>
</body>
</html>