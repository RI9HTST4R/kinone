<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
	.table {
		width: 80%;
	}
	.table > thead > tr > th {
		text-align: center;
	}
	.table > tbody > tr > td {
		text-align: center;
	}
	.pinfobtn {
		padding: 2px 4px 2px 4px;
	}
</style>
<div class="container">
	<div class="wrapper" align="justify">
		<h1 id="title">${player.pname}</h1>
		<hr>
		<br/>
		<img src="/kinone/resources/player/${player.ccode}/${player.photo}"	width="150" height="150" />
		<br/>
		<h3>기본 정보</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>이름</th>
					<th>소속팀</th>
					<th>백넘버</th>
					<th>포지션</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${player.pname}</td>
					<td><c:set var="key" value="${player.ccode}" /> <c:out
							value="${cn[key]}" /></td>
					<td>${player.pno}</td>
					<td>${player.position}</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<h3>상세정보</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>출생국</th>
					<th>생일</th>
					<th>키</th>
					<th>몸무게</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${playerd.nation}</td>
					<fmt:parseDate value="${playerd.birthdate}" var="bd1"
						pattern="yyyy-MM-dd HH:mm:ss" />
					<fmt:formatDate value="${bd1}" var="bd2" pattern="yyyy-MM-dd" />
					<td>${bd2}</td>
					<td>${playerd.height}</td>
					<td>${playerd.weight}</td>
				</tr>
			</tbody>
		</table>
		<br />
		<h3>시즌별 정보</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>시즌</th>
					<th>소속팀</th>
					<th>출장수</th>
					<th>득점</th>
					<th>실점</th>
					<th>도움</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="key" value="${0 }" />
				<c:forEach var="players" items="${players}">
					<c:if test="${empty players.seasoncode}">
					</c:if>
					<c:if test="${not empty players.seasoncode}">
						<tr>
							<td>${players.seasoncode}</td>
							<td><c:set var="key" value="${players.ccode}" /> <c:out
									value="${cn[key]}" /></td>
							<td>${players.gamecount}</td>
							<td>${players.p_ggoal}</td>
							<td>${players.p_lgoal}</td>
							<td>${players.p_assist}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<br/>

		<input class="pinfobtn" type="button" value="기본정보수정"
			onclick="location.href='/kinone/admin/pupdateForm1.do?pcode=${player.pcode}'">
		<input class="pinfobtn" type="button" value="시즌정보수정"
			onclick="location.href='/kinone/admin/pupdateForm2.do?pcode=${player.pcode }'">
		<input class="pinfobtn" type="button" value="시즌정보업데이트"
			onclick="location.href='/kinone/admin/pupdateForm3.do?pcode=${player.pcode }'">
		<input class="pinfobtn" type="button" value="삭제" id="pdelete"
			onclick="pdelete('${player.pcode}')">
		<input class="pinfobtn" type="button"
			value="목록" onclick="location.href='/kinone/admin/plist.do?pageNum=1'">
	</div>
</div>
<script>
	function pdelete(pcode) {

		var result = confirm('정말로 삭제하시겠습니까?');
		if (result) { //yes 
			location.replace('/kinone/admin/pdelete.do?pcode=' + pcode);
		} else { //no
			return;
		}
	}
</script>

<%@ include file="footer.jsp"%>