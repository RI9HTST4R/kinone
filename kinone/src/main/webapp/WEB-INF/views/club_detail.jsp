<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>

<style>
.pagetitle {
	background-color: lightgray;
	height: 160px;
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
	width: 95%;
	margine: auto;
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

#club-minirank>.table, #club-parank>.table, #club-pgrank>.table {
	margin: 0;
	background-color: white;
	border: 1px solid lightgray;
}

#right-cont .table td, #right-cont .table th {
	text-align: center;
	vertical-align: middle;
}

#map-container {
	width: 90%;
}

.pimage {
	width: 100px;
	height: 125px;
}

.club-wrapper {
	padding: 5px;
	color: white;
	display: inline-block;
	margin: 10px;
	font-size: 15pt;
	height: 200px;
	width: 150px;
	background-color: skyblue;
}

.club-wrapper:hover {
	transform: scale(1.1);
	cursor: pointer;
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
	margin-bottom: 0;
	background-color: rgb(237, 239, 244);
	border-bottom: 1px solid rgba(0, 0, 0, .125);
}
</style>
<script type="text/javascript">

	 var T='${T}';
	$(function() {
		 if(T=="0"){ 
		$(".tab1").show();
		$(".tab2").hide();
		$(".tab3").hide();
	 }else if(T=="1"){
		 $('#pp').addClass("menuselected");
		 $('#cc').removeClass("menuselected");
		$(".tab1").hide();
		$(".tab2").show();
		$(".tab3").hide();
	} 
	
	});
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAO4YpxSmG1gH-Anhmz4hMLqaNQxPJZorw">
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
<div class="pagetitle">
	<img src="${url}/resources/emblem/${club.ccode}.png" width="130px"
		height="130px" /> <span style="font-size: 30pt; hegiht: 25px">${club.cname}</span><br />
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; <a class="smenu menuselected" id="cc"
		onClick="clubintro(this,'c')"
		style="color: white; cursor: pointer; font-size: 18pt">About
		${club.cname}</a> <a class="smenu" onClick="clubintro(this,'p')"
		style="color: white; cursor: pointer; font-size: 18pt" id=pp>선수단</a>
</div>
<div id="cont-container">
	<div id="left-cont" class="tab1">
		<div id="intro" align="justify">
			<h2>클럽 소개</h2>
			<br />
			<c:if test="${club.intro!=null}">
				<img src="${url}/resources/clubimage/${club.ccode}.jpg" width="90%" />
				<br />
				<br />
				<div style="font-size: 12pt; width: 90%;">${club.intro}</div>
			</c:if>
			<c:if test="${club.intro==null}">
				<img src="${url}/resources/clubimage/non.png" width="95%" />
			</c:if>
		</div>
		<br />
	<br/>
	<hr>
	<div id="stadium-map" align="justify">
		<br/>
		<h2>경기장(${club.sname}) 오시는 길</h2>
		<br/>
		<div id="googleMap" style="border: 1px solid lightgray; width: 90%; height: 500px;">
		
		</div>
	</div>
	

	
