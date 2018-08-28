<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<style>
.pagetitle {
	background-color: maroon;
}
.form-container {
	margin: 20px 0 20px 0;
}
.form-control {
	display: inline-block;
	width: 200px;
}
.clubtable {
	/* border: 1px solid red; */
	margin-top: 30px;
	margin-bottom: 50px;
	text-align: center;
}
.rank-table > thead, .player-table-a > thead, .player-table-g > thead {
	background-color: #d9edf7;
}
.playertable{
	width: 100%;
	/* border: 1px solid blue; */
	font-size: 0;
	margin: 50px 0 30px 0;
}
.gtable, .atable {
	display: inline-block;
	width: 50%;
}
.player-table-a, .player-table-g {
	font-size: 10pt;
	text-align: center;
	border: 1px solid lightgray;
}
.player-table-a td, .player-table-g td {
	vertical-align: middle;
}
#mask {
  position:absolute;  
  z-index:9000; 
  background-color:#000;
  opacity: 0.5;  
  display: none;  
  background-image: url("/kinone/resources/images/loading2.gif");
  background-repeat: no-repeat;
  background-position: center;
}
</style>
<div id="mask"></div>
<div class="pagetitle"><span><i class="fas fa-th-list"></i> 클럽 순위 / 개인 기록 순위</span></div>

<div class="form-container" align="left">
	<form id="rankform" action="rankListAjax.do" method="post">
		<select name="seasoncode" class="form-control" onChange="changeList()">
			<c:forEach var="seasoncode" items="${seasonlist}">
			<option value="${seasoncode}">${seasoncode} 시즌</option>
			</c:forEach>
		</select>
		<select name="lcode" class="form-control" onChange="changeList()">
			<option value="K1">K리그 1</option>
			<option value="K2">K리그 2</option>
		</select>
	</form>
</div>

<div class="rank-container">
<div class="clubtable">
	<h5>클럽 리그 순위</h5>
	<table class="table table-hover rank-table">
		<thead>
		<tr>
			<th width="9%">순위</th>
			<th width="15%">클럽</th>
			<th width="9%">경기수</th>
			<th width="9%">승점</th>
			<th width="9%">승</th>
			<th width="9%">무</th>
			<th width="9%">패</th>
			<th width="9%">득점</th>
			<th width="9%">실점</th>
			<th width="13%">득실차</th>
		</tr>
		</thead>
		<tbody id="clubbody">
		<c:forEach var="clubseason" items="${clubSeasonRankList}" varStatus="s">
			<tr>
				<td>${s.count}</td>
				<td><img src="${url}/resources/emblem/${clubseason.ccode}.png" width="35px" height="35px"/> ${clubseason.cname_short}</td>
				<td>${clubseason.win + clubseason.draw + clubseason.lose}</td>
				<td>${clubseason.win * 3 + clubseason.draw}</td>
				<td>${clubseason.win}</td>
				<td>${clubseason.draw}</td>
				<td>${clubseason.lose}</td>
				<td>${clubseason.c_ggoal}</td>
				<td>${clubseason.c_lgoal}</td>
				<td>${clubseason.c_ggoal - clubseason.c_lgoal}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<hr>
<div class="playertable">
	<div class="gtable">
	<h5>개인 득점 순위</h5>
	<table class="table table-hover player-table-g">
		<thead>
		<tr>
			<th width="15%">순위</th>
			<th width="25%" colspan="2">선수명</th>
			<th width="15%">클럽</th>
			<th width="12%">득점</th>
			<th width="13%">경기수</th>
			<th width="20%">경기당득점</th>
		</tr>
		</thead>
		<tbody id="playerbodyg">
		<c:forEach var="player" items="${playerSeasonGRankList}" varStatus="s2">
		<tr>
			<td>${player.rno}</td>
			<td width="11%" style="padding-right: 0;"><img src="${url}/resources/player/FW말컹.png" width="35px" height="35px"/></td>
			<td style="padding-left: 0;">${player.pname}</td>
			<td>${player.cname_short}</td>
			<td>${player.p_ggoal}</td>
			<td>${player.gamecount}</td>
			<td><fmt:formatNumber value="${player.p_ggoal / player.gamecount}" type="number" pattern="#.##"/></td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	<div class="atable">
	<h5>개인 도움 순위</h5>
	<table class="table table-hover player-table-a">
		<thead>
		<tr>
			<th width="15%">순위</th>
			<th width="25%" colspan="2">선수명</th>
			<th width="15%">클럽</th>
			<th width="12%">도움</th>
			<th width="13%">경기수</th>
			<th width="20%">경기당도움</th>
		</tr>
		</thead>
		<tbody id="playerbodya">
		<c:forEach var="player" items="${playerSeasonARankList}" varStatus="s3">
		<tr>
			<td>${player.rno}</td>
			<td width="11%" style="padding-right: 0;"><img src="${url}/resources/player/FW말컹.png" width="35px" height="35px"/></td>
			<td style="padding-left: 0;">${player.pname}</td>
			<td>${player.cname_short}</td>
			<td>${player.p_assist}</td>
			<td>${player.gamecount}</td>
			<td><fmt:formatNumber value="${player.p_assist / player.gamecount}" type="number" pattern="#.##"/> </td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
