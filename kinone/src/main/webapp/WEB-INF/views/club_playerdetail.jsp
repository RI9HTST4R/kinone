<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
.wrap_page {
	font-size: 0;
	text-align: justify;
	padding-bottom: 20px;
}

.pagetitle {
	background-color: skyblue;
}

.club-wrapper {
	padding: 5px;
	color: white;
	display: inline-block;
	margin: 10px;
	font-size: 15pt;
	height: 135px;
	width: calc(( 100% - 6 * 20px)/6);
	background-color: lightgray;
}

.club-wrapper:hover {
	transform: scale(1.1);
	cursor: pointer;
}

.pimage {
	width: 100%;
}

.container {
	margin-top: 30px;
}

.playertable {
	float: right;
	width: 67%;
	display: inline-block;
}

.playerbase {
	float: left;
	width: 33%;
}

.playerdetail {
	float: right;
	width: 67%;
}

.playerseason {
	display: block;
	clear: both;
	width: 100%;
	clear: both;
}

.wrapper {
	position: relative;
}

.wrapper:after {
	content: " ";
	display: block;
	clear: both;
}

table {
	text-align: center;
}

.tu {
	bgcolor: blue;
	color: white;
}

.card-header {
	position: relative;
	font-size: 16px;
	background-color: #fff;
	padding-left: 20px;
}

.card-header::before {
	position: absolute;
	content: "";
	width: 6px;
	height: 100%;
	left: 0;
	top: 0;
	background-color: #1892ed;
}

.cb1 {
	position: relative;
	float: left;
	display: inline-block;
}

.cb2 {
	position: relative;
	float: left;
	display: inline-block;
}

.cb3 {
	position: relative;
	float: left;
	display: inline-block;
}

.card-header {
	padding: .75rem 1.25rem;
	margin-top: 15;
	margin-bottom: 0;
	background-color: rgb(237, 239, 244);
	border-bottom: 1px solid rgba(0, 0, 0, .125);
}

.card-body1 {
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	padding: 1.25rem;
	background-color: white;
	border: 0.1px solid rgb(237, 239, 244);
	height: 320px;
}

.card-body2 {
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	padding: 1.25rem;
	background-color: white;
	border: 0.1px solid rgb(237, 239, 244);
	height: 20%;
}

.player-score {
	bottom: 110px;
}

.player-score {
	right: -140px;
	bottom: 165px;
}

.player-vs.float-left .player-score {
	right: -100px;
	text-align: right;
}

.playerph {
	position: relative;
	float: left;
	width: 135;
	height: 165;
	margin-top: 60;
	margin-left: 50;
	display: inline-block;
	text-align: right;
}

.playername {
	position: relative;
	float: left;
	color: #00477e;
	padding-top: 5px;
	margin-top: 50;
	margin-left: 150;
}

.name {
	position: relative;
	font-size: 23px;
	font-weight: lighter;
	color: #00477e;
	padding-top: 5px;
}

.name::before {
	position: absolute;
	content: "";
	width: 130px;
	height: 1px;
	background-color: #00477e;
	top: 0;
}

.score {
	font-size: 15px;
}

.playertable {
	position: relative;
	margin-left: 250;
	margin-top: 30;
	float: right;
	display: inline-block;
}

.player-profile {
	width: 400px;
}

.cb22 {
	width: 100%;
}

.career {
	width: 100%;
	height:
}

th {
	background-color: #edeff4;
}

thead {
	display: table-header-group;
	vertical-align: middle;
	border-color: inherit;
}

.table left-th player-profile {
	width: 100%;
}

button {
	background-color: #00477e;
	color: #ffffff;
	border: none;
	padding: 10px 20px;
	font-size: 17px;
	font-family: Raleway;
	cursor: pointer;
}
</style>
<a href="/kinone/clubDetail.do?ccode='${player.ccode}'&T=1">돌아가기</a>
<div class="card-header">선수 정보</div>
<div class="card-body1">

	<div class="cb1">
		<div class="playerph">
			<c:if test="${player.photo!=null}">
				<img class="pimage"
					src="${url}/resources/player/${player.pcode}.png">
			</c:if>
			<c:if test="${player.photo==null}">
				<img class="pimage" src="${url}/resources/player/nop.png">
			</c:if>
		</div>
	</div>
	<div class="cb2">
		<div class="playername">
			<div class="name">#${player.pno} ${player.pname}</div>
			<div class="score">
				<div>
					<span class="tit"></span> <span class="data"></span>
				</div>
				<div>
					<span class="tit"></span> <span class="data"></span>
				</div>
			</div>
		</div>
	</div>
	<div class="cb3">
		<div class="playertable">
			<table class="table left-th player-profile">
				<tbody>
					<tr>
						<th>국적</th>
						<td>${playerd.nation}</td>
					</tr>
					<tr>
						<th>포지션</th>
						<td>${player.position}</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><fmt:parseDate value="${playerd.birthdate}" var="bd1"
								pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate value="${bd1}"
								var="bd2" pattern="yyyy-MM-dd" /> ${bd2}</td>
					</tr>
					<tr>
						<th>신장</th>
						<td>${playerd.height}</td>
					</tr>
					<tr>
						<th>체중</th>
						<td>${playerd.weight}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div class="card-header">시즌 기록</div>

<div class="card-body2">
	<div class="cb22">
		<table class="career">
			<c:if test="${player.position !='GK' }">
				<thead class="thead-light">

					<tr>
						<th>년도</th>
						<th>소속</th>
						<th>출장</th>
						<th>득점</th>
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
								<td>${players.p_assist}</td>
							</tr>
						</c:if>
					</c:forEach>
			</c:if>
			<c:if test="${player.position =='GK' }">
				<thead class="thead-light">

					<tr>
						<th>년도</th>
						<th>소속</th>
						<th>출장</th>
						<th>실점</th>
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
								<td>${players.p_lgoal}</td>
							</tr>
						</c:if>
					</c:forEach>
			</c:if>
		</table>
		<br>


	</div>

</div>

<div align=right>
	<br>
	<button type="button" style="font-size: 14px;"
		onclick="location.href='/kinone/clubDetail.do?ccode=${player.ccode}&T=1'">돌아가기</button>
</div>




<script>
	
</script>

<%@ include file="footer.jsp"%>