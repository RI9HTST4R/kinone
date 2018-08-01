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
<h2>${player.pname}선수 정보</h2>
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
	<td>${player.pname}</td>
	<td>${player.ccode}</td>
	<td>${player.pno }</td>
	<td>${player.position}</td>
	<td><img src="${player.photo }"/></td>
	
</tr>
<tr>
	<td colspan=5>선수 상세정보</td>
</tr>
<tr>
	<td>출생국</td>
	<td>생일</td>
	<td>키</td>
	<td>몸무게</td>
	<td></td>
</tr>
<tr>
	<td>${playerd.nation}</td>
	<td>${playerd.birthdate}</td>
	<td>${playerd.height}</td>
	<td>${playerd.weight}</td>
	<td></td>
</tr>
<tr>
	<td colspan=5>선수 시즌별 정보</td>
</tr>
<tr>
	<td>시즌</td>
	<td>출장수</td>
	<td>득점</td>	
	<td>실점</td>
	<td>도움</td>
</tr>
<c:forEach var="players" items="${players}" >
	<c:if test="${empty players.seasoncode}">
	</c:if>
	<c:if test="${not empty players.seasoncode}">
	<tr>
		<td>${players.seasoncode}</td>
		<td>${players.gamecount}</td>
		<td>${players.p_ggoal}</td>
		<td>${players.p_lgoal}</td>
		<td>${players.p_assist}</td>
	</tr>
	</c:if>
</c:forEach> 
</table>


<input type="button" value="기본정보수정" onclick="location.href='/kinone/admin/pupdateForm1.do?pcode=${player.pcode}'">
<input type="button" value="시즌정보수정" onclick="location.href='/kinone/admin/pupdateForm2.do?pcode=${player.pcode }'">
<input type="button" value="시즌정보업데이트" onclick="location.href='/kinone/admin/pupdateForm3.do?pcode=${player.pcode }'">
<input type="button" value="삭제" onclick="location.href='/kinone/admin/pdeleteForm.do?pcode=${player.pcode }'">
<input type="button" value="목록" onclick="location.href='/kinone/admin/plist.do?pageNum=1'">
</div>
</body>
</html>