</div>
</div>

<script>
	// 시즌, 리그를 바꿨을때
	function changeList(){
		wrapMask();
		var formdata = $("#rankform").serialize();
	//	alert(formdata);
		
		$.post("/kinone/rankListAjax.do", formdata, function(data){
			var clubarr = data.club;
			var playerg = data.player_g;
			var playera = data.player_a;
		//	alert(clubarr[0]);
		//	alert(playerg[0]);
		//	alert(playera[0]);
		
			clubRankTable(clubarr);
			playerRankTable(playerg, "g");
			playerRankTable(playera, "a");
			unwrapMask();
		});
	}
	
	// 클럽 리그 순위표 함수
	function clubRankTable(arr){
		var $cbody = $("#clubbody");
		$cbody.empty();
		$.each(arr, function(idx, club){
			var html = "";
			html += "<tr>";
			html += "<td>"+(idx+1)+"</td>";
			html += "<td><img src='/kinone/resources/emblem/"+club.ccode+".png' width='35px' height='35px'/> "+club.cname_short+"</td>";
			html += "<td>"+(club.win + club.draw + club.lose)+"</td>";
			html += "<td>"+(club.win * 3 + club.draw)+"</td>";
			html += "<td>"+club.win+"</td>";
			html += "<td>"+club.draw+"</td>";
			html += "<td>"+club.lose+"</td>";
			html += "<td>"+club.c_ggoal+"</td>";
			html += "<td>"+club.c_lgoal+"</td>";
			html += "<td>"+(club.c_ggoal - club.c_lgoal)+"</td>";
			html += "</tr>";
			$cbody.append(html);
		});
	}
	
	// 개인 리그 순위표 함수
	function playerRankTable(arr, sort){
		var $pbody = $("#playerbody"+sort);
		$pbody.empty();
		$.each(arr, function(idx, player){
			var html = "";
			html += "<tr>";
			html += "<td>"+(player.rno)+"</td>";
			html += "<td width='11%' style='padding-right: 0;'><img src='/kinone/resources/player/FW말컹.png' width='35px' height='35px'/></td>";
			html += "<td style='padding-left: 0;'>"+player.pname+"</td>"
			html += "<td>"+player.cname_short+"</td>";
			if(sort == "g"){
				html += "<td>"+player.p_ggoal+"</td>";
				html += "<td>"+player.gamecount+"</td>";
				html += "<td>"+Math.round((player.p_ggoal / player.gamecount)*100)/100+"</td>";
			}else if(sort == "a"){
				html += "<td>"+player.p_assist+"</td>";
				html += "<td>"+player.gamecount+"</td>";
				html += "<td>"+Math.round((player.p_assist / player.gamecount)*100)/100+"</td>";
			}
			html += "</tr>";
			$pbody.append(html);
		});
	}
	
	function wrapMask(){
		// 화면의 높이와 너비를 구한다.
		var $ms = $(".match-slide");
		var ttt = $ms.offset().top;
		var hhh = $ms.height();
		var toppoint = ttt+hhh+50; /* 시작점 */
	//	alert("toppoint:"+toppoint);
		var bottompoint = $(".wrap_footer").offset().top;
	//	alert("bottompoint:"+bottompoint);
		var maskWidth  = $(document).width();
		var maskHeight = bottompoint-toppoint;
	//	alert("maskHeight:"+maskHeight);
		// 마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		$('#mask').css({'width':maskWidth,'height':maskHeight, 'display':'inherit', 'left':'0', 'top': toppoint});
	}
	
	function unwrapMask(){
		$('#mask').css("display","none");
	}
</script>

<%@ include file="footer.jsp" %>