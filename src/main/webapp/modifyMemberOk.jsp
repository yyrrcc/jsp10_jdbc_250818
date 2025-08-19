<%@page import="jsp10_jdbc_250818.dto.MemberDto"%>
<%@page import="jsp10_jdbc_250818.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정완료</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		// request로 값 가져오기
		String id = request.getParameter("memberid");
		String pw = request.getParameter("memberpw");
		String name = request.getParameter("membername");
		int age = Integer.parseInt(request.getParameter("memberage"));
		String email = request.getParameter("memberemail");
		
		// 1. update1메서드 이용 (각각 변수를 매개변수로 받았을 때)
		MemberDao memberDao = new MemberDao();
		int updateResult = memberDao.updateMember(id, pw, name, age, email);
		if (updateResult == MemberDao.MEMBER_UPDATE_SUCCESS) {
			MemberDto memberDto = memberDao.getMemberInfo(id);
			request.setAttribute("m", memberDto);
		} else {
			out.println("<script> alert('회원 수정 실패'); history.go(-1); </script>");
		}

		
		// 2. update2 메서드 이용 (매개변수 MemberDto로 받았을 때) 
	    /*
		MemberDto memberDto2 = new MemberDto();
	    memberDto2.setMemberid(id);
	    memberDto2.setMemberpw(pw);
	    memberDto2.setMembername(name);
	    memberDto2.setMemberage(age);
	    memberDto2.setMemberemail(email);
	    
	    MemberDao memberDao = new MemberDao();
		memberDao.updateMember2(memberDto2);
	    
		request.setAttribute("m", memberDto2);
		*/
		

	%>
	<h3>수정된 회원 정보를 확인해보세요.</h3>
	아이디 : ${m.memberid } <br/>
	비밀번호 : ${m.memberpw } <br/>
	이름 : ${m.membername } <br/>
	나이 : ${m.memberage } <br/>	
	이메일 : ${m.memberemail } <br/>
	<h4><a href="logout.jsp">로그아웃</a></h4>
</body>
</html>