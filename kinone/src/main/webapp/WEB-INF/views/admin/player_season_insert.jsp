<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div class="container">
	<div class="wrapper" align="center">
		<h1 id="title">시즌 정보</h1>
		<hr> 
<table class="table table-sm">
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
				<td><input type="text" name="gamecount" value="${players.gamecount }"></td>
				<td><input type="text" name="p_lgoal" value="${players.p_lgoal }"></td>
				<td><input type="text" name="p_ggoal" value="${players.p_ggoal }"></td>
				<td><input type="text" name="p_assist" value="${players.p_assist }"></td>
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
	</div>
<%@ include file="footer.jsp"%>