<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h4>로그인을 하세요</h4>
	<form action="loginMemberOk.jsp" name="loginForm" method="post">
		아이디 <input type="text" name="loginid"><br/>
		비밀번호 <input type="password" name="loginpw"><br/>
		<input type="submit" value="로그인">
		<input type="reset" value="다시 입력하기">
	</form>
</body>
</html>