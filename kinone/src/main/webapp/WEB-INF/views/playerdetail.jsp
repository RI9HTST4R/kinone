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

.playerph {
	position: relative;
	float: left;
	width: 135;
	height: 165;
	margin-top: 50;
	margin-left: 50;
	display: inline-block;
}
.playertable{
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
	display:block;
	clear: both;
	width:100%;
}

.wrapper {
	position: relative;
}

.wrapper:after {
	content: " ";
	display: block;
	clear: both;
}
table{
text-align:center;
} 

.tu{
	bgcolor:blue;
	color:white;
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
.card-header {
    padding: .75rem 1.25rem;
    margin-top:15;
    margin-bottom: 0;
    background-color: rgb(237, 239, 244);
    border-bottom: 1px solid rgba(0,0,0,.125);
}
.card-body {
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 1.25rem;
    background-color: white;
    border:0.1px solid rgb(237, 239, 244);
    height:320px;
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
.player-vs .player-score .name {
    position: relative;
    font-size: 23px;
    font-weight: lighter;
    color: #00477e;
    padding-top: 5px;
    margin-top: 50;
	margin-left: 150;
}
</style>

<div class="card-header">선수 정보</div>
<div class="card-body">

	<div class="playerph">
			<c:if test="${player.photo!=null}">
				<img class="pimage"
					src="${url}/resources/player/${player.pcode}.png">
			</c:if>
			<c:if test="${player.photo==null}">
				<img class="pimage" src="${url}/resources/player/nop.png">
			</c:if>
		</div>
		<div class="playername">
                        1232132
                        <div class="name">#16 함석민</div>
                        <div class="score">
                            <div>
                                <span class="tit">출장</span>
                                <span class="data">30</span>
                            </div>
                                                        <div>
                                <span class="tit">실점</span>
                                <span class="data">29</span>
                            </div>
                                                    </div>
		
		</div>
</div>


<div class="pagetitle">
	<span>${player.pname}</span>
</div>
<Br>
<div class="container">
	<div class="wrapper">
		<div class="pcard-left">
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
		<div class="playertable">
		<font size="2" face="Jua" >
		<div class="playerbase">
		
			<table class="table table-sm" >
				<tr >
					<td>이름</td>
				</tr>
				<tr>
					<td >${player.pname}</td>
				</tr>
				<tr>
					<td >소속</td>
				</tr>
				<tr>
					<td><c:set var="key" value="${player.ccode}" /> <c:out
							value="${cn[key]}" /></td>
				</tr>
				<tr>
					<td>백넘버</td>
				</tr>
				<tr>
					<td>${player.pno}</td>
				</tr>
				<tr>
					<td>포지션</td>
				</tr>
				<tr>
					<td>${player.position}</td>
				</tr>
			</table>
		</div>

		<div class="playerdetail">
			<table class="table table-sm">
				<tr>
					<td>출생국</td>
				</tr>
				<tr>
					<td>${playerd.nation}</td>
				</tr>
				<tr>
					<td>생일</td>
				<tr>
					<td><fmt:parseDate value="${playerd.birthdate}" var="bd1"
							pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate value="${bd1}"
							var="bd2" pattern="yyyy-MM-dd" /> ${bd2}</td>
				</tr>
				<tr>
					<td>키</td>
				</tr>
				<tr>
					<td>${playerd.height}</td>
				</tr>
				<tr>
					<td>몸무게</td>
				</tr>
				<tr>
					<td>${playerd.weight}</td>
				</tr>
			</table>
		</div>

		<div class="playerseason">
			<table class="table table-sm">
				<tr>
					<td colspan=6>선수 시즌별 정보</td>
				</tr>
				<tr>
					<td>시즌</td>
					<td>소속 구단</td>
					<td>출장수</td>
					<td>득점</td>
					<td>실점</td>
					<td>도움</td>
				</tr>
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
			</table>
			
		</div>
		</font>
		</div>
		

	</div>

</div>
<script>
	
</script>

<%@ include file="footer.jsp"%>