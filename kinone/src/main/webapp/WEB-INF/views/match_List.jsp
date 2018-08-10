<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<style>
	.pagetitle {
		background-color: purple;
	}
	.page-content {
		/* border: 1px solid red; */
		height: auto;
		width: 100%;
		padding-bottom: 20px;
		overflow: auto;
	}
	.matchInMonth {
		height: 90px;
		line-height: 90px;
		font-size: 30pt;
		margin-bottom: 10px;
	}
	.matchInMonth > * {
		margin: 0px 10px;
	}
	.month-day {
		/* border: 1px solid blue; */
		height: 50px;
		background-color: lightgray;
		color: black;
	}
	.match-day {
		line-height: 50px;
		font-size: 15pt;
	}
	.dayMatchList {
		width: 100%;
		height: auto;
		color: black;
		margin-bottom: 10px;
	}
	.dayMatchList td {
		vertical-align: middle;
	}
	.match-round {
		width: 20%;
		text-align: center;
	}
	.match-team {
		width: 30%;
		text-align: center;
	}
	.matchtime, .matchscore {
		font-weight: bold;
	}
	.match-team > img {
		width: 50px;
		height: 50px;
	}
	.match-stadium {
		width: 25%;
		text-align: justify;
	}
	.match-btn {
		width: 25%;
	}
	.match-btn > .btn {
		font-size: 0.9rem;
		background-color: white;
		width: 95px;
		height: 45px;
		margin-right: 5px;
	}
	.match-btn > .btn-warning {
		color: #eea236;
	}
	.match-btn > .btn-warning:hover {
		background-color: #f0ad4e;
		color: white;
	}
	.match-btn > .btn-info {
		color: #46b8da;
	}
	.match-btn > .btn-info:hover {
		background-color: #46b8da;
		color: white;
	}
	.match-btn > .btn-danger {
		color: #d43f3a;
	}
	.match-btn > .btn-danger:hover {
		background-color: #d9534f;
		color: white;
	}
</style>

<div class="pagetitle">
	<span>매치 일정 / 결과</span><br/>
	<a class="smenu menuselected" href="#">K리그 1</a><a class="smenu" href="#">K리그 2</a>
</div>
<div class="page-content">
	<!-- 월 별 매치 일정 -->
	<div class="matchInMonth">
		<i class="fas fa-caret-left"></i><span id="month">8월</span><i class="fas fa-caret-right"></i>
	</div>
	
<c:forEach var="matchday" items="${matchDaysInMonth}">
	<%-- 날짜 부분 --%>
	<div class="month-day">
		<span class="match-day"><fmt:formatDate value="${matchday}" pattern="yyyy/MM/dd (E)" /></span><br/>
	</div>
	<fmt:formatDate var="matchdate" value="${matchday}" pattern="MM/dd" />
	
	<%-- 해당 날짜와 맞는 매치 출력 --%>
<c:forEach var="match" items="${matchInMonth}">
<fmt:formatDate var="mdate" value="${match.mdate}" pattern="MM/dd"/>
<c:if test="${matchdate == mdate}">
	<table class="table dayMatchList">
		<tr>
			<td class="match-round">제 ${match.mround}라운드</td>
			<td class="match-team">
				${match.cname_short_h} <img src="${url}/resources/emblem/${match.ccode_home}.png" />
				<c:if test="${match.mstatus == 0}"><%-- 경기전 --%>
				<span class="matchtime"><fmt:formatDate value="${match.mdate}" pattern="HH:mm" /></span>
				</c:if>
				<c:if test="${match.mstatus == 1}"><%-- 경기종료 --%>
				<span class="matchscore">${match.homescore}:${match.awayscore}</span>
				</c:if>
				<img src="${url}/resources/emblem/${match.ccode_away}.png" /> ${match.cname_short_a} 
			</td>
			<td class="match-stadium">${match.sname}</td>
			<td class="match-btn" align="right">
			<c:if test="${match.mstatus == 0}"><%-- 경기전 --%>
				<button class="btn btn-warning" type="button">전력비교 &gt;</button>
				
			<fmt:formatDate var="today" value="${sysdate}" pattern="yyyy/MM/dd"/>
			${today}
			<fmt:parseDate var="dtoday" value="${today}" pattern="yyyy/MM/dd"/>
			${dtoday}
			<fmt:parseNumber var="ntoday" value="${sysdate}" integerOnly="true" />
			${ntoday}
				<button class="btn btn-info" type="button">경기예매 &gt;</button>
			</c:if>
			<c:if test="${match.mstatus == 1}"><%-- 경기종료 --%>
				<button class="btn btn-danger" type="button">경기결과 &gt;</button>
			</c:if>
			</td>
		</tr>
	</table>
</c:if>
</c:forEach>
</c:forEach>
<hr>	
	
	
	
	
	
	
</div>
<%@ include file="footer.jsp"%>