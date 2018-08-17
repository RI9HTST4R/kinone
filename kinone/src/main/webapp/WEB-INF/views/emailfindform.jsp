<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/kinone/emailfind.do" method="post">
가입 이름 입력
<br><input type="text" name="mname"><br>
가입 생년월일 입력
<br><input type="text" name="mbirthdate">
<Br>

<input type="submit" value="확인">
<input type="button" value="취소" onclick="close()">
</form>

</body>
</html>

