<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div class="container">
	<div class="wrapper">
		<h1 id="title">시즌 정보</h1>
		<hr> 
		<div align="center">
<h2>선수 수정</h2>


<table class="table table-sm">
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
	<td>${player.pname }</td>
	<td>${player.ccode }</td>
	<td>${player.pno }</td>
	<td>${player.position }</td>
	<td></td>
	
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
	
	<td>${playerd.nation }</td>
	<fmt:parseDate value="${playerd.birthdate}" var="bd1" pattern="yyyy-MM-dd HH:mm:ss"/>
	<fmt:formatDate value="${bd1}" var="bd2" pattern="yyyy-MM-dd" />
	<td>${bd2}</td>
	<td>${playerd.height }cm</td>
	<td>${playerd.weight }kg</td>
	
</tr>
</table>

<table border=1px>
	<tr>
		<td colspan=7>선수 시즌정보</td>
	</tr>
	<tr>
		<td>시즌</td>
		<td>팀코드</td>
		<td>시즌 게임 수</td>
		<td>실점</td>
		<td>득점</td>
		<td>도움</td>
		<td>수정</td>
	</tr>
	
	<c:if test="${not empty players}">
	<c:forEach var="players" items="${players }" varStatus="i">
		<form id="editForm${i.count}">
		<input type=hidden name="pcode" value="${player.pcode }">
			<tr>
				<td><input type="text" name="seasoncode" value="${players.seasoncode }"></td>
				<td><input type="text" name="ccode" value="${players.ccode }"></td>
				<td><input type="text" name="gamecount"  value="${players.gamecount }"></td>
				<td><input type="text" name="p_lgoal"  value="${players.p_lgoal }"></td>
				<td><input type="text" name="p_ggoal"  value="${players.p_ggoal }"></td>
				<td><input type="text" name="p_assist"  value="${players.p_assist }"></td>
				<td><input type=button value="수정" onClick="edit('${i.count}')"></td>
			</tr>
		
		</form>
	</c:forEach>
	</c:if>
	
	</table>


<input type="button" value="취소" onclick="location.href='/kinone/admin/pview.do?pcode=${player.pcode}'">
<input type="button" value="목록으로" onclick="location.href='/kinone/admin/plist.do'">



</div>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function edit(num){
		var formdata = $("#editForm"+num).serialize();
		
		$.post("/kinone/admin/pupdate2.do", formdata, function(data){
			if(data == 1){
				location.reload();
			}
		});
		
	}
</script>

	</div>
</div>
<%@ include file="footer.jsp"%>