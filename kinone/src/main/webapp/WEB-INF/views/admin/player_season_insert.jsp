<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div align="center">
<h2>선수 수정</h2>
<table border=1px>
	<tr>
		<td colspan=5>선수 시즌정보</td>
	</tr>
	<tr>
		<td>시즌</td>
		<td>팀코드</td>
		<td>시즌 게임 수</td>
		<td>실점</td>
		<td>득점</td>
		<td>도움</td>
	</tr>
	<c:forEach var="players" items="${players }" varStatus="i">
		<c:if test="${not empty players}">
			<tr>
				<td><input type="text" name="seasoncode" value="${players.seasoncode }"></td>
				<td><input type="text" name="ccode" value="${players.ccode }"></td>
				<td><input type="text" nam="gamecount" value="${players.gamecount }"></td>
				<td><input type="text" nam="p_lgoal" value="${players.p_lgoal }"></td>
				<td><input type="text" nam="p_ggoal" value="${players.p_ggoal }"></td>
				<td><input type="text" nam="p_assist" value="${players.p_assist }"></td>
				</tr>
		</c:if>
		
	</c:forEach>
	</table>
<form action="/kinone/admin/pupdate3.do" method="POST">
<input type=hidden name="pcode" value="${player.pcode }">
	<table border=1px>
	<tr>
		<td colspan=6>시즌 추가</td>
	</tr>
		<tr>
		<td>시즌</td>
		<td>팀코드</td>
		<td>시즌 게임 수</td>
		<td>실점</td>
		<td>득점</td>
		<td>도움</td>
	</tr>
	<tr>
			<td><input type="text" name="seasoncode" ></td>
			<td><input type="text" name="ccode" ></td>
			<td><input type="text" name="gamecount" ></td>
			<td><input type="text" name="p_lgoal" ></td>
			<td><input type="text" name="p_ggoal" ></td>
			<td><input type="text" name="p_assist" ></td>
	</tr>	

</table>

<input type=submit value="수정" >
<input type="button" value="취소" onclick="location.href='/kinone/admin/pview.do?pcode=${player.pcode}'">
<input type="button" value="목록으로" onclick="location.href='/kinone/admin/plist.do'">
</form>


</div>
</body>
</html>