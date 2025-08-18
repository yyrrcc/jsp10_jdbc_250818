<%@page import="jsp10_jdbc_250818.dto.MemberDto"%>
<%@page import="jsp10_jdbc_250818.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="memberDto" class="jsp10_jdbc_250818.dto.MemberDto"></jsp:useBean>
<jsp:setProperty property="*" name="memberDto"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공여부(actiontags)</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

		// jsp:useBean 액션태그 이용해서 만들기
		// jsp:setProperty property * 를 이용하는 이유 : MemberDto 필드값, db의 column값이 동일하면
		// JavaBean 프로퍼티에 자동으로 값을 설정

		MemberDao memberDao = new MemberDao();
		int joinResult = memberDao.insertMember(memberDto);
		
		// 상수(성공 1, 실패 0)를 가져오는 게 가독성이 좋음
		if (joinResult == MemberDao.MEMBER_JOIN_SUCCESS) {
			// 자바스크립트 이용해서 경고창 띄우기
			out.println("<script> alert('회원가입 성공') </script>");
			//response.sendRedirect("login.jsp");
		} else {
			out.println("<script> alert('회원가입 실패'); history.go(-1); </script>");
		}
	%>
	
	
</body>
</html>