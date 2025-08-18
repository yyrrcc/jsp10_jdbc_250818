<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h2>회원가입 양식</h2>
	<form action="JoinMemberOk.jsp" name="joinForm" method="post">
	<!-- <form action="JoinMemberOk2.jsp" name="joinForm" method="post"> -->
		아이디 <input type="text" name="memberid"><br/>
		비밀번호 <input type="password" name="memberpw"><br/>
		이름 <input type="text" name="membername"><br/>
		나이 <input type="text" name="memberage"><br/>
		이메일 <input type="text" name="memberemail"><br/>
		
		<input type="submit" value="회원가입">
		<input type="reset" value="다시작성">
	</form>
</body>
</html>