</div>
	<div id="left-cont" class="tab2">
		<c:forEach var="player" items="${playerList}" varStatus="cs">
			<div class="club-wrapper" align="center"
				onClick="location.href='${url}/player_detail.do?pcode=${player.pcode}'"
				<%-- "clubintro(this, '${player.pcode}')" --%>	>

				<c:if test="${player.photo!=null}">
					<img class="pimage"
						src="${url}/resources/player/${player.pcode}.png">
				</c:if>
				<c:if test="${player.photo==null}">
					<img class="pimage" src="${url}/resources/player/nop.png">
				</c:if>

				<br />
				<span style="font-weight: bold;"> ${player.pname}</span>
			</div>
		</c:forEach>

	</div>
	<div id="left-cont" class="tab3">
		<div class="card-header">선수 정보</div>


	</div>

	<div id="right-cont">
		<div id="pschedule">
			<div id="ptop">
				<h6 style="margin: 0;">최근 경기 결과</h6>
				<fmt:formatDate value="${prevMatch.mdate}" pattern="MM.dd E" />
			</div>
			<div id="pinfo">
				<span>${prevMatch.cname_short_h}</span> <img class="cont-emblem"
					src="${url}/resources/emblem/${prevMatch.ccode_home}.png" /> <a
					id="pscore" style="background-color: red;"
					href="matchDetail.do?mcode=${prevMatch.mcode}">${prevMatch.homescore}:${prevMatch.awayscore}</a>
				<img class="cont-emblem"
					src="${url}/resources/emblem/${prevMatch.ccode_away}.png" /> <span>${prevMatch.cname_short_a}</span>
			</div>
		</div>
		<div id="nschedule">
			<div id="ntop">
				<h6 style="margin: 0;">다음 경기 일정</h6>
				<fmt:formatDate value="${nextMatch.mdate}" pattern="MM.dd E" />
			</div>
			<div id="ninfo">
				<span>${nextMatch.cname_short_h}</span> <img class="cont-emblem"
					src="${url}/resources/emblem/${nextMatch.ccode_home}.png" /> <span
					id="ntime" style="background-color: #242e88;"><fmt:formatDate
						value="${nextMatch.mdate}" pattern="HH:mm" /></span> <img
					class="cont-emblem"
					src="${url}/resources/emblem/${nextMatch.ccode_away}.png" /> <span>${nextMatch.cname_short_a}</span>
			</div>
		</div>
		<div id="club-minirank">
			<h6 style="color: white; font-weight: bold; line-height: 2;">K리그
				순위</h6>
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
						<tr
							<c:if test="${cs.ccode == club.ccode}">style="outline: 2px solid orange;"</c:if>>
							<td>${cs.rno}</td>
							<td><img class="cont-emblem"
								src="${url}/resources/emblem/${cs.ccode}.png" /><span>${cs.cname_short}</span></td>
							<td>${cs.win+cs.draw+cs.lose}</td>
							<td>${cs.win*3+cs.draw}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div id="club-pgrank">
			<h6 style="color: white; font-weight: bold; line-height: 2;">선수
				득점 순위</h6>
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
							<td><img class="cont-player"
								src="${url}/resources/player/${ps.pcode}.png" /><span>${ps.pname}</span></td>
							<td>${ps.gamecount}</td>
							<td>${ps.result}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div id="club-parank">
			<h6 style="color: white; font-weight: bold; line-height: 2;">선수
				도움 순위</h6>
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
					<c:forEach var="ps" items="${psAList}">
						<tr>
							<td>${ps.soonwe}</td>
							<td><img class="cont-player"
								src="${url}/resources/player/${ps.pcode}.png" /><span>${ps.pname}</span></td>
							<td>${ps.gamecount}</td>
							<td>${ps.result}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script src="http://maps.googleapis.com/maps/api/js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDEM3FEmY5ecJzAkXH9TDRAs1MaXpSWtME"></script>
<script>
	var myCenter = new google.maps.LatLng(37.5682588, 126.89727740000001);

	function initialize() {
		var mapProp = {
			center : myCenter,
			zoom : 18,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};

		var map = new google.maps.Map(document.getElementById("map-container"),
				mapProp);

		var marker = new google.maps.Marker({
			position : myCenter,
			title : 'Click to zoom'
		});

		marker.setMap(map);

		// Zoom to 9 when clicking on marker
		google.maps.event.addListener(marker, 'click', function() {
			map.setZoom(9);
			map.setCenter(marker.getPosition());
		});
	}
	google.maps.event.addDomListener(window, 'load', initialize);

	function clubintro(obj, p) {
		$(obj).addClass("menuselected");
		if (p == 'c') {
			$(obj).next().removeClass("menuselected")
			$(".tab1").show();
			$(".tab2").hide();
			$(".tab3").hide();
		} else if (p == 'p') {
			$(obj).prev().removeClass("menuselected");
			$(".tab1").hide();
			$(".tab2").show();
			$(".tab3").hide();
		} else {
			
			$(".tab1").hide();
			$(".tab2").hide();
			$(".tab3").show();
		}
	}
	
</script>

<%@include file="footer.jsp"%>