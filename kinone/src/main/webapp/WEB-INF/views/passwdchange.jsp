<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/kinone/passwdchange.do" method="POST">
<input type=hidden name=email value="${email}">
재설정할 비밀번호를 입력해주세요
<input type="text" name=passwd>

<input type="submit" value="확인">
</form>
</body>
</html>