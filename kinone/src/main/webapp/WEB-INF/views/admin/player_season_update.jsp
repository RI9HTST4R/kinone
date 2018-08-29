<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
select.form-control {
	display: inline-block;
	width: 118px;
	padding: 0px;
	border-radius: 2px;
	height: 30px;
	}
</style>
<div class="container">
	<div class="wrapper">
		<h1 id="title">시즌 정보 수정</h1>
		<hr>
		<div>
			<br />
			<h3>기본정보</h3>
			<table class="table table-sm">
				<thead>
					<tr>
						<th>선수 이름</th>
						<th>소속 구단</th>
						<th>백넘버</th>
						<th>포지션</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${player.pname }</td>
						<td><c:set var="key" value="${player.ccode}" /> <c:out
								value="${cn[key]}" /></td>
						<td>${player.pno }</td>
						<td>${player.position }</td>
					</tr>
				</tbody>
			</table>
			<br />
			<h3>상세정보</h3>
			<table class="table table-sm">
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

						<td>${playerd.nation }</td>
						<fmt:parseDate value="${playerd.birthdate}" var="bd1"
							pattern="yyyy-MM-dd HH:mm:ss" />
						<fmt:formatDate value="${bd1}" var="bd2" pattern="yyyy-MM-dd" />
						<td>${bd2}</td>
						<td>${playerd.height }cm</td>
						<td>${playerd.weight }kg</td>

					</tr>
				</tbody>
			</table>
			<br />
			<h3>시즌정보</h3>
			<table class="table table-sm">
				<thead>
					<tr>
						<th>시즌</th>
						<th>팀코드</th>
						<th>시즌 게임 수</th>
						<th>실점</th>
						<th>득점</th>
						<th>도움</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty players}">
						<c:set var="key" value="${0 }" />
						<c:forEach var="players" items="${players }" varStatus="i">
							<form id="editForm${i.count}">
								<input type=hidden name="pcode" value="${player.pcode }">
								<tr>
									<td><input type="text" name="seasoncode"
										value="${players.seasoncode }" size="8"></td>
									<td><select name="ccode" class="form-control">
											<option value="">팀</option>
											<c:set var="key" value="${players.ccode }" />
											<c:forEach var="p" items="${cn}">
												<option value="${p.key}"
													<c:if test="${p.key==key}">selected</c:if>>
													${p.value}</option>
											</c:forEach>
									</select></td>
									<td><input type="text" name="gamecount"
										value="${players.gamecount }" size="5"></td>
									<td><input type="text" name="p_lgoal"
										value="${players.p_lgoal }" size="5"></td>
									<td><input type="text" name="p_ggoal"
										value="${players.p_ggoal }" size="5"></td>
									<td><input type="text" name="p_assist"
										value="${players.p_assist }" size="5"></td>
									<td><input type=button value="수정"
										onClick="edit('${i.count}')"></td>
								</tr>

							</form>
						</c:forEach>
					</c:if>
				</tbody>
			</table>


			<input type="button" value="취소"
				onclick="location.href='/kinone/admin/pview.do?pcode=${player.pcode}'">
			<input type="button" value="목록으로"
				onclick="location.href='/kinone/admin/plist.do'">



		</div>
		<script>
			function edit(num) {
				var formdata = $("#editForm" + num).serialize();

				$.post("/kinone/admin/pupdate2.do", formdata, function(data) {
					if (data == 1) {
						location.reload();
					}
				});

			}
		</script>

	</div>
</div>
<%@ include file="footer.jsp"%>