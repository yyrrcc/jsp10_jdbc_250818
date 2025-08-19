<%@page import="jsp10_jdbc_250818.dto.MemberDto"%>
<%@page import="jsp10_jdbc_250818.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
	<h4>정보를 수정하세요.</h4>
	<%
		// 세션에 저장된 아이디 가져오기
		String sid = (String) session.getAttribute("sessionId");
	
		// 만약 세션에 저장된 아이디가 없으면 경고창 띄우고 로그인 페이지로 이동
		if (sid == null) {
			out.println("<script> alert('로그인한 회원만 접속할 수 있습니다.'); location.href = 'loginMember.jsp'; </script>");
		} else {
			MemberDao memberDao = new MemberDao();
			MemberDto memberDto = memberDao.getMemberInfo(sid); // 메서드 매개변수로 세션에 저장된 아이디 넣어서 MemberDto 가져오기
			
			request.setAttribute("m", memberDto); // EL ${}로 값 전달하기 위해
		}

	%>
	<form action="modifyMemberOk.jsp" method="post">		
		아이디 <input type="text" name="memberid" value="${m.memberid }" readonly><br/>
		비밀번호 <input type="password" name="memberpw" value="${m.memberpw }"><br/>
		이름 <input type="text" name="membername" value="${m.membername }"><br/>		
		나이 <input type="text" name="memberage" value="${m.memberage }"><br/>
		이메일 <input type="text" name="memberemail" value="${m.memberemail }"><br/>
		가입일 <input type="text" name="memberdate" value="${m.memberdate }" readonly><br/>
		<input type="submit" value="수정완료">
	</form>
</body>
</html>