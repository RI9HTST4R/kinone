<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>

<style>
.pagetitle {
	background-color: lightgray;
}
#cont-container {
	/* border: 1px solid red; */
	width: 100%;
	font-size: 0;
}
.cont-emblem, .cont-player {
	width: 35px;
	height: 35px;
	margin: 0 5px;
}
#left-cont {
	width: 75%;
	font-size: 15pt;
	display: inline-block;
	vertical-align: top;
	margin-top: 30px;
	padding-right: 30px;
}
#right-cont {
	display: inline-block;
}
#intro {
	/* border: 1px solid red; */
	width: 100%;
}
#stadium-map {
	/* border: 1px solid blue; */
	font-size: 20pt;
}
#right-cont {
	width: 25%;
	font-size: 15pt;
}
#right-cont .table td, #right-cont .table th {
	text-align: center;
	vertical-align: middle;
}
#pschedule, #nschedule, #club-minirank, #club-pgrank, #club-parank {
	border: 1px solid lightgray;
	margin: 30px 0 30px 0;
}
#ntop, #ptop {
	color: white;
	font-weight: bold;
	padding: 10px 0;
}
#ptop {
	background-color: #dd6f00;
}
#ntop {
	background-color: #242e88;
}
#ninfo, #pinfo {
	font-size: 13pt;
	padding: 10px 0;
	background-color: white;
}
#ntime, #pscore {
	border: 1px solid white;
	padding: 5px 10px 5px 10px;
	border-radius: 15px;
	font-size: 10pt;
	color: white;
}
#club-minirank, #club-pgrank, #club-parank {
	padding-top: 10px;
	border: none;
}
#club-minirank {
	background-color: maroon;
}
#club-pgrank, #club-parank {
	background-color: skyblue;
}
#club-minirank > .table, #club-parank > .table, #club-pgrank > .table {
	margin: 0;
	background-color: white;
	border: 1px solid lightgray;
}
#map-container {
	width: 90%;
}

</style>

<script type="text/javascript"
        src="http://maps.googleapis.com/maps/api/js?libraries=geometry&sensor=false&key=AIzaSyAO4YpxSmG1gH-Anhmz4hMLqaNQxPJZorw">
</script>
<script>
function initialize() {
  var mapProp = {
    center:new google.maps.LatLng(37.5682588, 126.89727740000001),
    zoom:16,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
}
google.maps.event.addDomListener(window, 'load', initialize);
</script>
<div class="pagetitle"><img src="${url}/resources/emblem/${club.ccode}.png" width="130px" height="130px"/> <span style="font-size: 30pt;">${club.cname}</span></div>

<div id="cont-container">
<div id="left-cont">
	<div id="intro" align="justify">
		<h2>클럽 소개</h2>
		<br/>
		<img src="${url}/resources/clubimage/${club.ccode}.jpg" width="90%"/>
		<br/><br/>
		<div style="font-size: 12pt; width: 90%;">${club.intro}</div>
	</div>
	<br/>
	<hr>
	<div id="stadium-map" align="justify">
		<br/>
		<h2>${club.sname} 오시는 길</h2>
		<br/>
		<div id="googleMap" style="border: 1px solid red;">
		
		</div>
	</div>
</div>
<div id="right-cont">
	<div id="pschedule">
		<div id="ptop">
			<h6 style="margin: 0;">최근 경기 결과</h6>
			<fmt:formatDate value="${prevMatch.mdate}" pattern="MM.dd E"/>
		</div>
		<div id="pinfo">
			<span>${prevMatch.cname_short_h}</span> <img class="cont-emblem" src="${url}/resources/emblem/${prevMatch.ccode_home}.png"/>
			<a id="pscore" style="background-color: red;" href="matchDetail.do?mcode=${prevMatch.mcode}">${prevMatch.homescore}:${prevMatch.awayscore}</a>
			<img class="cont-emblem" src="${url}/resources/emblem/${prevMatch.ccode_away}.png"/> <span>${prevMatch.cname_short_a}</span>
		</div>
	</div>
	<div id="nschedule">
		<div id="ntop">
			<h6 style="margin: 0;">다음 경기 일정</h6>
			<fmt:formatDate value="${nextMatch.mdate}" pattern="MM.dd E"/>
		</div>
		<div id="ninfo">
			<span>${nextMatch.cname_short_h}</span> <img class="cont-emblem" src="${url}/resources/emblem/${nextMatch.ccode_home}.png"/>
			<span id="ntime" style="background-color: #242e88;"><fmt:formatDate value="${nextMatch.mdate}" pattern="HH:mm"/></span>
			<img class="cont-emblem" src="${url}/resources/emblem/${nextMatch.ccode_away}.png"/> <span>${nextMatch.cname_short_a}</span>
		</div>
	</div>
	<div id="club-minirank">
		<h6 style="color: white; font-weight: bold; line-height: 2;">K리그 순위</h6>
		<table class="table">
			<thead>
				<tr>
					<th>순위</th>
					<th>클럽</th>
					<th>경기</th>
					<th>승점</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="cs" items="${csList}">
				<tr <c:if test="${cs.ccode == club.ccode}">style="outline: 2px solid orange;"</c:if>>
					<td>${cs.rno}</td>
					<td style="text-align: left;"><img class="cont-emblem" src="${url}/resources/emblem/${cs.ccode}.png"/><span>${cs.cname_short}</span></td>
					<td>${cs.win+cs.draw+cs.lose}</td>
					<td>${cs.win*3+cs.draw}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div id="club-pgrank">
		<h6 style="color: white; font-weight: bold; line-height: 2;">선수 득점 순위</h6>
		<table class="table" style="font-size: 10pt;">
			<thead>
				<tr>
					<th>순위</th>
					<th>이름</th>
					<th>경기</th>
					<th>득점</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="ps" items="${psGList}">
				<tr>
					<td>${ps.soonwe}</td>
					<td style="text-align: left;"><img class="cont-player" src="${url}/resources/player/${club.ccode}/${ps.pcode}.png"/><span>${ps.pname}</span></td>
					<td>${ps.gamecount}</td>
					<td>${ps.result}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div id="club-parank">
		<h6 style="color: white; font-weight: bold; line-height: 2;">선수 도움 순위</h6>
		<table class="table" style="font-size: 10pt;">
			<thead>
				<tr>
					<th>순위</th>
					<th>이름</th>
					<th>경기</th>
					<th>도움</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="ps" items="${psAList}">
				<tr>
					<td>${ps.soonwe}</td>
					<td style="text-align: left;"><img class="cont-player" src="${url}/resources/player/${club.ccode}/${ps.pcode}.png"/><span>${ps.pname}</span></td>
					<td>${ps.gamecount}</td>
					<td>${ps.result}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>

</div>

<%@include file="footer.jsp"%>