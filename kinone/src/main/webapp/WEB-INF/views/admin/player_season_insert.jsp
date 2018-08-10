<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div class="container">
	<div class="wrapper">
		<h1 id="title">시즌 정보 수정</h1>
		<hr> 
		<div align="center">

<table class="table table-sm">
<tr>
	<td colspan=5><h4>선수 기본정보</h4></td>
</tr>
<tr>
	<td>선수 이름</td>
	<td>소속 구단</td>
	<td>백넘버</td>
	<td>포지션</td>
	<td>사진</td>
</tr>
<tr>
	<td>${player.pname }</td>
	<td><c:set var="key" value="${player.ccode}"/>
					<c:out value="${cn[key]}"/></td>
	<td>${player.pno }</td>
	<td>${player.position }</td>
	<td></td>
	
</tr>
<tr>
	<td colspan=4><h4>선수 상세정보</h4></td>
</tr>
<tr>
	<td>출생국</td>
	<td>생일</td>
	<td>키</td>
	<td>몸무게</td>
</tr>
<tr>
	
	<td>${playerd.nation }</td>
	<fmt:parseDate value="${playerd.birthdate}" var="bd1" pattern="yyyy-MM-dd HH:mm:ss"/>
	<fmt:formatDate value="${bd1}" var="bd2" pattern="yyyy-MM-dd" />
	<td>${bd2}</td>
	<td>${playerd.height }cm</td>
	<td>${playerd.weight }kg</td>
	
</tr>
</table>

<table class="table table-sm">
	<tr>
		<td colspan=6><h4>선수 시즌정보</h4></td>
	</tr>
	<tr>
		<td>시즌</td>
		<td>팀명</td>
		<td>시즌 게임 수</td>
		<td>실점</td>
		<td>득점</td>
		<td>도움</td>
	</tr>
	
	<c:if test="${not empty players}">
	<c:set var="key" value="${0 }"/>
	<c:forEach var="players" items="${players }" varStatus="i">
		<form id="editForm${i.count}">
		<input type=hidden name="pcode" value="${player.pcode }">
			<tr>
				<td>${players.seasoncode }</td>
				<td><c:set var="key" value="${player.ccode}"/>
					<c:out value="${cn[key]}"/></td>
				<td>${players.gamecount }</td>
				<td>${players.p_lgoal }</td>
				<td>${players.p_ggoal }</td>
				<td>${players.p_assist }</td>
			</tr>
		
		</form>
	</c:forEach>
	</c:if>
	
	</table>
<form action="/kinone/admin/pupdate3.do" method="POST">
<input type=hidden name="pcode" value="${player.pcode }">
	<table class="table table-sm">
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
			<td><select name="ccode" >
				<option value="">팀</option>
				<c:forEach var="i" items="${cn}">
				<option value="${i.key }">${i.value }</option>
				</c:forEach>
			</select></td>
			<td><input type="text" name="gamecount" ></td>
			<td><input type="text" name="p_lgoal" ></td>
			<td><input type="text" name="p_ggoal" ></td>
			<td><input type="text" name="p_assist" ></td>
	</tr>	

</table>
<input type=submit value="입력" >
</form>

<input type="button" value="취소" onclick="location.href='/kinone/admin/pview.do?pcode=${player.pcode}'">
<input type="button" value="목록으로" onclick="location.href='/kinone/admin/plist.do'">



</div>

	</div>
</div>
<%@ include file="footer.jsp"%>



