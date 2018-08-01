<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div align="center">
<h2>선수 수정</h2>
<form action="/kinone/admin/pupdate1.do" method="POST" enctype="multipart/form-data">
<input type=hidden name="pcode" value="${player.pcode}">
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
	<td><input type="text" name="pname" value="${player.pname }"></td>
	<td><input type="text" name="ccode" value="${player.ccode }"></td>
	<td><input type="text" name="pno" value="${player.pno }"></td>
	<td><input type="text" name="position" value="${player.position }"></td>
	<td><input type="file" name="photo"></td>
	
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
	<td><input type="text" name="nation" value="${playerd.nation}"></td>
	<fmt:parseDate value="${playerd.birthdate}" var="bd1" pattern="yyyy-MM-dd HH:mm:ss"/>
	<fmt:formatDate value="${bd1}" var="bd2" pattern="yyyy-MM-dd" />
	<td><input type="date" name="birthdate1" value="${bd2}"></td>
	<td><input type="text" name="height" value="${playerd.height }"></td>
	<td><input type="text" name="weight" value="${playerd.weight }"></td>
</tr>
</table>bd2=${bd2}<br>${playerd.birthdate}


<input type=submit value="수정" >
<input type="button" value="취소" onclick="location.href='/kinone/admin/pview.do?pcode=${player.pcode}'">
<input type="button" value="목록으로" onclick="location.href='/kinone/admin/plist.do'">
</form>


</div>
</body>
</html>