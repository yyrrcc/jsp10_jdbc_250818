<%@page import="jsp10_jdbc_250818.dto.MemberDto"%>
<%@page import="jsp10_jdbc_250818.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공여부</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		// form에서 데이터 가져오고, int는 형변환
		String mid = request.getParameter("memberid");
		String mpw = request.getParameter("memberpw");
		String mname = request.getParameter("membername");
		int mage = Integer.parseInt(request.getParameter("memberage"));
		String memail = request.getParameter("memberemail");
		
		// MemberDto 클래스를 이용해서 값 받아오기
		MemberDto memberDto = new MemberDto();
		memberDto.setMemberid(mid);
		memberDto.setMemberpw(mpw);
		memberDto.setMembername(mname);
		memberDto.setMemberage(mage);
		memberDto.setMemberemail(memail);
		
		MemberDao memberDao = new MemberDao();
		
		// 아이디 중복 검사	
		int idCheck = memberDao.confirmId(memberDto.getMemberid());
		if (idCheck == MemberDao.ID_EXISTENT) {
			out.println("<script> alert('이미 존재하는 아이디입니다.'); history.go(-1); </script>");
		} else {
			int joinResult = memberDao.insertMember(memberDto);
			// 상수(성공 1, 실패 0)를 가져오는 게 가독성이 좋음
			if (joinResult == MemberDao.MEMBER_JOIN_SUCCESS) {
				// 자바스크립트 이용해서 경고창 띄우기
				out.println("<script> alert('회원가입 성공') </script>");
				//response.sendRedirect("loginMember.jsp");
			} else {
				out.println("<script> alert('회원가입 실패'); history.go(-1); </script>");
			}
		}

	%>
	
	
</body>
</html>