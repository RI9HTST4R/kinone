<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<style>
.pagetitle {
	background-color: navy;
	position: relative;
}
#mstadium {
	color: white;
	font-size: 18pt;
	margin-right: 20px;
	position: relative;
	line-height: normal;
}
.page-content {
	/* border: 1px solid red; */
	height: auto;
	width: 100%;
	margin-top: 20px;
	padding-bottom: 20px;
	overflow: auto;
	font-size: 0;
}
#hometeam, #versus, #awayteam {
	/* border: 1px solid red; */
	display: inline-block;
	vertical-align: top;
}
#versus {
	
	line-height: 300px;
}
.lineup-top {
	margin-bottom: 70px;
}
.teamname {
	font-size: 25pt;
	font-weight: bold;
}
.playerlist {
	/* border: 1px solid blue; */
}
.start-lineup, .sub-lineup {
	text-align: center;
}
.sub-lineup {
	margin-top: 30px;
}
.player {
	font-size: 15pt;
	margin: 10px 0 10px 0;
	/* border-bottom: 1px solid lightgray; */
}
.pinfo, .pimage {
	display: inline-block;
}
.pinfo {
	margin: 0 10px 0 10px;
}
.pimage {
	width: 100px;
	height: 100px;
	vertical-align: top;
}
span.GK, span.DF, span.MF, span.FW {
	font-weight: bold;
}
span.GK {
	color: yellow;
}
span.DF {
	color: green;
}
span.MF {
	color: blue;
}
span.FW {
	color: red;
}
</style>
<div class="pagetitle">
	<c:if test='${match.lcode == "K1"}'>
	<span>&lt;K리그 1&gt; 제 ${match.mround}라운드 </span><br/>
	</c:if>
	<c:if test='${match.lcode == "K2"}'>
	<span>&lt;K리그 2&gt; 제 ${match.mround}라운드 </span><br/>
	</c:if>
	<span id="mstadium">${stadium} <fmt:formatDate value="${match.mdate}" pattern="MM.dd HH:mm"/></span>
</div>

<div class="page-content">

	<div id="hometeam" style="width: 40%;">
		<div class="lineup-top">
			<img src="${url}/resources/emblem/${match.ccode_home}.png" style="width: 200px; height: 200px;"/><br/><br/>
			<span class="teamname">${match.cname_short_h}</span>
		</div>
		<hr>
	<c:choose>
	<c:when test="${not empty lineup.hStarting and not empty lineup.hSubstitute}">
		<div class="playerlist">
			<div class="start-lineup">
				<br/>
			<c:forEach var="p" items="${lineup.hStarting}">
				<div class="player" align="right">
					<div class="pinfo">${p.pno}.${p.pname}<br/><span class="${p.position}">${p.position}</span></div><img class="pimage" src="${url}/resources/player/${p.pcode}.png"/>
				</div>
			</c:forEach>
			</div>
			<div class="sub-lineup">
				<h5 align="right">후보 라인업</h5>
				<br/>
			<c:forEach var="p" items="${lineup.hSubstitute}">
				<div class="player" align="right">
					<div class="pinfo">${p.pno}.${p.pname}<br/><span class="${p.position}">${p.position}</span></div><img class="pimage" src="${url}/resources/player/${p.pcode}.png"/>
				</div>
			</c:forEach>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<span style="font-size: 15pt; color: red;">공식 라인업이 등록되지 않았습니다.</span>
	</c:otherwise>
	</c:choose>
	</div>
	<div id="versus" style="width: 20%;">
		<div>
			<span>
				<c:if test="${match.mstatus == 0}">
					<span style="font-size: 40pt;">vs</span><br style="line-height: 5px;"/>
					<span style="font-size: 10pt;"></span>
				</c:if>
				<c:if test="${match.mstatus == 1}"><span style="font-size: 40pt; font-weight: bold;">${match.homescore} : ${match.awayscore}</span></c:if>
			</span>
		</div>
	</div>
	<div id="awayteam" style="width: 40%;">
		<div class="lineup-top">
			<img src="${url}/resources/emblem/${match.ccode_away}.png" style="width: 200px; height: 200px;"/><br/><br/>
			<span class="teamname">${match.cname_short_a}</span>
		</div>
		<hr>
	<c:choose>
	<c:when test="${not empty lineup.aStarting and not empty lineup.aSubstitute}">
		<div class="playerlist">
			<div class="start-lineup">
				<br/>
			<c:forEach var="p" items="${lineup.aStarting}">
				<div class="player" align="left">
					<img class="pimage" src="${url}/resources/player/${p.pcode}.png"/><div class="pinfo">${p.pno}.${p.pname}<br/><span class="${p.position}">${p.position}</span></div>
				</div>
			</c:forEach>
			</div>
			<div class="sub-lineup">
				<h5 align="left">후보 라인업</h5>
				<br/>
			<c:forEach var="p" items="${lineup.aSubstitute}">
				<div class="player" align="left">
					<img class="pimage" src="${url}/resources/player/${p.pcode}.png"/><div class="pinfo">${p.pno}.${p.pname}<br/><span class="${p.position}">${p.position}</span></div>
				</div>
			</c:forEach>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<span style="font-size: 15pt; color: red;">공식 라인업이 등록되지 않았습니다.</span>
	</c:otherwise>
	</c:choose>
	</div>
</div>
<script>

</script>
<%@ include file="footer.jsp" %>