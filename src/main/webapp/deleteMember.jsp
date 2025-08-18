<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
	<h4>탈퇴하실 아이디를 입력하세요</h4>
	<form action="deleteMemberOk.jsp" method="post">
	아이디 <input type="text" name="deleteid"><br/>
	<input type="submit" value="탈퇴하기">
	<input type="reset" value="다시 입력하기">
	</form>
</body>
</html>