<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div align="center">
<h2>선수 입력1</h2>
<form action="/kinone/admin/pinsert1.do" method="POST" enctype="multipart/form-data">

<table border=1px>
<tr>
	<td colspan=5>선수 기본정보</td>
</tr>
<tr>
	<td>선수 이름</td>
	<td>소속 구단</td>
	<td>백넘버</td>
	<td>포지션</td>
	<td>사진</td>
</tr>
<tr>
	<td><input type="text" name="pname"></td>
	<td><input type="text" name="ccode"></td>
	<td><input type="text" name="pno"></td>
	<td><input type="text" name="position"></td>
	<td><input type="file" name="file"></td>
	
</tr>
<tr>
	<td colspan=4>선수 상세정보</td>
</tr>
<tr>
	<td>출생국</td>
	<td>생일</td>
	<td>키</td>
	<td>몸무게</td>
</tr>
<tr>
	<td><input type="text" name="nation" ></td>
	<td><input type="date" name="birthdate1" value="1980-01-01"></td>
	<td><input type="text" name="height"></td>
	<td><input type="text" name="weight"></td>
</tr>

</table>
<input type=submit value="입력" >
<input type="button" value="취소" onclick="location.href='/kinone/admin/plist.do'">
</form>

</div>
</body>
</html>